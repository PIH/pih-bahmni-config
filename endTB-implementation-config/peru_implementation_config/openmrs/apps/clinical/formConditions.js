Bahmni.ConceptSet.FormConditions.rulesOverride  = {
'Baseline, Has the patient ever been treated for TB in the past?': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, Has the patient ever been treated for TB in the past?'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, If Yes, What was the year of the patients start of first TB treatment Details", "Baseline, Treatment for drug-susceptible TB", "Baseline, Treatment for drug-resistant TB")
        } else  {
            conditions.disable.push("Baseline, If Yes, What was the year of the patients start of first TB treatment Details", "Baseline, Treatment for drug-susceptible TB", "Baseline, Treatment for drug-resistant TB")
        }
        return conditions;
    },
'TI, Did the patient start treatment': function (formName, formFieldValues) {
        var enStartDate = "TUBERCULOSIS DRUG TREATMENT START DATE";
        var enReason = "TI, Reason for not starting treatment";
        var txFacility = "TI, Treatment facility at start";
        var conditionConcept = formFieldValues['TI, Did the patient start treatment'];
        if (conditionConcept == false) {
            return {enable: [enReason], disable: [enStartDate, txFacility]}
        } else if (conditionConcept == true) {
            return {enable: [enStartDate, txFacility], disable: [enReason]}
        }
        else {
            return {disable: [enStartDate, txFacility, enReason]}
        }
    },
    'TI, Type of treatment regimen': function (formName, formFieldValues) {
        var txRegimen = "TI, Type of treatment regimen";
        var firstLine = "TI, First line drug regimen type";
        var secondLine = "TI, Second line regimen drug type";
        var conditionConcept = formFieldValues['TI, Type of treatment regimen'];
        if (conditionConcept == 'Only 1st line drugs') {
            return {enable: [firstLine], disable: [secondLine]}
        } else if (conditionConcept == 'Regimen including 2nd line drugs') {
            return {enable: [secondLine], disable: [firstLine]}
        } else {
            return {disable: [firstLine, secondLine]}
        }
    },
'Bacteriology, HAIN MTBDRsl test result': function (formName, formFieldValues) {
        var fluoroquinoloneconceptToEnable = "Bacteriology, Fluoroquinolone";
        var aminoglycosideconceptToEnable = "Bacteriology, MTBDRsl injectable"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRsl test result'];
        if (conditionConcept == "Detected") {
            conditions.enable.push(fluoroquinoloneconceptToEnable)
            conditions.enable.push(aminoglycosideconceptToEnable)
        } else {
            conditions.disable.push(fluoroquinoloneconceptToEnable)
            conditions.disable.push(aminoglycosideconceptToEnable)
        }
        return conditions;
},
                            
'Baseline, HIV serostatus result': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, HIV serostatus result'];
        if (conditionConcept == "Positive") {
            conditions.enable.push("Date of HIV diagnosis", "Baseline, CD4 count details", "CD4 date", "Baseline, HIV Viral Load Details","RNA If undetactable is yes, Viral load result", "Baseline, Viral Load Date", "Antiretroviral treatment start date", "Baseline, On ARV treatment", "Baseline, Drugs used in ARV treatment")
        } else {
            conditions.disable.push("Date of HIV diagnosis", "Baseline, CD4 count details", "CD4 date", "Baseline, HIV Viral Load Details", "RNA If undetactable is yes, Viral load result", "Baseline, Viral Load Date", "Antiretroviral treatment start date", "Baseline, On ARV treatment", "Baseline, Drugs used in ARV treatment")
        }
        return conditions;
    },
'SAE Form, Previously reported as AE': function (formName, formFieldValues) {
        var previousAE = "SAE Form, AE ID if previously reported as AE";
        var conditions = {enable: [], disable: []};
        var PreviouslyReportedAE = formFieldValues['SAE Form, Previously reported as AE'];
        if (PreviouslyReportedAE == true) {
            conditions.enable.push(previousAE)
        } else {
            conditions.enable.push(previousAE)
        }
        return conditions;
    },
