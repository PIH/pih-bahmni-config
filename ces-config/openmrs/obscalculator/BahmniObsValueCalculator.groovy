import org.apache.commons.lang.StringUtils
import org.hibernate.Query
import org.hibernate.SessionFactory
import org.openmrs.Concept
import org.openmrs.Encounter
import org.openmrs.Location
import org.openmrs.Obs
import org.openmrs.Patient
import org.openmrs.Person
import org.openmrs.util.OpenmrsConstants
import org.openmrs.util.OpenmrsUtil
import org.openmrs.api.context.Context
import org.openmrs.api.ConceptService
import org.openmrs.api.EncounterService
import org.openmrs.api.ObsService
import org.openmrs.api.PersonService
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniEncounterTransaction
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniObservation
import org.openmrs.module.bahmniemrapi.obscalculator.ObsValueCalculator
import org.openmrs.module.emrapi.encounter.domain.EncounterTransaction

import org.joda.time.LocalDate;
import org.joda.time.Months;

public class BahmniObsValueCalculator implements ObsValueCalculator {

    static File DEBUG_FILE = new File(OpenmrsUtil.getApplicationDataDirectory()
    + "obscalculator/groovy_debug.txt")

    /* BMI constants */
    static Double BMI_VERY_SEVERELY_UNDERWEIGHT = 16.0
    static Double BMI_SEVERELY_UNDERWEIGHT = 17.0
    static Double BMI_UNDERWEIGHT = 18.5
    static Double BMI_NORMAL = 25.0
    static Double BMI_OVERWEIGHT = 30.0
    static Double BMI_OBESE = 35.0
    static Double BMI_SEVERELY_OBESE = 40.0
    static Double ZERO = 0.0
    static String BMI_DATA_CONCEPT = "BMI"
    static String BMI_CONCEPT = "Body mass index"
    static String BMI_ABNORMAL_CONCEPT = "BMI Abnormal"
    static String BMI_STATUS_DATA_CONCEPT = "BMI Status"
    static String BMI_STATUS_CONCEPT = "Body mass index status"
    static String BMI_STATUS_ABNORMAL_CONCEPT = "BMI Status Abnormal"
    static String HEIGHT_CONCEPT = "Height (cm)"
    static String WEIGHT_CONCEPT = "Weight (kg)"
    static String VITALS_CONCEPT = "Vitals"
    public static enum BmiStatus {
        VERY_SEVERELY_UNDERWEIGHT("Very Severely Underweight"),
        SEVERELY_UNDERWEIGHT("Severely Underweight"),
        UNDERWEIGHT("Underweight"),
        NORMAL("Normal"),
        OVERWEIGHT("Overweight"),
        OBESE("Obese"),
        SEVERELY_OBESE("Severely Obese"),
        VERY_SEVERELY_OBESE("Very Severely Obese")

        private String status
        BmiStatus(String status) {
            this.status = status
        }

        @Override
        public String toString() {
            return status;
        }
    }

    /* PHQ-9 constants */
    static def PHQ9_FORM = "PHQ-9 Form"

    static def PHQ9_QUESTIONS = [
      "PHQ-9 Little interest or pleasure in doing things",
      "PHQ-9 Feeling down, depressed, or hopeless",
      "PHQ-9 Trouble falling or staying asleep, or sleeping too much",
      "PHQ-9 Feeling tired or having little energy",
      "PHQ-9 Poor appetite or overeating",
      "PHQ-9 Feeling bad about yourself",
      "PHQ-9 Trouble concentrating",
      "PHQ-9 Moving or speaking slowly",
      "PHQ-9 Harmful thoughts"
    ];

    static def PHQ9_ANSWERS = [
      ["Not at all", 0],
      ["Several days", 1],
      ["More than half the days", 2],
      ["Nearly every day", 3]
    ];

    static String PHQ9_TOTAL_SCORE = "PHQ-9 Total Score";

    static Map<BahmniObservation, BahmniObservation> obsParentMap =
    new HashMap<BahmniObservation, BahmniObservation>()

    public void run(BahmniEncounterTransaction bahmniEncounterTransaction) {
      DEBUG_FILE.write ''
      if (hasObservation(VITALS_CONCEPT, bahmniEncounterTransaction)) {
        DEBUG_FILE.append 'calculateAndAddBMI\n'
        calculateAndAddBMI(bahmniEncounterTransaction)
      }
      if (hasObservation(PHQ9_FORM, bahmniEncounterTransaction)) {
        DEBUG_FILE.append 'calculateAndAddPHQ9\n'
        calculateAndAddPHQ9(bahmniEncounterTransaction)
      }
    }

