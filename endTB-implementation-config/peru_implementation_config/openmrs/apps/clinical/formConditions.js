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
            conditions.enable.push("Date of HIV diagnosis", "Baseline, CD4 count details", "CD4 date", "Baseline, HIV Viral Load Details", "Baseline, Viral Load Date", "Antiretroviral treatment start date", "Baseline, On ARV treatment", "Baseline, Drugs used in ARV treatment")
        } else {
            conditions.disable.push("Date of HIV diagnosis", "Baseline, CD4 count details", "CD4 date", "Baseline, HIV Viral Load Details", "Baseline, Viral Load Date", "Antiretroviral treatment start date", "Baseline, On ARV treatment", "Baseline, Drugs used in ARV treatment")
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
    }

}