'Baseline, Start date of past TB treatment': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, End date of past TB treatment", "Baseline, Type of past TB treatment", "Baseline, Past TB treatment regimen type", "Baseline, Past TB treatment drug regimen", "Baseline, Registration number of past TB treatment", "Baseline, Past TB treatment outcome", "Baseline, Place treatment started", "Baseline, Is the start date of past TB treatment estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Start date of past TB treatment'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, End date of past TB treatment': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the end date of past TB treatment estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, End date of past TB treatment'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the start date of past TB treatment estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the day of start date of past TB treatment estimated", "Baseline, Is the month of start date of past TB treatment estimated", "Baseline, Is the year of start date of past TB treatment estimated"  ];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the start date of past TB treatment estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the end date of past TB treatment estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the day of end date of past TB treatment", "Baseline, Is the month of end date of past TB treatment", "Baseline, Is the year of end date of past TB treatment" ];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the end date of past TB treatment estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'CD4 date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the CD4 date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['CD4 date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the CD4 date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is CD4 date day estimated", "Baseline, Is the month of  CD4 date estimated", "Baseline, Is the year CD4 date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the CD4 date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Viral Load Date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the viral load date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Viral Load Date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the viral load date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is viral load date day estimated", "Baseline, Is the month of viral load date estimated", "Baseline, Is the year of viral load date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the viral load date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Antiretroviral treatment start date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the ARV start date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Antiretroviral treatment start date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the ARV start date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the ARV start date day", "Baseline, Is the ARV start date month estimated", "Baseline, Is the ARV start date year estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the ARV start date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, MDR-TB Diagnosis Date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the MDR-TB diagnosis date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, MDR-TB Diagnosis Date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the MDR-TB diagnosis date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the day of MDR-TB diagnosis date estimated", "Baseline, Is the month of MDR-TB diagnosis date estimated", "Baseline, Is the year of MDR-TB diagnosis date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the MDR-TB diagnosis date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'TUBERCULOSIS DRUG TREATMENT START DATE': function (formName, formFieldValues) {
        var conceptToEnable = ["TI, Is the treatment start date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TUBERCULOSIS DRUG TREATMENT START DATE'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'TI, Is the treatment start date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["TI, Is the treatment start date day estimated", "TI, Is the treatment start date month estimated", "TI, Is the treatment start date year estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TI, Is the treatment start date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
     'TI, Date of death before treatment start': function (formName, formFieldValues) {
        var conceptToEnable = ["TI, Is the date of death before treatment start estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TI, Date of death before treatment start'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
},
 'Baseline, Start date of past TB treatment': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, End date of past TB treatment", "Baseline, Type of past TB treatment", "Baseline, Past TB treatment regimen type", "Baseline, Past TB treatment drug regimen", "Baseline, Registration number of past TB treatment", "Baseline, Past TB treatment outcome", "Baseline, Place treatment started", "Baseline, Is the start date of past TB treatment estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Start date of past TB treatment'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, End date of past TB treatment': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the end date of past TB treatment estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, End date of past TB treatment'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the start date of past TB treatment estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the day of start date of past TB treatment estimated", "Baseline, Is the month of start date of past TB treatment estimated", "Baseline, Is the year of start date of past TB treatment estimated"  ];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the start date of past TB treatment estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the end date of past TB treatment estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the day of end date of past TB treatment", "Baseline, Is the month of end date of past TB treatment", "Baseline, Is the year of end date of past TB treatment" ];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the end date of past TB treatment estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'CD4 date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the CD4 date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['CD4 date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the CD4 date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is CD4 date day estimated", "Baseline, Is the month of  CD4 date estimated", "Baseline, Is the year CD4 date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the CD4 date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Viral Load Date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the viral load date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Viral Load Date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the viral load date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is viral load date day estimated", "Baseline, Is the month of viral load date estimated", "Baseline, Is the year of viral load date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the viral load date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Antiretroviral treatment start date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the ARV start date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Antiretroviral treatment start date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the ARV start date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the ARV start date day", "Baseline, Is the ARV start date month estimated", "Baseline, Is the ARV start date year estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the ARV start date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, MDR-TB Diagnosis Date': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the MDR-TB diagnosis date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, MDR-TB Diagnosis Date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Baseline, Is the MDR-TB diagnosis date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Is the day of MDR-TB diagnosis date estimated", "Baseline, Is the month of MDR-TB diagnosis date estimated", "Baseline, Is the year of MDR-TB diagnosis date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is the MDR-TB diagnosis date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'TUBERCULOSIS DRUG TREATMENT START DATE': function (formName, formFieldValues) {
        var conceptToEnable = ["TI, Is the treatment start date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TUBERCULOSIS DRUG TREATMENT START DATE'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'TI, Is the treatment start date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["TI, Is the treatment start date day estimated", "TI, Is the treatment start date month estimated", "TI, Is the treatment start date year estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TI, Is the treatment start date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'TI, Is the date of death before treatment start estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["TI, Is the day of the date of death before start of treatment estimated", "TI, Is the month of the date of death before start of treatment estimated", "TI, Is the year of the date of death before start of treatment estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TI, Is the date of death before treatment start estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'AE Form, Date of AE onset': function (formName, formFieldValues) {
        var conceptToEnable = ["AE, Is the date of AE onset estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE Form, Date of AE onset'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'AE, Is the date of AE onset estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["AE, Is the day of AE onset date estimated", "AE, Is the month of AE onset date estimated", "AE, Is the year of AE onset date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE, Is the date of AE onset estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'AE Form, Date of AE report': function (formName, formFieldValues) {
        var conceptToEnable = ["AE, Is the date of AE report estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE Form, Date of AE report'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'AE, Is the date of AE report estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["AE, Is the day of AE report date estimate", "AE, Is the month of AE report date estimate", "AE, Is the year of AE report date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE, Is the date of AE report estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'AE Form, Date of AE Outcome': function (formName, formFieldValues) {
        var conceptToEnable = ["AE, Is the date of AE outcome estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE Form, Date of AE Outcome'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'AE, Is the date of AE outcome estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["AE, Is the day of AE outcome date estimated", "AE, Is the month of AE outcome date estimated", "AE, Is the year of AE outcome date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE, Is the date of AE outcome estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE Form, Event onset date': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the date of SAE onset estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE Form, Event onset date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE, Is the date of SAE onset estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the date of SAE onset day estimated", "SAE, Is the month of SAE onset date estimated", "SAE, Is the year of SAE onset date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE, Is the date of SAE onset estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE Form, Date of SAE report': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the date of SAE report estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE Form, Date of SAE report'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE, Is the date of SAE report estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the day of SAE report date estimated", "SAE, Is the month of SAE report date estimated", "SAE, Is the year of SAE report date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE, Is the date of SAE report estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE Form, Date event became serious': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the date when the adverse event became serious estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE Form, Date event became serious'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE, Is the date when the adverse event became serious estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the day when the event became serious estimated", "SAE, Is the month when the event became serious estimated", "SAE, Is the year when the event became serious estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE, Is the date when the adverse event became serious estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE Form, Event end date': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the date of SAE outcome estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE Form, Event end date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'SAE, Is the date of SAE outcome estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["SAE, Is the day of the SAE outcome date estimated", "SAE, Is the month of the SAE outcome date estimated", "SAE, Is the year of the SAE outcome date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['SAE, Is the date of SAE outcome estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'HDS, Hospital admission date': function (formName, formFieldValues) {
        var conceptToEnable = ["HDS, Is the hospital admission date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Hospital admission date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'HDS, Is the hospital admission date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["HDS, Is the day of the hospital admission date estimated", "HDS, Is the month of the hospital admission date estimated", "HDS, Is the year of the hospital admission date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Is the hospital admission date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'HDS, Hospital discharge date': function (formName, formFieldValues) {
        var conceptToEnable = ["HDS, Is the hospital discharge date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Hospital discharge date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'HDS, Is the hospital discharge date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["HDS, Is the day of the hospital discharge date estimated", "HDS, Is the month of the hospital discharge date estimated", "HDS, Is the year of the hospital discharge date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Is the hospital discharge date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of sample collection estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day for the date of sample collection estimated", "Bacteriology, Is the month of the date of sample collection estimated", "Bacteriology, Is the year for the date of sample collection estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of sample collection estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Date of AFB smear': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date Of AFB smear estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Date of AFB smear'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date Of AFB smear estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day for the AFB smear date estimated", "Bacteriology, Is the month for the AFB smear date estimated", "Bacteriology, Is the year for the AFB smear date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date Of AFB smear estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Date of Xpert test': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of Xpert test estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Date of Xpert test'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of Xpert test estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day for the xpert test date estimated", "Bacteriology, Is the month for the xpert test date estimated", "Bacteriology, Is the year for the xpert test date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of Xpert test estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, HAIN MTBDRplus test date': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of HAIN MTBDRplus test estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRplus test date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of HAIN MTBDRplus test estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day of the hain MTBDRplus test date estimated", "Bacteriology, Is the month of the hain MTBDRplus test date estimated", "Bacteriology, Is the year of the hain MTBDRplus test date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of HAIN MTBDRplus test estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, HAIN MTBDRsl test date': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of HAIN MTBDRsl test estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRsl test date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of HAIN MTBDRsl test estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day of hain MTBDRsl test date estimated", "Bacteriology, Is the month of hain MTBDRsl test date estimated", "Bacteriology, Is the year of hain MTBDRsl test date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of HAIN MTBDRsl test estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
},
'PRF, Date reporter made aware of pregnancy': function (formName, formFieldValues) {
        var conceptToEnable = ["PRF, Is the reporting date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Date reporter made aware of pregnancy'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'PRF, Is the reporting date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["PRF, Is the reporting date day estimated", "PRF, Is the reporting date month estimated", "PRF, Is the reporting date year estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Is the reporting date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
},
	'PRF, Estimated date of delivery': function (formName, formFieldValues) {
        var conceptToEnable = ["PRF, Is the date of delivery estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Estimated date of delivery'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'PRF, Is the date of delivery estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["PRF, Is the day of the date of delivery estimated", "PRF, Is the month of the date of delivery estimated", "PRF, Is the year of the date of delivery estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Is the date of delivery estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
	},
	'6m PTO, 6 month post treatment outcome date': function (formName, formFieldValues) {
        var conceptToEnable = ["6MPTO, Is the 6 month post treatment outcome date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['6m PTO, 6 month post treatment outcome date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    '6MPTO, Is the 6 month post treatment outcome date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["6MPTO, Is the day of the 6 month post treatment outcome date estimated", "6MPTO, Is the month of the 6 month post treatment outcome date estimated", "6MPTO, Is the year of the 6 month post treatment outcome date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['6MPTO, Is the 6 month post treatment outcome date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
	},
        'PRF, Is the date of delivery estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["PRF, Is the day of the date of delivery estimated", "PRF, Is the month of the date of delivery estimated", "PRF, Is the year of the date of delivery estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Is the date of delivery estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        },
        'Tuberculosis treatment end date': function (formName, formFieldValues) {
        var conceptToEnable = ["EOT, Is the end of treatment date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Tuberculosis treatment end date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'EOT, Is the end of treatment date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["EOT, Is the day of the end of treatment estimated", "EOT, Is the month of the end of treatment estimated", "EOT, Is the year of the end of treatment estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['EOT, Is the end of treatment date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        },
'EOT, End of Treatment Outcome date': function (formName, formFieldValues) {
        var conceptToEnable = ["EOT, Is the treatment outcome decision date estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['EOT, End of Treatment Outcome date'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'EOT, Is the treatment outcome decision date estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["EOT, Is the day of the treatment outcome decision date estimated", "EOT, Is the month of the treatment outcome decision date estimated", "EOT, Is the year of the treatment outcome decision date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['EOT, Is the treatment outcome decision date estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        },
        'DATE OF DEATH': function (formName, formFieldValues) {
        var conceptToEnable = ["EOT, Is the date of death estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['DATE OF DEATH'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'EOT, Is the date of death estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["EOT, Is the day of the date of death estimated", "EOT, Is the month of the date of death estimated", "EOT, Is the year of the date of death estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['EOT, Is the date of death estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        },
      'Bacteriology, Date of culture innoculation': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of culture inoculation estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Date of culture innoculation'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of culture inoculation estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day of the culture inoculation dates estimated", "Bacteriology, Is the month of the culture inoculation dates estimated", "Bacteriology, Is the year of the culture inoculation dates estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of culture inoculation estimated?'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        }
} /*
'HIV VIRAL LOAD Unknown': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV VIRAL LOAD Unknown'];
        if (conditionConcept == "Unknown") {
            conditions.enable.push("RNA If undetactable is yes, Viral load result")
        } else {
            conditions.disable.push("RNA If undetactable is yes, Viral load result")
        }
        return conditions;
    } */  
