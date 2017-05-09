-- This file is used to set up the History form

set @concept_id = 0;

-- Yes, No, Unknown, None, NA, In the past, Currently, Never:  PIH concepts
call ensure_concept(@concept_id, '3cd6f600-26fe-102b-80cb-0017a47871b2', 'Yes',
  'Yes', 'N/A', 'Misc', false);
set @yes_id = @concept_id;
call ensure_concept(@concept_id, '3cd6f86c-26fe-102b-80cb-0017a47871b2', 'No',
  'No', 'N/A', 'Misc', false);
set @no_id = @concept_id;
call ensure_concept(@concept_id, '3cd6fac4-26fe-102b-80cb-0017a47871b2',
  'Unknown','Unknown', 'N/A', 'Misc', false);
set @unknown_id = @concept_id;
call ensure_concept(@concept_id, '3cd743f8-26fe-102b-80cb-0017a47871b2', 'None',
  'None', 'N/A', 'Misc', false);
set @none_id = @concept_id;
call ensure_concept(@concept_id, '3cd7b72a-26fe-102b-80cb-0017a47871b2',
  'Not applicable','Not applicable', 'N/A', 'Misc', false);
set @not_applicable_id = @concept_id;
call ensure_concept(@concept_id, '3cdbd832-26fe-102b-80cb-0017a47871b2',
  'In the past', 'In the past', 'N/A', 'Misc', false);
set @in_the_past_id = @concept_id;
call ensure_concept(@concept_id, '3cdbdb2a-26fe-102b-80cb-0017a47871b2',
  'Currently', 'Currently', 'N/A', 'Misc', false);
set @currently_id = @concept_id;
call ensure_concept(@concept_id, '3cd72968-26fe-102b-80cb-0017a47871b2',
  'Never', 'Never', 'N/A', 'Misc', false);
set @never_id = @concept_id;

-- Father, Mother: PIH concepts
call ensure_concept(@concept_id, '3ce18444-26fe-102b-80cb-0017a47871b2',
  'Father','Father', 'N/A', 'Misc', false);
set @father_id = @concept_id;
call ensure_concept(@concept_id, '3ce185ca-26fe-102b-80cb-0017a47871b2',
  'Mother','Mother', 'N/A', 'Misc', false);
set @mother_id = @concept_id;

-- Diagnosis concepts: PIH concepts
call ensure_concept(@concept_id, '3ccc4bf6-26fe-102b-80cb-0017a47871b2',
  'Asthma','Asthma', 'N/A', 'Diagnosis', false);
set @asthma_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, 'edf4ecc4-44f6-457a-b561-179f4426b16a',
  'Diabetes','Diabetes', 'N/A', 'Diagnosis', false);
set @diabetes_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '3cce0a90-26fe-102b-80cb-0017a47871b2',
  'Epilepsy','Epilepsy', 'N/A', 'Diagnosis', false);
set @epilepsy_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, 'f40bf9bb-fcaa-4f90-8199-197bc6cb2b03',
  'Heart disease','Heart disease', 'N/A', 'Diagnosis', false);
set @heart_disease_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '3cd50188-26fe-102b-80cb-0017a47871b2',
  'Hypertension','Hypertension', 'N/A', 'Diagnosis', false);
set @hypertension_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '3ccca7cc-26fe-102b-80cb-0017a47871b2',
  'Tuberculosis','Tuberculosis', 'Boolean', 'Diagnosis', false);
set @tuberculosis_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '116031AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Malignant Neoplasm','Cancer', 'N/A', 'Diagnosis', false);
set @cancer_concept_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '006ab3b2-a0ea-45bf-b495-83e06f26f87a',
  'Acute rheumatic fever','Rheumatic fever', 'N/A', 'Diagnosis', false);
set @arf_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '117703AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Sickle-cell anemia','Sickle-cell anemia', 'N/A', 'Diagnosis', false);
set @sickle_cell_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '143849AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Congenital malformation', 'Congenital malformation', 'N/A', 'Diagnosis',
  false);
