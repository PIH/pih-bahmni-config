'use strict';

angular.module('bahmni.common.displaycontrol.custom')
    .directive('birthCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
            var link = function ($scope) {
                console.log("inside birth certificate");
                var conceptNames = ["HIVTC, Chief Complaint"];
                $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/birthCertificate.html";
                spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                    $scope.observations = response.data;
                }));
            };

            return {
                restrict: 'E',
                template: '<ng-include src="contentUrl"/>',
                link: link
            }
    }]).directive('deathCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
        var link = function ($scope) {
            var conceptNames = ["WEIGHT"];
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathCertificate.html";
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                $scope.observations = response.data;
            }));
        };

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>'
        }
    }]).directive('artVisitFlowSheet', ['$translate', 'spinner', 'observationsService', 'appService', 'conceptSetService', '$q', 'conceptSetUiConfigService',
    function ($translate, spinner, observationsService, appService, conceptSetService, $q, conceptSetUiConfigService) {
        var link = function ($scope, element) {
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/artVisitFlowSheet.html";
           // $scope.config = $scope.isOnDashboard ? $scope.section.dashboardConfig : $scope.section.expandedViewConfig;
            $scope.isEditable = $scope.config.isEditable;
            var patient = $scope.patient;

            var getTemplateDisplayName = function () {
                return conceptSetService.getConcept({
                    name: $scope.config.templateName,
                    v: "custom:(uuid,names,displayString)"
                }).then(function (result) {
                    var templateConcept = result && result.data && result.data.results && result.data.results[0];
                    var displayName = templateConcept && templateConcept.displayString;
                    if (templateConcept && templateConcept.names && templateConcept.names.length === 1 && templateConcept.names[0].name != "") {
                        displayName = templateConcept.names[0].name;
                    }
                    else if (templateConcept && templateConcept.names && templateConcept.names.length === 2) {
                        displayName = _.find(templateConcept.names, {conceptNameType: "SHORT"}).name;
                    }
                    $scope.conceptDisplayName = displayName;
                })
            };

            var getObsInFlowSheet = function () {
                return observationsService.getObsInFlowSheet(patient.uuid, $scope.config.templateName,
                    $scope.config.groupByConcept, $scope.config.conceptNames, $scope.config.numberOfVisits,
                    $scope.config.initialCount, $scope.config.latestCount, $scope.config.type, $scope.config.startDate,
                    $scope.config.endDate, $scope.enrollment).success(function (data) {
                    var obsInFlowSheet = data;
                    if ( obsInFlowSheet.rows ) {
                        if ( $scope.config.orderByConcept ) {
                            obsInFlowSheet.rows = _.sortBy(obsInFlowSheet.rows, function(row) {
                                var sortByColumn = _.find(row.columns, function(column) {
                                    return _.find(column, function(concept){
                                        return concept.concept.name ===  $scope.config.orderByConcept;
                                    });
                                });
                                if (sortByColumn && sortByColumn.length > 0) {
                                    return sortByColumn[0].value;
                                }
                            }).reverse();
                        }
                    }
                    var groupByElement = _.find(obsInFlowSheet.headers, function (header) {
                        return header.name === $scope.config.groupByConcept;
                    });
                    obsInFlowSheet.headers = _.without(obsInFlowSheet.headers, groupByElement);
                    obsInFlowSheet.headers.unshift(groupByElement);
                    $scope.obsTable = obsInFlowSheet;
                })
            };

            var init = function () {
                return $q.all([getObsInFlowSheet(), getTemplateDisplayName()]).then(function () {
                });
            };

            $scope.isClickable = function () {
                return $scope.isOnDashboard && $scope.expandedViewConfig;
            };

            $scope.dialogData = {
                "patient": $scope.patient,
                "section": $scope.section
            };

            $scope.getEditObsData = function (observation) {
                return {
                    observation: {encounterUuid: observation.encounterUuid, uuid: observation.obsGroupUuid},
                    conceptSetName: $scope.config.templateName,
                    conceptDisplayName: $scope.conceptDisplayName
                }
            };

            $scope.getPivotOn = function () {
                return $scope.config.pivotOn;
            };

            $scope.getHeaderName = function (header) {
                var abbreviation = getSourceCode(header, $scope.config.headingConceptSource);
                var headerName = abbreviation || header.shortName || header.name;
                if (header.units) {
                    headerName = headerName +  " (" + header.units + ")";
                }
                return headerName;
            };

            var getSourceCode = function (concept, conceptSource) {
                var result;
                if (concept && concept.mappings && concept.mappings.length > 0) {
                    result = _.result(_.find(concept.mappings, {"source": conceptSource}), "code");
                    result = $translate.instant(result);
                }

                return result;
            };

            var getName = function (obs) {
                return getSourceCode(obs.value, $scope.config.dataConceptSource) || (obs && obs.value && obs.value.shortName) || (obs && obs.value && obs.value.name) || obs.value;
            };

            $scope.commafy = function (observations) {
                var list = [];
                var unBoolean = function (boolValue) {
                    return boolValue ? $translate.instant("OBS_BOOLEAN_YES_KEY") : $translate.instant("OBS_BOOLEAN_NO_KEY");
                };

                for (var index in observations) {
                    var name = getName(observations[index]);

                    if (observations[index].concept.dataType === "Boolean") {
                        name = unBoolean(name);
                    }

                    if (observations[index].concept.dataType === "Date") {
                        var conceptName = observations[index].concept.name;
                        if (conceptName && conceptSetUiConfigService.getConfig()[conceptName] && conceptSetUiConfigService.getConfig()[conceptName].displayMonthAndYear == true) {
                            name = Bahmni.Common.Util.DateUtil.getDateInMonthsAndYears(name);
                        }
                        else {
                            name = Bahmni.Common.Util.DateUtil.formatDateWithoutTime(name);
                        }

                    }

                    list.push(name);
                }

                return list.join(', ');
            };

            $scope.isMonthAvailable = function () {
                return $scope.obsTable.rows[0].columns['Month'] != null
            };

            spinner.forPromise(init(), element);
        };
        return {
            restrict: 'E',
            template: '<ng-include src="contentUrl"/>',
            link: link
        };
    }]).directive('mastercardHeader', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        // var conceptNames = ["Date Confirmed HIV+", "HIV Type", "Initial Assessment, Date", "Height"];
        var conceptNames = ["ART Mastercard"];
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/mastercardHeader.html";
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            $scope.bahmniObservations = response.data;
        }));
    };

    return {
        restrict: 'E',
        template: '<ng-include src="contentUrl"/>',
        link: link
    }
}]).directive('pihPrograms', ['programService', 'appService', '$state','spinner',
    function (programService, appService, $state, spinner) {
        var controller = function ($scope, retrospectiveEntryService, $window, programService,
                                   spinner, messagingService, $stateParams, $q, confirmBox) {
            var DateUtil = Bahmni.Common.Util.DateUtil;
            $scope.programSelected = {};
            $scope.workflowStateSelected = {};
            $scope.allPrograms = [];
            $scope.programWorkflowStates = [];
            $scope.programEdited = {selectedState: ""};
            $scope.workflowStatesWithoutCurrentState = [];
            $scope.outComesForProgram = [];
            $scope.configName = $stateParams.configName;
            $scope.today = DateUtil.getDateWithoutTime(DateUtil.now());
            var id = "#programEnrollmentContainer";

            var updateActiveProgramsList = function () {
                spinner.forPromise(programService.getPatientPrograms($scope.patient.uuid).then(function (programs) {
                    $scope.activePrograms = programs.activePrograms;
                    $scope.activePrograms.showProgramSection = true;

                    $scope.endedPrograms = programs.endedPrograms;
                    $scope.endedPrograms.showProgramSection = true;
                }).then(function() {
                    formatProgramDates();
                }), id);
            };

            var formatProgramDates = function() {
                _.each($scope.activePrograms, function(activeProgram) {
                    activeProgram.fromDate = Bahmni.Common.Util.DateUtil.parseLongDateToServerFormat(activeProgram.dateEnrolled);
                    activeProgram.toDate = Bahmni.Common.Util.DateUtil.parseLongDateToServerFormat(activeProgram.dateCompleted);
                });
                _.each($scope.endedPrograms, function(endedProgram) {
                    endedProgram.fromDate = Bahmni.Common.Util.DateUtil.parseLongDateToServerFormat(endedProgram.dateEnrolled);
                    endedProgram.toDate = Bahmni.Common.Util.DateUtil.parseLongDateToServerFormat(endedProgram.dateCompleted);
                })
            };

            var getCurrentDate = function () {
                var retrospectiveDate = retrospectiveEntryService.getRetrospectiveDate();
                return DateUtil.parseLongDateToServerFormat(retrospectiveDate);
            };

            var init = function () {
                spinner.forPromise(programService.getAllPrograms().then(function(programs) {
                    $scope.allPrograms = programs;
                    $scope.allPrograms.showProgramSection = true;
                }), id);
                spinner.forPromise(programService.getProgramAttributeTypes().then(function (programAttributeTypes) {
                    $scope.programAttributeTypes = programAttributeTypes;
                }), id);
                $scope.programSelected = null;
                $scope.patientProgramAttributes = {};
                $scope.programEnrollmentDate = null;

                updateActiveProgramsList();
            };

            var successCallback = function () {
                messagingService.showMessage("info", "CLINICAL_SAVE_SUCCESS_MESSAGE_KEY");
                $scope.programEdited.selectedState = null;
                $scope.programSelected = null;
                $scope.workflowStateSelected = null;
                $scope.patientProgramAttributes = {};
                $scope.programEnrollmentDate = null;
                updateActiveProgramsList();
                if($scope.patientProgram) {
                    $scope.patientProgram.editing = false;
                }
            };

            var failureCallback = function (error) {
                var fieldErrorMsg = findFieldErrorIfAny(error);
                var errorMsg = _.isUndefined(fieldErrorMsg) ? "Failed to Save" : fieldErrorMsg;
                messagingService.showMessage("error", errorMsg);
            };

            var findFieldErrorIfAny = function (error) {
                var stateFieldError = objectDeepFind(error, "data.error.fieldErrors.states");
                var errorField = stateFieldError && stateFieldError[0];
                return errorField && errorField.message;
            };

            var objectDeepFind = function(obj, path) {
                if(_.isUndefined(obj)){
                    return undefined;
                }
                var paths = path.split('.'), current = obj, i;
                for (i = 0; i < paths.length; ++i) {
                    if (current[paths[i]] == undefined) {
                        return undefined;
                    } else {
                        current = current[paths[i]];
                    }
                }
                return current;
            };

            var isThePatientAlreadyEnrolled = function () {
                return _.map($scope.activePrograms, function (program) {
                        return program.program.uuid
                    }).indexOf($scope.programSelected.uuid) > -1;
            };

            var isProgramSelected = function () {
                return $scope.programSelected && $scope.programSelected.uuid;
            };

            $scope.hasPatientEnrolledToSomePrograms = function () {
                return !_.isEmpty($scope.activePrograms);
            };

            $scope.hasPatientAnyPastPrograms = function () {
                return !_.isEmpty($scope.endedPrograms);
            };

            $scope.enrollPatient = function () {
                if (!isProgramSelected()) {
                    messagingService.showMessage("error", "PROGRAM_MANAGEMENT_SELECT_PROGRAM_MESSAGE_KEY");
                    return $q.when({});
                }
                if (isThePatientAlreadyEnrolled()) {
                    messagingService.showMessage("error", "PROGRAM_MANAGEMENT_ALREADY_ENROLLED_PROGRAM_MESSAGE_KEY");
                    return $q.when({});
                }
                var stateUuid = $scope.workflowStateSelected && $scope.workflowStateSelected.uuid ? $scope.workflowStateSelected.uuid : null;
                return spinner.forPromise(
                    programService.enrollPatientToAProgram($scope.patient.uuid, $scope.programSelected.uuid, $scope.programEnrollmentDate, stateUuid, $scope.patientProgramAttributes, $scope.programAttributeTypes)
                        .then(successCallback, failureCallback)
                );
            };

            var isProgramStateSelected = function () {
                return objectDeepFind($scope, "programEdited.selectedState.uuid");
            };

            var isOutcomeSelected = function (patientProgram) {
                return !_.isEmpty(objectDeepFind(patientProgram, 'outcomeData.uuid'));
            };

            var getActiveState = function(states){
                return _.find(states, function(state){
                    return state.endDate == null && !state.voided;
                });
            };

            $scope.getWorkflowStatesWithoutCurrent = function (patientProgram) {
                var currentState = getActiveState(patientProgram.states);
                var states = getStates(patientProgram.program);
                if (currentState) {
                    states = _.reject(states, function (state) {
                        return state.uuid === currentState.state.uuid;
                    });
                }
                return states;
            };

            $scope.updatePatientProgram = function (patientProgram){
                $scope.patientProgram = patientProgram;
                var activeState = getActiveState(patientProgram.states);
                var activeStateDate = activeState ? DateUtil.parse(activeState.startDate) : null;
                var dateCompleted = null;

                if(isProgramStateSelected()){
                    var startDate = getCurrentDate();
                    if (activeState && DateUtil.isBeforeDate(startDate, activeStateDate)) {
                        messagingService.showMessage("error", "PROGRAM_MANAGEMENT_STATE_CANT_START_BEFORE_KEY" + " (" + DateUtil.formatDateWithoutTime(activeStateDate) + ")");
                        return;
                    }
                    if($scope.programEdited.selectedState.uuid){
                        patientProgram.states.push({
                                state: {
                                    uuid: $scope.programEdited.selectedState.uuid
                                },
                                startDate: startDate
                            }
                        );
                    }
                }
                if(isOutcomeSelected(patientProgram)){
                    dateCompleted = DateUtil.getDateWithoutTime(getCurrentDate());
                    if (activeState && DateUtil.isBeforeDate(dateCompleted, activeStateDate)) {
                        messagingService.showMessage("error", "PROGRAM_MANAGEMENT_PROGRAM_CANT_END_BEFORE_KEY" + " (" + DateUtil.formatDateWithoutTime(activeStateDate) + ")");
                        return;
                    }

                }
                spinner.forPromise(
                    programService.updatePatientProgram(patientProgram, $scope.programAttributeTypes, dateCompleted)
                        .then(successCallback, failureCallback)
                );
            };

            var voidPatientProgram = function (patientProgram,closeConfirmBox) {
                patientProgram.voided = true;
                var promise = programService.updatePatientProgram(patientProgram, $scope.programAttributeTypes)
                    .then(successCallback, failureCallback)
                    .then(closeConfirmBox);
                spinner.forPromise(promise);
            };

            var unVoidPatientProgram = function (patientProgram,closeConfirmBox) {
                delete patientProgram.voidReason;
                delete patientProgram.voided;
                patientProgram.deleting = false;
                closeConfirmBox();
            };

            $scope.confirmDeletion = function (patientProgram) {
                var scope = {};
                scope.message = 'Are you sure, you want to delete ' + patientProgram.display + '?';
                scope.cancel = _.partial(unVoidPatientProgram,patientProgram,_);
                scope.delete = _.partial(voidPatientProgram,patientProgram,_);
                confirmBox({
                    scope: scope,
                    actions: ['cancel', 'delete'],
                    className:"ngdialog-theme-default delete-program-popup"
                });
            };

            $scope.toggleDelete = function (program) {
                program.deleting = !program.deleting;
            };

            $scope.toggleEdit = function (program) {
                $scope.tempProgram = angular.copy(program);
                program.editing = !program.editing;
            };

            $scope.cancelChange = function (program) {
                program.patientProgramAttributes = $scope.tempProgram.patientProgramAttributes;
                program.editing = !program.editing;
            };

            $scope.setWorkflowStates = function (program) {
                $scope.programWorkflowStates = getStates(program);
                $scope.programSelected = program;
            };

            $scope.setWorkflowStateSelected  = function (state) {
                $scope.workflowStateSelected = state;
            };
            
            $scope.setProgramEnrollmentDate = function (date) {
                $scope.programEnrollmentDate = date;
            };

            var getStates = function (program) {
                var states = [];
                if (program && program.allWorkflows && program.allWorkflows.length && program.allWorkflows[0].states.length) {
                    states = program.allWorkflows[0].states;
                }
                return states;
            };
            var getActiveProgramStates = function(patientProgram){
                return _.reject(patientProgram.states, function(st) {return st.voided});
            };

            $scope.canRemovePatientState = function(state){
                return state.endDate == null;
            };

            $scope.removePatientState = function(patientProgram){
                var currProgramState = _.find(getActiveProgramStates(patientProgram), {endDate: null});
                var currProgramStateUuid = objectDeepFind(currProgramState, 'uuid');
                spinner.forPromise(
                    programService.deletePatientState(patientProgram.uuid, currProgramStateUuid)
                        .then(successCallback, failureCallback)
                );
            };

            $scope.hasStates = function (program) {
                return program && !_.isEmpty(program.allWorkflows) && !_.isEmpty($scope.programWorkflowStates)
            };

            $scope.hasProgramWorkflowStates = function (patientProgram) {
                return !_.isEmpty(getStates(patientProgram.program));
            };

            $scope.hasOutcomes = function (program) {
                return program.outcomesConcept && !_.isEmpty(program.outcomesConcept.setMembers);
            };

            $scope.getCurrentStateDisplayName = function(program){
                var currentState = getActiveState(program.states);
                return _.get(currentState,'state.concept.display');
            };

            $scope.getMaxAllowedDate = function (states) {
                var minStartDate = DateUtil.getDateWithoutTime(new Date());
                if (states && Array.isArray(states)) {
                    for (var stateIndex = 0; stateIndex < states.length; stateIndex++) {
                        if (states[stateIndex].startDate < minStartDate) {
                            minStartDate = states[stateIndex].startDate;
                        }
                    }
                }
                return minStartDate;
            };

            init();
        };

        var link = function ($scope, element) {
            spinner.forPromise($scope.initialization, element);
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/pihPrograms.html";
        };

        return {
            restrict: 'E',
            template: '<ng-include src="contentUrl"/>',
            link: link,
            controller: controller
        }
    }]).directive('deathCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["WEIGHT"];
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathCertificate.html";
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
        }));
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('customTreatmentChart', ['appService', 'treatmentConfig', 'TreatmentService', 'spinner', '$q', function (appService, treatmentConfig, treatmentService, spinner, $q) {
    var link = function ($scope) {
        var Constants = Bahmni.Clinical.Constants;
        var days = [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday'
        ];
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/customTreatmentChart.html";

        $scope.atLeastOneDrugForDay = function (day) {
            var atLeastOneDrugForDay = false;
            $scope.ipdDrugOrders.getIPDDrugs().forEach(function (drug) {
                if (drug.isActiveOnDate(day.date)) {
                    atLeastOneDrugForDay = true;
                }
            });
            return atLeastOneDrugForDay;
        };

        $scope.getVisitStopDateTime = function () {
            return $scope.visitSummary.stopDateTime || Bahmni.Common.Util.DateUtil.now();
        };

        $scope.getStatusOnDate = function (drug, date) {
            var activeDrugOrders = _.filter(drug.orders, function (order) {
                if ($scope.config.frequenciesToBeHandled.indexOf(order.getFrequency()) !== -1) {
                    return getStatusBasedOnFrequency(order, date);
                } else {
                    return drug.getStatusOnDate(date) === 'active';
                }
            });
            if (activeDrugOrders.length === 0) {
                return 'inactive';
            }
            if (_.every(activeDrugOrders, function (order) {
                    return order.getStatusOnDate(date) === 'stopped';
                })) {
                return 'stopped';
            }
            return 'active';
        };

        var getStatusBasedOnFrequency = function (order, date) {
            var activeBetweenDate = order.isActiveOnDate(date);
            var frequencies = order.getFrequency().split(",").map(function (day) {
                return day.trim();
            });
            var dayNumber = moment(date).day();
            return activeBetweenDate && frequencies.indexOf(days[dayNumber]) !== -1;
        };

        var init = function () {
            var getToDate = function () {
                return $scope.visitSummary.stopDateTime || Bahmni.Common.Util.DateUtil.now();
            };

            var programConfig = appService.getAppDescriptor().getConfigValue("program") || {};

            var startDate = null, endDate = null, getEffectiveOrdersOnly = false;
            if (programConfig.showDetailsWithinDateRange) {
                startDate = $stateParams.dateEnrolled;
                endDate = $stateParams.dateCompleted;
                if (startDate || endDate) {
                    $scope.config.showOtherActive = false;
                }
                getEffectiveOrdersOnly = true;
            }

            return $q.all([treatmentConfig(), treatmentService.getPrescribedAndActiveDrugOrders($scope.config.patientUuid, $scope.config.numberOfVisits,
                $scope.config.showOtherActive, $scope.config.visitUuids || [], startDate, endDate, getEffectiveOrdersOnly)])
                .then(function (results) {
                    var config = results[0];
                    var drugOrderResponse = results[1].data;
                    var createDrugOrderViewModel = function (drugOrder) {
                        return Bahmni.Clinical.DrugOrderViewModel.createFromContract(drugOrder, config);
                    };
                    for (var key in drugOrderResponse) {
                        drugOrderResponse[key] = drugOrderResponse[key].map(createDrugOrderViewModel);
                    }

                    var groupedByVisit = _.groupBy(drugOrderResponse.visitDrugOrders, function (drugOrder) {
                        return drugOrder.visit.startDateTime;
                    });
                    var treatmentSections = [];

                    for (var key in groupedByVisit) {
                        var values = Bahmni.Clinical.DrugOrder.Util.mergeContinuousTreatments(groupedByVisit[key]);
                        treatmentSections.push({visitDate: key, drugOrders: values});
                    }
                    if (!_.isEmpty(drugOrderResponse[Constants.otherActiveDrugOrders])) {
                        var mergedOtherActiveDrugOrders = Bahmni.Clinical.DrugOrder.Util.mergeContinuousTreatments(drugOrderResponse[Constants.otherActiveDrugOrders]);
                        treatmentSections.push({
                            visitDate: Constants.otherActiveDrugOrders,
                            drugOrders: mergedOtherActiveDrugOrders
                        });
                    }
                    $scope.treatmentSections = treatmentSections;
                    if ($scope.visitSummary) {
                        $scope.ipdDrugOrders = Bahmni.Clinical.VisitDrugOrder.createFromDrugOrders(drugOrderResponse.visitDrugOrders, $scope.visitSummary.startDateTime, getToDate());
                    }
                });
        };
        spinner.forPromise(init());
    };

    return {
        restrict: 'E',
        link: link,
        scope: {
            config: "=",
            visitSummary: '='
        },
        template: '<ng-include src="contentUrl"/>'
    }
}]);
