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

-- new
call ensure_concept(@concept_id, 'f000f514-a1f4-11e7-940e-080027e99513',
  'First Trimester Set', 'First Trimester', 'N/A', 'ConvSet', true);
set @first_trimester_set = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @first_trimester_set, 8);

call ensure_concept(@concept_id, '3ccc7158-26fe-102b-80cb-0017a47871b2',
  'Hemoglobin', 'Hemoglobin', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_set, @concept_id, 1);
call ensure_concept_numeric(@concept_id, NULL, NULL, 17.8, 0, 7.0, 10.4,
  'g/dL', 1, NULL);

call ensure_concept(@concept_id, '3cd6c946-26fe-102b-80cb-0017a47871b2',
  'HIV Rapid Test, Qualitative', 'HIV Rapid Test, Qualitative',
  'Coded', 'Test', false);
call ensure_concept_set_members(@first_trimester_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @positive, 1);
call ensure_concept_answer(@concept_id, @negative, 2);
call ensure_concept_answer(@concept_id, @indeterminate, 3);

call ensure_concept(@concept_id, '3ccf3f00-26fe-102b-80cb-0017a47871b2',
  'VDRL', 'SYPHILIS TEST (VDRL)', 'Coded', 'Test', false);
call ensure_concept_set_members(@first_trimester_set, @concept_id, 4);
call ensure_concept_answer(@concept_id, @reactive, 1);
call ensure_concept_answer(@concept_id, @non_reactive, 2);
call ensure_concept_answer(@concept_id, @indeterminate, 3);

call ensure_concept(@concept_id, 'fce48569-1002-427a-909a-f9216c308140',
  'Maternal ultrasound result (text)', 'Maternal ultrasound result', 'Text',
  'Question', false);
call ensure_concept_set_members(@first_trimester_set, @concept_id, 5);

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '159618AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Obstetric ultrasound', 'Obstetric ultrasound', 'Coded',
  'Procedure', false);
call ensure_concept_set_members(@first_trimester_set, @concept_id, 6);
call ensure_concept_answer(@concept_id, @normal, 1);
call ensure_concept_answer(@concept_id, @abnormal, 2);

-- new
call ensure_concept(@concept_id, 'fa497fdb-a1f4-11e7-940e-080027e99513',
  'First Trimester Visit Set', 'First Trimester Visit', 'N/A', 'ConvSet',
  true);
set @first_trimester_visit_set = @concept_id;
call ensure_concept_set_members(@first_trimester_set,
  @first_trimester_visit_set, 7);

-- new
call ensure_concept(@concept_id, '19375ad2-a1f5-11e7-940e-080027e99513',
  'Appointment Number', 'Appointment Number', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 1);
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

-- To do as a next step
-- call ensure_concept(@concept_id, '3ce14da8-26fe-102b-80cb-0017a47871b2',
--   'Body mass index', 'BMI', 'Numeric', 'Finding', false);
-- call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 4);
-- call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, 0, 18.5, NULL,
--   'kg/m2', 1, NULL);

-- Blood Pressure Set (from vitals.sql, do abnormal values hold in pregnancy?)
call ensure_concept(@concept_id, 'c36d22e6-3f10-11e4-adec-0800271c1b75',
  'Blood Pressure Set','Blood Pressure', 'N/A', 'ConvSet', true);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 5);

call ensure_concept(@concept_id, '3ce14da8-26fe-102b-80cb-0017a47871b2',
  'Weeks of current gestation', 'Weeks of current gestation', 'Numeric',
  'Finding', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 6);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'wks', 1, NULL);

call ensure_concept(@concept_id, '3cd2a906-26fe-102b-80cb-0017a47871b2',
  'Leukocyte Count', 'Leukocyte Count', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 7);
call ensure_concept_numeric(@concept_id, NULL, NULL, 11, 0, 1.4, 4,
  '10^3/uL', 1, NULL);

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '161440AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urine nitrite test', 'Urine nitrite test', 'Coded', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 8);
call ensure_concept_answer(@concept_id, @positive, 1);
call ensure_concept_answer(@concept_id, @negative, 2);
call ensure_concept_answer(@concept_id, @indeterminate, 3);

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '159733AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urine glucose', 'Urine glucose', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 9);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'mg/dL', 1, NULL);

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '1875AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urine Protien (Dip Stick)', 'Urine Protien (Dip Stick)', 'Coded', 'Test',
  false);
call ensure_concept_set_members(@first_trimester_visit_set, @concept_id, 10);
call ensure_concept_answer(@concept_id, @negative, 1);
call ensure_concept_answer(@concept_id, @positive, 2);
call ensure_concept_answer(@concept_id, @trace, 3);
call ensure_concept_answer(@concept_id, @one_plus, 4);
call ensure_concept_answer(@concept_id, @two_plus, 5);
call ensure_concept_answer(@concept_id, @three_plus, 6);
call ensure_concept_answer(@concept_id, @four_plus, 7);