set @congenital_malformation_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, ' 	119399AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Diphtheria', 'Diphtheria', 'N/A', 'Diagnosis', false);
set @diphtheria_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '3cccb654-26fe-102b-80cb-0017a47871b2',
  'Malnutrition', 'Malnutrition', 'N/A', 'Diagnosis', false);
set @malnutrition_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '6b3447ed-c599-4f51-8ee8-fb78c4f6ef60',
  'Premature birth of patient', 'Premature birth of patient', 'N/A',
  'Finding', false);
set @premature_birth_finding_id = @concept_id;
call ensure_concept(@concept_id, '3cce6116-26fe-102b-80cb-0017a47871b2',
  'Sexually transmitted infection','STI', 'N/A', 'Diagnosis', false);
set @sti_ist_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, 'a2bbe648-8b69-438a-9657-8148478cf951',
  'Surgery', 'Surgery', 'N/A', 'Misc', false);
set @surgery_id = @concept_id;
call ensure_concept(@concept_id, '124193AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Traumatic Injury','Trauma', 'N/A', 'Diagnosis', false);
set @trauma_diagnosis_id = @concept_id;
call ensure_concept(@concept_id, '3cd4e978-26fe-102b-80cb-0017a47871b2',
  'Varicella','Varicella', 'N/A', 'Diagnosis', false);
set @varicella_diagnosis_id = @concept_id;

-- PIH concept
call ensure_concept(@concept_id, '3cee7fb4-26fe-102b-80cb-0017a47871b2',
  'Other non-coded','Other', 'N/A', 'Misc', false);
set @other_id = @concept_id;

call ensure_concept(@concept_id, '504981b3-2cf6-11e7-897f-0800272f72ea',
  'Other','Other', 'Text', 'Misc', false);
set @other_text_id = @concept_id;

-- PIH History Form
call ensure_concept(@concept_id, '170dd4cc-cd25-42f0-bf32-d53d74b8c82a',
  'PIH History Form Concept Set', 'History', 'N/A', 'ConvSet', true);
set @history_form_id = @concept_id;

-- Add "History form" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates_id = @concept_id;
call ensure_concept_set_members(@obs_templates_id, @history_form_id, 2);

-- 1. History of present illness Construct
call ensure_concept(@concept_id, '3875F363-D576-40BC-AC25-EB8450F2A8BE',
  'History of present illness construct','History of Present Illness', 'N/A',
  'ConvSet', true);
set @history_present_illness_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @history_present_illness_id,
  1);

-- History of present illness text field
call ensure_concept(@concept_id, 'D8035567-B97D-46AB-9846-6795DA13100E',
  'History of present illness','History of present illness', 'Text', 'Misc',
  false);
call ensure_concept_set_members(@history_present_illness_id, @concept_id,
  1);

-- 2. Family History (Asthma, Diabetes, Epilepsy, Heart disease, Hypertension,
-- Tuberculosis, Cancer, Other)
call ensure_concept(@concept_id, 'fd61d982-3b78-4cb5-9483-2846c7804268',
  'Family History','Family History', 'N/A', 'ConvSet', true);
set @family_history_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @family_history_id, 2);

call ensure_concept(@concept_id, '34c9eef2-0faf-4a3f-ba18-5c3cf4bf4214',
  'Family history of asthma details','Asthma', 'N/A', 'Concept Details', true);
set @asthma_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @asthma_data_id, 1);
call ensure_concept(@concept_id, '97cfe6fc-b97a-4692-a9fb-3a4c187c97f8',
  'Family history of asthma question','Asthma', 'Coded', 'Misc', false);
set @asthma_question_id = @concept_id;
call ensure_concept_set_members(@asthma_data_id, @asthma_question_id, 1);
call ensure_concept_answer(@asthma_question_id, @father_id, 1);
call ensure_concept_answer(@asthma_question_id, @mother_id, 2);