    /* PHQ-9 methods */
    static def calculateAndAddPHQ9(BahmniEncounterTransaction encounter) {
      boolean incompleteQuestionnaire = false
      int phq9TotalScore = 0
      Collection<BahmniObservation> observations = encounter.getObservations()
      BahmniObservation phq9QObs, phq9TotalScoreObs
      Date phq9TotalScoreDatetime

      /* calculate PHQ-9 score based on each answer */
      for (int i = 0; i < PHQ9_QUESTIONS.size(); i++) {
        phq9QObs = find(PHQ9_QUESTIONS[i], observations, null)
        if (!hasValue(phq9QObs)) {
          incompleteQuestionnaire = true
          break
        }
        phq9TotalScore += getPHQ9AnswerScore(phq9QObs)
      }

      if (!incompleteQuestionnaire) {
        /* get date of one of the observations, null for new observations */
        phq9TotalScoreDatetime = getDate(phq9QObs)
        if (phq9TotalScoreDatetime == null) {
          phq9TotalScoreDatetime = new Date()
        }

        if (encounter.getEncounterUuid() == null) {
          /* this is a new encounter, create score observation using bahmni
          api */
          phq9TotalScoreObs = createObs(PHQ9_TOTAL_SCORE, null, encounter,
            phq9TotalScoreDatetime) as BahmniObservation
          phq9TotalScoreObs.setValue(phq9TotalScore)
        }
        else {
          /* this is an existing encounter, update score observation
          by searching for it using openmrs api, since it does not get paassed
          through bahmniEncounterTransaction */
          updateOpenmrsObs(PHQ9_TOTAL_SCORE,
            encounter.getEncounterUuid(), encounter.getPatientUuid(),
            phq9TotalScore, null, phq9TotalScoreDatetime)
        }
      }
    }

    /* get score for a single PHQ-9 question */
    static def getPHQ9AnswerScore(BahmniObservation obs) {
      int score = 3
      String answerName = obs.getValue().displayString;
      DEBUG_FILE.append answerName + '\n'
      for (int j = 0; j < PHQ9_ANSWERS.size(); j++) {
        if (PHQ9_ANSWERS[j][0].equalsIgnoreCase(answerName)) {
          score = PHQ9_ANSWERS[j][1]
          break
        }
      }
      return score
    }

