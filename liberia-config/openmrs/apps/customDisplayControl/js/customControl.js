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
        console.log("inside mastercard header");
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