call ensure_concept(@concept_id, '46ff57a9-7fa6-4ba9-83bb-002439f4e811',
  'Family history of diabetes details','Diabetes', 'N/A', 'Concept Details',
  true);
set @diabetes_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @diabetes_data_id, 2);
call ensure_concept(@concept_id, 'd402b1cc-fca3-4b72-a41d-46c354eae5c4',
  'Family history of diabetes question','Diabetes', 'Coded', 'Misc', false);
set @diabetes_question_id = @concept_id;
call ensure_concept_set_members(@diabetes_data_id, @diabetes_question_id, 1);
call ensure_concept_answer(@diabetes_question_id, @father_id, 1);
call ensure_concept_answer(@diabetes_question_id, @mother_id, 2);

call ensure_concept(@concept_id, 'dba54ff5-2cf5-11e7-897f-0800272f72ea',
  'Family history of epilepsy details','Epilepsy', 'N/A', 'Concept Details',
  true);
set @epilepsy_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @epilepsy_data_id, 3);
call ensure_concept(@concept_id, 'ef94dca7-2cf5-11e7-897f-0800272f72ea',
  'Family history of epilepsy question','Epilepsy', 'Coded', 'Misc', false);
set @epilepsy_question_id = @concept_id;
call ensure_concept_set_members(@epilepsy_data_id, @epilepsy_question_id, 1);
call ensure_concept_answer(@epilepsy_question_id, @father_id, 1);
call ensure_concept_answer(@epilepsy_question_id, @mother_id, 2);

call ensure_concept(@concept_id, 'f725a855-2cf5-11e7-897f-0800272f72ea',
  'Family history of heart disease details','Heart disease', 'N/A',
  'Concept Details', true);
set @heart_disease_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @heart_disease_data_id, 4);
call ensure_concept(@concept_id, '1213f984-2cf6-11e7-897f-0800272f72ea',
  'Family history of heart disease question','Heart disease', 'Coded', 'Misc',
  false);
set @heart_disease_question_id = @concept_id;
call ensure_concept_set_members(@heart_disease_data_id,
  @heart_disease_question_id, 1);
call ensure_concept_answer(@heart_disease_question_id, @father_id, 1);
call ensure_concept_answer(@heart_disease_question_id, @mother_id, 2);

call ensure_concept(@concept_id, '1b0dec16-2cf6-11e7-897f-0800272f72ea',
  'Family history of hypertension details','Hypertension', 'N/A',
  'Concept Details', true);
set @hypertension_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @hypertension_data_id, 5);
call ensure_concept(@concept_id, '22cd9776-2cf6-11e7-897f-0800272f72ea',
  'Family history of hypertension question','Hypertension', 'Coded', 'Misc',
  false);
set @hypertension_question_id = @concept_id;
call ensure_concept_set_members(@hypertension_data_id,
  @hypertension_question_id, 1);
call ensure_concept_answer(@hypertension_question_id, @father_id, 1);
call ensure_concept_answer(@hypertension_question_id, @mother_id, 2);

call ensure_concept(@concept_id, '2bd81fe3-2cf6-11e7-897f-0800272f72ea',
  'Family history of tuberculosis details','Tuberculosis', 'N/A',
  'Concept Details', true);
set @tuberculosis_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @tuberculosis_data_id, 6);
call ensure_concept(@concept_id, '3557d962-2cf6-11e7-897f-0800272f72ea',
  'Family history of tuberculosis question','Tuberculosis', 'Coded', 'Misc',
  false);
set @tuberculosis_question_id = @concept_id;
call ensure_concept_set_members(@tuberculosis_data_id,
  @tuberculosis_question_id, 1);
call ensure_concept_answer(@tuberculosis_question_id, @father_id, 1);
call ensure_concept_answer(@tuberculosis_question_id, @mother_id, 2);