    /* BMI methods */
    static def calculateAndAddBMI(BahmniEncounterTransaction encounter) {
        Collection<BahmniObservation> observations = encounter.getObservations()
        def nowAsOfEncounter = encounter.getEncounterDateTime() != null ?
        encounter.getEncounterDateTime() : new Date();

        BahmniObservation heightObservation = find(HEIGHT_CONCEPT, observations,
          null)
        BahmniObservation weightObservation = find(WEIGHT_CONCEPT, observations,
          null)

        if (hasValue(heightObservation) || hasValue(weightObservation)) {
            BahmniObservation bmiDataObservation = find(BMI_DATA_CONCEPT,
              observations, null)
            BahmniObservation bmiObservation = find(BMI_CONCEPT,
              bmiDataObservation ? [bmiDataObservation] : [], null)
            BahmniObservation bmiAbnormalObservation = find(
              BMI_ABNORMAL_CONCEPT, bmiDataObservation ? [bmiDataObservation]:
              [], null)

            BahmniObservation bmiStatusDataObservation = find(
              BMI_STATUS_DATA_CONCEPT, observations, null)
            BahmniObservation bmiStatusObservation = find(BMI_STATUS_CONCEPT,
              bmiStatusDataObservation ? [bmiStatusDataObservation] : [], null)
            BahmniObservation bmiStatusAbnormalObservation = find(
              BMI_STATUS_ABNORMAL_CONCEPT, bmiStatusDataObservation ?
              [bmiStatusDataObservation]: [], null)

            Patient patient = Context.getPatientService().getPatientByUuid(
              encounter.getPatientUuid())
            def patientAgeInMonthsAsOfEncounter = Months.monthsBetween(
              new LocalDate(patient.getBirthdate()),
              new LocalDate(nowAsOfEncounter)).getMonths()

            if ((heightObservation && heightObservation.voided)
            && (weightObservation && weightObservation.voided)) {
                voidObs(bmiDataObservation);
                voidObs(bmiObservation);
                voidObs(bmiStatusDataObservation);
                voidObs(bmiStatusObservation);
                voidObs(bmiAbnormalObservation);
                return
            }

            def previousHeightValue = fetchLatestValue(HEIGHT_CONCEPT,
              encounter.getPatientUuid(), heightObservation, nowAsOfEncounter)
            def previousWeightValue = fetchLatestValue(WEIGHT_CONCEPT,
              encounter.getPatientUuid(), weightObservation, nowAsOfEncounter)

            Double height = hasValue(heightObservation) \
            && !heightObservation.voided ? heightObservation.getValue() \
            as Double : previousHeightValue
            Double weight = hasValue(weightObservation) \
            && !weightObservation.voided ? weightObservation.getValue() \
            as Double : previousWeightValue
            Date obsDatetime = getDate(weightObservation) != null ?
            getDate(weightObservation) : getDate(heightObservation)

            if (height == null || weight == null) {
                voidObs(bmiDataObservation)
                voidObs(bmiObservation)
                voidObs(bmiStatusDataObservation)
                voidObs(bmiStatusObservation)
                voidObs(bmiAbnormalObservation)
                return
            }

            bmiDataObservation = bmiDataObservation ?: createObs(
              BMI_DATA_CONCEPT, null, encounter, obsDatetime) \
              as BahmniObservation
            bmiStatusDataObservation = bmiStatusDataObservation ?:
            createObs(BMI_STATUS_DATA_CONCEPT, null, encounter,
              obsDatetime) as BahmniObservation

            def bmi = bmi(height, weight)
            bmiObservation = bmiObservation ?: createObs(BMI_CONCEPT,
              bmiDataObservation, encounter, obsDatetime) as BahmniObservation;
            bmiObservation.setValue(bmi);

            def bmiStatus = bmiStatus(bmi, patientAgeInMonthsAsOfEncounter,
              patient.getGender());
            bmiStatusObservation = bmiStatusObservation ?: createObs(
              BMI_STATUS_CONCEPT, bmiStatusDataObservation, encounter,
              obsDatetime) as BahmniObservation;
            bmiStatusObservation.setValue(bmiStatus);

            def bmiAbnormal = bmiAbnormal(bmiStatus);
            bmiAbnormalObservation =  bmiAbnormalObservation ?: createObs(
              BMI_ABNORMAL_CONCEPT, bmiDataObservation, encounter, obsDatetime)\
              as BahmniObservation;
            bmiAbnormalObservation.setValue(bmiAbnormal);

            bmiStatusAbnormalObservation =  bmiStatusAbnormalObservation ?:
            createObs(BMI_STATUS_ABNORMAL_CONCEPT, bmiStatusDataObservation,
              encounter, obsDatetime) as BahmniObservation;
            bmiStatusAbnormalObservation.setValue(bmiAbnormal);

            return
        }
    }

    static BMIChart readCSV(String fileName) {
        def chart = new BMIChart();
        try {
            new File(fileName).withReader { reader ->
                def header = reader.readLine();
                reader.splitEachLine(",") { tokens ->
                    chart.add(new BMIChartLine(tokens[0], tokens[1], tokens[2],
                      tokens[3], tokens[4], tokens[5]));
                }
            }
        } catch (FileNotFoundException e) {
        }
        return chart;
    }

    static def bmi(Double height, Double weight) {
        if (height == ZERO) {
            throw new IllegalArgumentException(
              "Please enter Height greater than zero")
        } else if (weight == ZERO) {
            throw new IllegalArgumentException(
              "Please enter Weight greater than zero")
        }
        Double heightInMeters = height / 100;
        Double value = weight / (heightInMeters * heightInMeters);
        return new BigDecimal(value).setScale(2,
          BigDecimal.ROUND_HALF_UP).doubleValue();
    };

