-- All PIH concepts unless otherwise noted

set @concept_id = 0;

-- common answers
call ensure_concept(@concept_id, '3cd3a7a2-26fe-102b-80cb-0017a47871b2',
  'Positive', 'Positive', 'N/A', 'Misc', false);
set @positive = @concept_id;

call ensure_concept(@concept_id, '3cd28732-26fe-102b-80cb-0017a47871b2',
  'Negative', 'Negative', 'N/A', 'Misc', false);
set @negative = @concept_id;

call ensure_concept(@concept_id, '3cd750a0-26fe-102b-80cb-0017a47871b2',
  'Normal', 'Normal', 'N/A', 'Misc', false);
set @normal = @concept_id;

call ensure_concept(@concept_id, '3cd75230-26fe-102b-80cb-0017a47871b2',
  'Abnormal', 'Abnormal', 'N/A', 'Misc', false);
set @abnormal = @concept_id;

call ensure_concept(@concept_id, '1304AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Poor Sample Quality', 'Poor Sample Quality', 'N/A', 'Misc', false);
set @poor_sample_quality = @concept_id;

call ensure_concept(@concept_id, '3cd8f3f6-26fe-102b-80cb-0017a47871b2',
  'Reactive', 'Reactive', 'N/A', 'Misc', false);
set @reactive = @concept_id;

call ensure_concept(@concept_id, '3cd8f586-26fe-102b-80cb-0017a47871b2',
  'Non-reactive', 'Non-reactive', 'N/A', 'Misc', false);
set @non_reactive = @concept_id;

call ensure_concept(@concept_id, '3cd774d6-26fe-102b-80cb-0017a47871b2',
  'Indeterminate', 'Indeterminate', 'N/A', 'Misc', false);
set @indeterminate = @concept_id;

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '1874AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Trace', 'Trace', 'N/A', 'Misc', false);
set @trace = @concept_id;

call ensure_concept(@concept_id, '	3cdffdae-26fe-102b-80cb-0017a47871b2',
  'Rarely', 'Rarely', 'N/A', 'Misc', false);
set @rarely = @concept_id;

call ensure_concept(@concept_id, '1362AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'One Plus', 'One Plus', 'Boolean', 'Finding', false);
set @one_plus = @concept_id;

call ensure_concept(@concept_id, '1363AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Two Plus', 'Two Plus', 'Boolean', 'Finding', false);
set @two_plus = @concept_id;

call ensure_concept(@concept_id, '1364AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Three Plus', 'Three Plus', 'Boolean', 'Finding', false);
set @three_plus = @concept_id;

call ensure_concept(@concept_id, '1365AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Four Plus', 'Four Plus', 'Boolean', 'Finding', false);
set @four_plus = @concept_id;
-- end common answers

-- defined in pregnancy_form_general.sql
call ensure_concept(@concept_id, '98a7dda0-a1f3-11e7-940e-080027e99513',
  'Pregnancy Form', 'Pregnancy Form', 'N/A',
  'ConvSet', true);
set @pregnancy_form = @concept_id;
call ensure_concept_set_members(@obs_templates, @pregnancy_form, 1);

-- new
call ensure_concept(@concept_id, '833bad80-a1f5-11e7-940e-080027e99513',
  'Second Trimester Set', 'Second Trimester', 'N/A', 'ConvSet', true);
set @second_trimester_set = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @second_trimester_set, 9);

call ensure_concept(@concept_id, 'fce48569-1002-427a-909a-f9216c308140',
  'Maternal ultrasound result (text)', 'Maternal ultrasound result', 'Text',
  'Question', false);
call ensure_concept_set_members(@second_trimester_set, @concept_id, 1);

call ensure_concept(@concept_id, '159618AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Obstetric ultrasound', 'Obstetric ultrasound', 'Coded',
  'Radiology/Imaging Procedure', false);
call ensure_concept_set_members(@second_trimester_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @normal, 1);
call ensure_concept_answer(@concept_id, @abnormal, 2);

call ensure_concept(@concept_id, '161577AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Lab results (text)', 'Lab results', 'Text', 'Finding', false);
call ensure_concept_set_members(@second_trimester_set, @concept_id, 3);

-- new
call ensure_concept(@concept_id, '57bcac8d-a1f5-11e7-940e-080027e99513',
  'Second/Third Trimester Visit Set', 'Trimester Visit', 'N/A', 'ConvSet',
  true);
set @second_trimester_visit_set = @concept_id;
call ensure_concept_set_members(@second_trimester_set,
  @second_trimester_visit_set, 4);

-- defined in 1st trimester form
call ensure_concept(@concept_id, '19375ad2-a1f5-11e7-940e-080027e99513',
  'Appointment Number', 'Appointment Number', 'Numeric', 'Test', false);