call ensure_concept(@concept_id, '3c377013-2cf6-11e7-897f-0800272f72ea',
  'Family history of cancer details','Cancer', 'N/A', 'Concept Details', true);
set @cancer_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @cancer_data_id, 7);
call ensure_concept(@concept_id, '427cfd39-2cf6-11e7-897f-0800272f72ea',
  'Family history of cancer question','Cancer', 'Coded', 'Misc', false);
set @cancer_question_id = @concept_id;
call ensure_concept_set_members(@cancer_data_id, @cancer_question_id, 1);
call ensure_concept_answer(@cancer_question_id, @father_id, 1);
call ensure_concept_answer(@cancer_question_id, @mother_id, 2);

call ensure_concept(@concept_id, '4ab9f1db-2cf6-11e7-897f-0800272f72ea',
  'Family history (other) details','Other', 'N/A', 'Concept Details', true);
set @other_data_id = @concept_id;
call ensure_concept_set_members(@family_history_id, @other_data_id, 8);
call ensure_concept_set_members(@other_data_id, @other_text_id, 1);


-- 3. Medical history Construct:Asthma,Congenital malformation,Diabetes,
-- Diphtheria,Epilepsy,Heart disease,HTA,Malnutrition,
-- Premature birth of patient,RAA (acute rheumatic fever - need to double check
-- if this is needed),STI/IST,Surgery,Trauma,Tuberculosis,Varicella,Other

call ensure_concept(@concept_id, '79C342C6-A886-4945-A268-FF74096EC3AA',
  'Medical history construct','Medical History', 'N/A', 'ConvSet', true);
set @medical_history_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @medical_history_id, 3);

call ensure_concept(@concept_id, '9030046F-7EE6-4387-A2E6-4FB28E428F90',
  'Medical history details','Medical History', 'N/A', 'Concept Details', true);
set @medical_history_data_id = @concept_id;

-- Medical history question
call ensure_concept(@concept_id, '3706DC6C-7373-4786-A93D-9119BE27ABE1',
  'Medical history question','Medical history question', 'Coded', 'Misc', false)
  ;
set @medical_history_question_id = @concept_id;
call ensure_concept_set_members(@medical_history_id,
  @medical_history_data_id, 1);
call ensure_concept_set_members(@medical_history_data_id,
  @medical_history_question_id, 1);

call ensure_concept_answer (@medical_history_question_id, @asthma_diagnosis_id,
  1);
call ensure_concept_answer (@medical_history_question_id,
  @congenital_malformation_diagnosis_id, 2);
call ensure_concept_answer (@medical_history_question_id,
  @diabetes_diagnosis_id, 3);
call ensure_concept_answer (@medical_history_question_id,
  @diphtheria_diagnosis_id, 4);
call ensure_concept_answer (@medical_history_question_id,
  @epilepsy_diagnosis_id, 5);
call ensure_concept_answer (@medical_history_question_id,
  @heart_disease_diagnosis_id, 6);
call ensure_concept_answer(@medical_history_question_id,
  @hypertension_diagnosis_id, 7);
call ensure_concept_answer(@medical_history_question_id,
  @malnutrition_diagnosis_id, 8);
call ensure_concept_answer(@medical_history_question_id,
  @premature_birth_finding_id, 9);
call ensure_concept_answer(@medical_history_question_id, @arf_diagnosis_id, 10);
call ensure_concept_answer(@medical_history_question_id, @sti_ist_diagnosis_id,
  11);
call ensure_concept_answer(@medical_history_question_id, @surgery_id, 12);
call ensure_concept_answer(@medical_history_question_id, @trauma_diagnosis_id,
  13);
call ensure_concept_answer (@medical_history_question_id,
  @tuberculosis_diagnosis_id, 14);
call ensure_concept_answer(@medical_history_question_id,
  @varicella_diagnosis_id, 15);
  call ensure_concept_answer(@medical_history_question_id,
    @other_id, 16);