    static def bmiStatus(Double bmi, Integer ageInMonth, String gender) {
        BMIChart bmiChart = readCSV(OpenmrsUtil.getApplicationDataDirectory()
        + "obscalculator/BMI_chart.csv");
        def bmiChartLine = bmiChart.get(gender, ageInMonth);
        if(bmiChartLine != null ) {
            return bmiChartLine.getStatus(bmi);
        }

        if (bmi < BMI_VERY_SEVERELY_UNDERWEIGHT) {
            return BmiStatus.VERY_SEVERELY_UNDERWEIGHT;
        }
        if (bmi < BMI_SEVERELY_UNDERWEIGHT) {
            return BmiStatus.SEVERELY_UNDERWEIGHT;
        }
        if (bmi < BMI_UNDERWEIGHT) {
            return BmiStatus.UNDERWEIGHT;
        }
        if (bmi < BMI_NORMAL) {
            return BmiStatus.NORMAL;
        }
        if (bmi < BMI_OVERWEIGHT) {
            return BmiStatus.OVERWEIGHT;
        }
        if (bmi < BMI_OBESE) {
            return BmiStatus.OBESE;
        }
        if (bmi < BMI_SEVERELY_OBESE) {
            return BmiStatus.SEVERELY_OBESE;
        }
        if (bmi >= BMI_SEVERELY_OBESE) {
            return BmiStatus.VERY_SEVERELY_OBESE;
        }
        return null
    }

    static def bmiAbnormal(BmiStatus status) {
        return status != BmiStatus.NORMAL;
    };

    static class BMIChartLine {
        public String gender;
        public Integer ageInMonth;
        public Double third;
        public Double fifteenth;
        public Double eightyFifth;
        public Double ninetySeventh;

        BMIChartLine(String gender, String ageInMonth, String third,
          String fifteenth, String eightyFifth, String ninetySeventh) {
            this.gender = gender
            this.ageInMonth = ageInMonth.toInteger();
            this.third = third.toDouble();
            this.fifteenth = fifteenth.toDouble();
            this.eightyFifth = eightyFifth.toDouble();
            this.ninetySeventh = ninetySeventh.toDouble();
        }

        public BmiStatus getStatus(Double bmi) {
            if(bmi < third) {
                return BmiStatus.SEVERELY_UNDERWEIGHT
            } else if(bmi < fifteenth) {
                return BmiStatus.UNDERWEIGHT
            } else if(bmi < eightyFifth) {
                return BmiStatus.NORMAL
            } else if(bmi < ninetySeventh) {
                return BmiStatus.OVERWEIGHT
            } else {
                return BmiStatus.OBESE
            }
        }
    }

    static class BMIChart {
        List<BMIChartLine> lines;
        Map<BMIChartLineKey, BMIChartLine> map = new HashMap<BMIChartLineKey,
        BMIChartLine>();

        public add(BMIChartLine line) {
            def key = new BMIChartLineKey(line.gender, line.ageInMonth);
            map.put(key, line);
        }

        public BMIChartLine get(String gender, Integer ageInMonth) {
            def key = new BMIChartLineKey(gender, ageInMonth);
            return map.get(key);
        }
    }

    static class BMIChartLineKey {
        public String gender;
        public Integer ageInMonth;

        BMIChartLineKey(String gender, Integer ageInMonth) {
            this.gender = gender
            this.ageInMonth = ageInMonth
        }

        boolean equals(o) {
            if (this.is(o)) return true
            if (getClass() != o.class) return false

            BMIChartLineKey bmiKey = (BMIChartLineKey) o

            if (ageInMonth != bmiKey.ageInMonth) return false
            if (gender != bmiKey.gender) return false

            return true
        }

        int hashCode() {
            int result
            result = (gender != null ? gender.hashCode() : 0)
            result = 31 * result + (ageInMonth != null ?
              ageInMonth.hashCode() : 0)
            return result
        }
    }


    /* common methods */
    private static BahmniObservation obsParent(BahmniObservation child,
      BahmniObservation parent) {
        if (parent != null) return parent;

        if(child != null) {
            return obsParentMap.get(child)
        }
    }

    private static Date getDate(BahmniObservation observation) {
        return hasValue(observation) && !observation.voided ?
        observation.getObservationDateTime() : null;
    }

    private static boolean hasValue(BahmniObservation observation) {
        return observation != null && observation.getValue() != null \
        && !StringUtils.isEmpty(observation.getValue().toString());
    }

    private static void voidObs(BahmniObservation bmiObservation) {
        if (hasValue(bmiObservation)) {
            bmiObservation.voided = true
        }
    }

    static BahmniObservation createObs(String conceptName,
      BahmniObservation parent, BahmniEncounterTransaction encounter,
      Date obsDatetime) {
        def concept = Context.getConceptService().getConceptByName(conceptName)
        BahmniObservation newObservation = new BahmniObservation()
        newObservation.setConcept(new EncounterTransaction.Concept(
          concept.getUuid(), conceptName))
        newObservation.setObservationDateTime(obsDatetime);
        parent == null ? encounter.addObservation(newObservation) :
        parent.addGroupMember(newObservation)
        return newObservation
    }

