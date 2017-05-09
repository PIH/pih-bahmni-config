Bahmni.ConceptSet.FormConditions.rules = {
  'Ob/Gyn set' : function (formName, formFieldValues, patient) {
    /* the patient parameter will be available starting in Bahmni 0.89 */
    if (patient != null) {
      var patientGender = patient['gender'];
      if (patientGender == 'F') {
          return {
              enable: ["Menarche (first period)", "Start of sexual activity",
                "Frequency (rhythm)", "Number of caesarian sections", "Gravida",
                "Number of abortions/miscarriages", "Date of last PAP test",
                "Parity"]
          }
      } else {
          return {
            disable: ["Menarche (first period)", "Start of sexual activity",
              "Frequency (rhythm)", "Number of caesarian sections", "Gravida",
              "Number of abortions/miscarriages", "Date of last PAP test",
              "Parity"]
          }
      }
    }
  }
};