-- 4. Blood type: all except ConvSet are PIH concepts
call ensure_concept(@concept_id, '675dc583-2f68-11e7-98c0-0800272f72ea',
  'Blood type set','Blood Type', 'N/A', 'ConvSet', true);
set @blood_type_set_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @blood_type_set_id, 4);
call ensure_concept(@concept_id, '3ccf4090-26fe-102b-80cb-0017a47871b2',
  'Blood type', 'Blood type', 'Coded', 'Test', false);
set @blood_type_question_id = @concept_id;
call ensure_concept_set_members(@blood_type_set_id, @blood_type_question_id, 1);
call ensure_concept(@concept_id, '3cd392b2-26fe-102b-80cb-0017a47871b2',
  'A positive', 'A+', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 1);
call ensure_concept(@concept_id, '3cd39686-26fe-102b-80cb-0017a47871b2',
  'A negative', 'A-', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 2);
call ensure_concept(@concept_id, '3cd39988-26fe-102b-80cb-0017a47871b2',
  'B positive', 'B+', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 3);
call ensure_concept(@concept_id, '3cd39ca8-26fe-102b-80cb-0017a47871b2',
  'B negative', 'B-', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 4);
call ensure_concept(@concept_id, '3cd3a144-26fe-102b-80cb-0017a47871b2',
  'O positive', 'O+', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 5);
call ensure_concept(@concept_id, '3cd3a464-26fe-102b-80cb-0017a47871b2',
  'O negative', 'O-', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 6);
call ensure_concept(@concept_id, '3cd8f716-26fe-102b-80cb-0017a47871b2',
  'AB positive','AB+', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 7);
call ensure_concept(@concept_id, '3cd8f8b0-26fe-102b-80cb-0017a47871b2',
  'AB negative','AB-', 'N/A', 'Finding', false);
call ensure_concept_answer(@blood_type_question_id, @concept_id, 8);

-- 5. Sexual activities (Sexually Active, Contraception): all PIH concepts
-- except ConvSet
call ensure_concept(@concept_id, 'cccfb2ef-2f69-11e7-a07b-0800272f72ea',
  'Sexual activities set','Sexual Activities', 'N/A', 'ConvSet', true);
set @sexual_activities_set_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @sexual_activities_set_id, 5);
call ensure_concept(@concept_id, '3ce6c27e-26fe-102b-80cb-0017a47871b2',
  'Sexually active', 'Sexually active', 'Coded', 'Question', false);
set @sexually_active_question_id = @concept_id;
call ensure_concept_set_members(@sexual_activities_set_id,
  @sexually_active_question_id, 1);
call ensure_concept_answer(@sexually_active_question_id, @yes_id, 1);
call ensure_concept_answer(@sexually_active_question_id, @no_id, 2);
call ensure_concept_answer(@sexually_active_question_id, @unknown_id, 3);

call ensure_concept(@concept_id, '3ccfbd0e-26fe-102b-80cb-0017a47871b2',
  'Method of family planning', 'Method of family planning', 'Coded', 'Question',
  false);
set @family_planning_id = @concept_id;
call ensure_concept_set_members(@sexual_activities_set_id, @family_planning_id,
  2);
call ensure_concept_answer(@family_planning_id, @none_id, 1);
call ensure_concept_answer(@family_planning_id, @not_applicable_id, 2);
call ensure_concept(@concept_id, '3cdcf5e6-26fe-102b-80cb-0017a47871b2',
  'Abstinence','Abstinence', 'N/A', 'Misc', false);
call ensure_concept_answer(@family_planning_id, @concept_id, 3);
call ensure_concept(@concept_id, '3cce7a20-26fe-102b-80cb-0017a47871b2',
  'Condoms','Condoms', 'N/A', 'Drug', false);
