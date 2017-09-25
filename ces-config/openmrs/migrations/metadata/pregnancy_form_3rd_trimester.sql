-- All PIH concepts unless otherwise noted

set @concept_id = 0;

-- common answers
call ensure_concept(@concept_id, '3cd6f600-26fe-102b-80cb-0017a47871b2',
  'Yes', 'Yes', 'N/A', 'Misc', false);
set @yes = @concept_id;

call ensure_concept(@concept_id, '3cd6f86c-26fe-102b-80cb-0017a47871b2',
  'No', 'No', 'N/A', 'Misc', false);
set @no = @concept_id;
-- end common answers

-- defined in pregnancy_form_general.sql
call ensure_concept(@concept_id, '98a7dda0-a1f3-11e7-940e-080027e99513',
  'Pregnancy Form', 'Pregnancy Form', 'N/A',
  'ConvSet', true);
set @pregnancy_form = @concept_id;
call ensure_concept_set_members(@obs_templates, @pregnancy_form, 1);

-- new
call ensure_concept(@concept_id, '94502134-a1f5-11e7-940e-080027e99513',
  'Third Trimester Set', 'Third Trimester', 'N/A', 'ConvSet', true);
set @third_trimester_set = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @third_trimester_set, 10);

call ensure_concept(@concept_id, '3ccc7158-26fe-102b-80cb-0017a47871b2',
  'Hemoglobin', 'Hemoglobin', 'Numeric', 'Test', false);
call ensure_concept_set_members(@first_trimester_set, @concept_id, 1);
call ensure_concept_numeric(@concept_id, NULL, NULL, 17.8, 0, 7.0, 10.4,
  'g/dL', 1, NULL);

call ensure_concept(@concept_id, '160912AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Fasting blood glucose measurement', 'Fasting blood glucose measurement',
  'Numeric', 'Test', false);
call ensure_concept_set_members(@third_trimester_set, @concept_id, 2);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, 0, NULL, NULL,
  'mg/dL', 1, NULL);

call ensure_concept(@concept_id, 'fce48569-1002-427a-909a-f9216c308140',
  'Maternal ultrasound result (text)', 'Maternal ultrasound result', 'Text',
  'Question', false);
call ensure_concept_set_members(@third_trimester_set, @concept_id, 3);

-- http://mdsbuilder.openmrs.org/
call ensure_concept(@concept_id, '159618AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Obstetric ultrasound', 'Obstetric ultrasound', 'Coded',
  'Radiology/Imaging Procedure', false);
call ensure_concept_set_members(@third_trimester_set, @concept_id, 4);

call ensure_concept(@concept_id, '161537AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'First tetanus vaccine for this pregnancy',
  'First tetanus vaccine for this pregnancy', 'Coded', 'Misc', false);
call ensure_concept_set_members(@third_trimester_set, @concept_id, 5);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);

call ensure_concept(@concept_id, '161538AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Second tetanus vaccine for this pregnancy',
  'Second tetanus vaccine for this pregnancy', 'Coded', 'Misc', false);
call ensure_concept_set_members(@third_trimester_set, @concept_id, 6);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);

-- defined in pregnancy_form_2nd_trimester.sql
call ensure_concept(@concept_id, '57bcac8d-a1f5-11e7-940e-080027e99513',
  'Second/Third Trimester Visit Set', 'Trimester Visit', 'N/A', 'ConvSet',
  true);
set @third_trimester_visit_set = @concept_id;
call ensure_concept_set_members(@third_trimester_set,
  @third_trimester_visit_set, 7);