    static Double fetchLatestValue(String conceptName, String patientUuid,
      BahmniObservation excludeObs, Date tillDate) {
        SessionFactory sessionFactory = Context.getRegisteredComponents(
          SessionFactory.class).get(0)
        def excludedObsIsSaved = excludeObs != null && excludeObs.uuid != null
        String excludeObsClause = excludedObsIsSaved ?
        " and obs.uuid != :excludeObsUuid" : ""
        Query queryToGetObservations = sessionFactory.getCurrentSession()
                .createQuery("select obs " +
                " from Obs as obs, ConceptName as cn " +
                " where obs.person.uuid = :patientUuid " +
                " and cn.concept = obs.concept.conceptId " +
                " and cn.name = :conceptName " +
                " and obs.voided = false" +
                " and obs.obsDatetime <= :till" +
                excludeObsClause +
                " order by obs.obsDatetime desc ");
        queryToGetObservations.setString("patientUuid", patientUuid);
        queryToGetObservations.setParameterList("conceptName", conceptName);
        queryToGetObservations.setParameter("till", tillDate);
        if (excludedObsIsSaved) {
            queryToGetObservations.setString("excludeObsUuid", excludeObs.uuid)
        }
        queryToGetObservations.setMaxResults(1);
        List<Obs> observations = queryToGetObservations.list();
        if (observations.size() > 0) {
            return observations.get(0).getValueNumeric();
        }
        return null
    }

    static BahmniObservation find(String conceptName,
      Collection<BahmniObservation> observations, BahmniObservation parent) {
        for (BahmniObservation observation : observations) {
            if (conceptName.equalsIgnoreCase(
              observation.getConcept().getName())) {
                obsParentMap.put(observation, parent);
                return observation;
            }
            BahmniObservation matchingObservation = find(conceptName,
              observation.getGroupMembers(), observation)
            if (matchingObservation) return matchingObservation;
        }
        return null
    }

    static hasObservation(String conceptName,
      BahmniEncounterTransaction encounter) {
        def retBool = false
        for (BahmniObservation o : encounter.getObservations()) {
          if (conceptName.equalsIgnoreCase(o.getConcept().getName())) {
            retBool = true
            break
          }
        }
        return retBool
    }

    /*
      updates the observation value given by conceptName for the given encounter
    */
    static Obs updateOpenmrsObs(String conceptName,
      String encounterUuid, String patientUuid, Double valueNumeric,
      String valueString, Date obsDatetime) {
        Obs returnObs = null

        if (!conceptName.equals("") && encounterUuid != null
        && patientUuid != null
        && (valueNumeric != null || valueString != null)) {
          ObsService obsService = Context.getObsService()
          EncounterService encounterService = Context.getEncounterService()
          ConceptService conceptService = Context.getConceptService()
          PersonService personService = Context.getPersonService()
          List<Person> whom = null
          List<Encounter> encounters = [encounterService.getEncounterByUuid(
            encounterUuid)]
          List<Concept> questions = [conceptService.getConceptByName(
            conceptName)]
          List<Concept> answers = null
          List<OpenmrsConstants.PERSON_TYPE> personTypes = null
          List<Location> locations = null
          List<String> sort = null
          Integer mostRecentN = 1
          Integer obsGroupId = null
          Date fromDate = null
          Date toDate = null
          boolean includeVoidedObs = false
          List<Obs> encounterObs = obsService.getObservations(whom, encounters,
            questions, answers, personTypes, locations, sort, mostRecentN,
            obsGroupId, fromDate, toDate, includeVoidedObs)

          if (encounterObs.size() == 1) {
            Obs currentObs = encounterObs[0]
            returnObs = Obs.newInstance(currentObs)
            if (valueString != null) {
              returnObs.setValueText(valueString)
            }
            if (valueNumeric != null) {
              returnObs.setValueNumeric(valueNumeric)
            }
            returnObs.setObsDatetime(obsDatetime)
            returnObs.setPreviousVersion(currentObs)
            obsService.saveObs(returnObs,"Updated observation");
            obsService.voidObs(currentObs, "Updated observation");
          }
        }

        return returnObs
    }
}