call ensure_concept_answer(@family_planning_id, @concept_id, 4);
call ensure_concept(@concept_id, '3cd42786-26fe-102b-80cb-0017a47871b2',
  'Oral contraception', 'Oral contraception', 'N/A', 'MedSet', false);
call ensure_concept_answer(@family_planning_id, @concept_id, 5);
call ensure_concept(@concept_id, '3ceb5532-26fe-102b-80cb-0017a47871b2',
  'Injectable contraceptives', 'Injectable contraceptives', 'N/A', 'MedSet',
  false);
call ensure_concept_answer(@family_planning_id, @concept_id, 6);
call ensure_concept(@concept_id, '3ceb5082-26fe-102b-80cb-0017a47871b2',
  'Natural family planning','Natural family planning', 'N/A', 'Misc', false);
call ensure_concept_answer(@family_planning_id, @concept_id, 7);
call ensure_concept_answer(@family_planning_id, @other_id, 8);

-- 6. Habits ConvSet: tobacco (packs/day, comment)
call ensure_concept(@concept_id, '65A515A2-4253-4D90-9000-6462BB4B2B29',
'Habits construct','Habits', 'N/A', 'ConvSet', true);
set @habits_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @habits_id, 6);

-- 6.a. Tobacco Question data
call ensure_concept(@concept_id, '645CA4DB-99B8-43BD-AB95-D10A80498A05',
  'Smoking History', 'Smoking history', 'N/A', 'Concept Details', true);
set @smoking_history_data_id = @concept_id;
call ensure_concept_set_members(@habits_id, @smoking_history_data_id, 1);

-- PIH concepts
call ensure_concept(@concept_id, '3cdbdca6-26fe-102b-80cb-0017a47871b2',
  'Smoking History Question','Smoking history', 'Coded', 'Question', false);
 set @smoking_history_question_id = @concept_id;
call ensure_concept_set_members(@smoking_history_data_id,
   @smoking_history_question_id, 1);
call ensure_concept_answer(@smoking_history_question_id, @currently_id, 1);
call ensure_concept_answer(@smoking_history_question_id, @in_the_past_id, 2);
call ensure_concept_answer(@smoking_history_question_id, @never_id, 3);

call ensure_concept(@concept_id, 'c95b4e78-8c11-4488-a708-49efe87a6aef',
  'Number of cigarettes smoked per day', 'Number of cigarettes smoked per day',
  'Numeric', 'Finding', false);
call ensure_concept_set_members(@habits_id, @concept_id, 2);

-- 6.b. Alcohol Question data
call ensure_concept(@concept_id, '1E4F0D9B-AC45-4305-93E3-D2F652E65436',
  'Alcohol data', 'Alcohol', 'N/A', 'Concept Details', true);
set @alcohol_data_id = @concept_id;
call ensure_concept_set_members(@habits_id, @alcohol_data_id, 3);

-- PIH concepts
call ensure_concept(@concept_id, '3cdbde18-26fe-102b-80cb-0017a47871b2',
  'History of Alcohol Use', 'Alcohol use', 'Coded', 'Question', false);
set @alcohol_question_id = @concept_id;
call ensure_concept_set_members(@alcohol_data_id, @alcohol_question_id,
  1);
call ensure_concept_answer(@alcohol_question_id, @currently_id, 1);
call ensure_concept_answer(@alcohol_question_id, @in_the_past_id, 2);
call ensure_concept_answer(@alcohol_question_id, @never_id, 3);
call ensure_concept_answer(@alcohol_question_id, @unknown_id, 4);


-- 7. Ob-Gyn history (menarche (first period),Start of sexual activity,
-- times pregnant,times delivered,caesarian,abortion,frequency (rhythm),
-- Last PAP)
call ensure_concept(@concept_id, '22858a02-3442-11e7-a64e-0800272f72ea',
  'Ob/Gyn set','Ob/Gyn', 'N/A', 'ConvSet', true);