call ensure_concept_set_members(@second_trimester_visit_set, @concept_id, 1);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, 1, NULL, NULL,
  NULL, 0, NULL);

call ensure_concept(@concept_id, '3ce93cf2-26fe-102b-80cb-0017a47871b2',
  'Height (cm)', 'Height (cm)', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 2);
call ensure_concept_numeric(@concept_id, 272, NULL, NULL, 10, NULL, NULL,
  'cm', 1, NULL);

call ensure_concept(@concept_id, '3ce93b62-26fe-102b-80cb-0017a47871b2',
  'Weight (kg)', 'Weight (kg)', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 3);
call ensure_concept_numeric(@concept_id, 250, NULL, NULL, 0, NULL, NULL,
  'kg', 1, NULL);

call ensure_concept(@concept_id, '3ce14da8-26fe-102b-80cb-0017a47871b2',
  'Body mass index', 'BMI', 'Numeric', 'Finding', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 4);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, 0, 18.5, NULL,
  'kg/m2', 1, NULL);

call ensure_concept(@concept_id, '1284AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Problem List', 'Problem List', 'Coded', 'Finding', false);
call ensure_concept_set_members(@second_trimester_visit_set, @concept_id, 5);
set @second_trimester_problem_list = @concept_id;

call ensure_concept(@concept_id, '125050AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Takayasu''s Disease', 'Takayasu''s Disease', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@second_trimester_problem_list, @concept_id, 1);

-- new
call ensure_concept(@concept_id, '64c596ad-a1f5-11e7-940e-080027e99513',
  'SDG', 'SDG', 'Text', 'Finding', false);
call ensure_concept_set_members(@second_trimester_visit_set, @concept_id, 5);

call ensure_concept(@concept_id, '3cd2a906-26fe-102b-80cb-0017a47871b2',
  'Leukocyte Count', 'Leukocyte Count', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 7);
call ensure_concept_numeric(@concept_id, NULL, NULL, 11, 0, 1.4, 4,
  '10^3/uL', 1, NULL);

call ensure_concept(@concept_id, '161440AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urine nitrite test', 'Urine nitrite test', 'Coded', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 7);
call ensure_concept_answer(@concept_id, @positive, 1);
call ensure_concept_answer(@concept_id, @negative, 2);
call ensure_concept_answer(@concept_id, @indeterminate, 3);

call ensure_concept(@concept_id, '159733AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urine glucose', 'Urine glucose', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 8);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'mg/dL', 1, NULL);

call ensure_concept(@concept_id, '1875AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urine Protien (Dip Stick)', 'Urine Protien (Dip Stick)', 'Coded', 'Test',
  false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 9);
call ensure_concept_answer(@concept_id, @negative, 1);
call ensure_concept_answer(@concept_id, @positive, 2);
call ensure_concept_answer(@concept_id, @trace, 3);
call ensure_concept_answer(@concept_id, @one_plus, 4);
call ensure_concept_answer(@concept_id, @two_plus, 5);
call ensure_concept_answer(@concept_id, @three_plus, 6);
call ensure_concept_answer(@concept_id, @four_plus, 7);

-- new
call ensure_concept(@concept_id, '713234d4-a1f5-11e7-940e-080027e99513',
  'Pregnancy Emergency Signs', 'Emergency Signs', 'Coded', 'Question', false);
set @emergency_signs = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @emergency_signs, 10);

call ensure_concept(@concept_id, '150802AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Abnormal Vaginal Bleeding', 'Abnormal Vaginal Bleeding', 'Coded',
  'Diagnosis', false);
call ensure_concept_answer(@emergency_signs, @concept_id, 1);

call ensure_concept(@concept_id, '117617AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Hemorrhage in Early Pregnancy', 'Hemorrhage in Early Pregnancy', 'N/A',
  'Diagnosis', false);
call ensure_concept_answer(@emergency_signs, @concept_id, 2);

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '148968AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Amniotic Fluid Leaking', 'Amniotic Fluid Leaking', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@emergency_signs, @concept_id, 3);

call ensure_concept(@concept_id, '127244AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Ruptured Membranes','Water break', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@emergency_signs, @concept_id, 4);

call ensure_concept(@concept_id, '1452AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'No fetal movements', 'No fetal movements' , 'Boolean', 'Diagnosis', false);
call ensure_concept_answer(@emergency_signs, @concept_id, 5);

-- new: defined in general form
call ensure_concept(@concept_id, 'fb01ba98-a1f3-11e7-940e-080027e99513',
  'Contractions or Pain in Pregnancy', 'Contractions or Pain' , 'N/A',
  'Diagnosis', false);
call ensure_concept_answer(@emergency_signs, @concept_id, 6);