set @ob_gyn_set_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @ob_gyn_set_id, 7);
call ensure_concept(@concept_id, '07d77269-3440-11e7-a64e-0800272f72ea',
  'Menarche (first period)', 'Menarche (first period)', 'Date', 'Finding',
  false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 1);
call ensure_concept(@concept_id, '3a893c50-3440-11e7-a64e-0800272f72ea',
  'Start of sexual activity', 'Start of sexual activity', 'Date', 'Finding',
  false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 2);
call ensure_concept(@concept_id, '84c0e39b-3441-11e7-a64e-0800272f72ea',
  'Frequency (rhythm)','Frequency (rhythm)', 'Numeric', 'Question', false);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'days', 0, NULL);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 7);
-- PIH concepts
call ensure_concept(@concept_id, '3cee82de-26fe-102b-80cb-0017a47871b2',
  'Gravida', 'Times pregnant', 'Numeric', 'Question', false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 3);
call ensure_concept(@concept_id, '3cd6dda0-26fe-102b-80cb-0017a47871b2',
  'Parity', 'Times delivered', 'Numeric', 'Question', false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 4);
call ensure_concept(@concept_id, '5bf905d4-a4ad-446f-949d-0922637b153f',
  'Number of caesarian sections', 'Number of c-sections', 'Numeric', 'Question',
  false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 5);
call ensure_concept(@concept_id, '90b53ac5-5052-42af-8766-7f7f7453c292',
  'Number of abortions/miscarriages', 'Number of abortions/miscarriages',
  'Numeric', 'Question', false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 6);
call ensure_concept(@concept_id, '163267AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Date of last PAP test', 'Date of last PAP test', 'Date', 'Question', false);
call ensure_concept_set_members(@ob_gyn_set_id, @concept_id, 8);

-- 8. Previous hospitalizations
call ensure_concept(@concept_id, '14fcbfbf-3443-11e7-a64e-0800272f72ea',
  'Previous hospitalizations set', 'Previous hospitalizations', 'N/A',
  'ConvSet', true);
set @hospitalizations_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @hospitalizations_id, 8);
-- PIH concepts
call ensure_concept(@concept_id, '3cef0e02-26fe-102b-80cb-0017a47871b2',
  'Number of hospitalizations in past year',
  'Number of hospitalizations in past year', 'Numeric', 'Question', false);
call ensure_concept_set_members(@hospitalizations_id, @concept_id, 1);
call ensure_concept(@concept_id, 'd07e5399-b91e-43cd-95df-0dc669f5e76e',
  'Days since last hospitalization', 'Days since last hospitalization',
  'Numeric', 'Question', false);
call ensure_concept_set_members(@hospitalizations_id, @concept_id, 2);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'days', 0, NULL);

-- 9. Current Medications Construct
call ensure_concept(@concept_id, '01F3D8F2-8AF3-4F9A-B5A9-1D82219D1E0F',
  'Current Medications construct','Current Medications', 'N/A', 'ConvSet',
  true);
set @current_medications_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @current_medications_id, 9);
-- Current Medications text field: PIH concept
call ensure_concept(@concept_id, '20966786-903b-4ca7-9aa3-159c3ee4458a',
  'Current Medications','Current medications', 'Text', 'Question', false);
call ensure_concept_set_members(@current_medications_id, @concept_id, 1);

-- 10. Diagnostic tests history
call ensure_concept(@concept_id, '98e83d31-3445-11e7-a64e-0800272f72ea',
  'Diagnostic test history set', 'Diagnostic test history', 'N/A', 'ConvSet',
  true);
set @diagnostic_set_id = @concept_id;
call ensure_concept_set_members(@history_form_id, @diagnostic_set_id, 10);
-- PIH concept
call ensure_concept(@concept_id, '64b022c7-87ce-423b-a6fb-161e97e3ae82',
  'Diagnostic tests history', 'Diagnostic tests history', 'Text', 'Question',
  false);
call ensure_concept_set_members(@diagnostic_set_id, @concept_id, 1);
