-- All PIH concepts unless otherwise noted

set @concept_id = 0;

-- defined in pregnancy_form_general.sql
call ensure_concept(@concept_id, '98a7dda0-a1f3-11e7-940e-080027e99513',
  'Pregnancy Form', 'Pregnancy Form', 'N/A',
  'ConvSet', true);
set @pregnancy_form = @concept_id;

-- Yes, No, Unknown
call ensure_concept(@concept_id, '3cd6f600-26fe-102b-80cb-0017a47871b2', 'Yes',
  'Yes', 'N/A', 'Misc', false);
set @yes = @concept_id;
call ensure_concept(@concept_id, '3cd6f86c-26fe-102b-80cb-0017a47871b2', 'No',
  'No', 'N/A', 'Misc', false);
set @no = @concept_id;
call ensure_concept(@concept_id, '3cd6fac4-26fe-102b-80cb-0017a47871b2',
  'Unknown','Unknown', 'N/A', 'Misc', false);
set @unknown = @concept_id;

-- normal, abnormal, done
call ensure_concept(@concept_id, '3cd750a0-26fe-102b-80cb-0017a47871b2',
  'Normal', 'Normal', 'N/A', 'Misc', false);
set @normal = @concept_id;
call ensure_concept(@concept_id, '3cd75230-26fe-102b-80cb-0017a47871b2',
  'Abnormal', 'Abnormal', 'N/A', 'Misc', false);
set @abnormal = @concept_id;
call ensure_concept(@concept_id, '3cd75550-26fe-102b-80cb-0017a47871b2',
  'Not done', 'Not done', 'N/A', 'Misc', false);
set @not_done = @concept_id;

-- new
call ensure_concept(@concept_id, '32ebf1b6-a1f4-11e7-940e-080027e99513',
  'Postpartum Set', 'Postpartum', 'N/A', 'ConvSet', true);
set @postpartum_set = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @postpartum_set, 11);

call ensure_concept(@concept_id, '164802AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Infant''s date of birth', 'Infant''s date of birth', 'Date', 'Question',
  false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 1);

call ensure_concept(@concept_id, '1438AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Weeks of current gestation', 'Weeks of current gestation', 'Numeric',
  'Finding', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 2);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'wks', 1, NULL);

-- Place of Birth
call ensure_concept(@concept_id, '1572AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Place of birth', 'Place of birth', 'Coded', 'Question', false);
set @place_of_birth = @concept_id;
call ensure_concept_set_members(@postpartum_set, @place_of_birth, 3);

call ensure_concept(@concept_id, '1536AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Home', 'Home', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 1);

call ensure_concept(@concept_id, '1601AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'En Route to Health Facility', 'En Route to Health Facility', 'N/A', 'Misc',
  false);
call ensure_concept_answer(@place_of_birth, @concept_id, 2);

call ensure_concept(@concept_id, '1588AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Health Clinic/Post', 'Health Clinic/Post', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 3);

call ensure_concept(@concept_id, '1589AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Hospital', 'Hospital', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 4);

call ensure_concept(@concept_id, '159670AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Sub-district Hospital', 'Sub-district Hospital', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 5);

call ensure_concept(@concept_id, '159671AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Provincial Hospital', 'Provincial Hospital', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 6);

call ensure_concept(@concept_id, '159662AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'District Hospital', 'District Hospital', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 7);

call ensure_concept(@concept_id, '159372AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Primary Care Clinic', 'Primary Care Clinic', 'N/A', 'Finding', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 8);

call ensure_concept(@concept_id, '5622AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Other', 'Other', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 9);

call ensure_concept(@concept_id, '1067AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Unknown', 'Unknown', 'N/A', 'Misc', false);
call ensure_concept_answer(@place_of_birth, @concept_id, 10);
-- end Place of Birth

-- new
call ensure_concept(@concept_id, '164256AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Attending Physician', 'Attending Physician', 'Text', 'Misc', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 4);

call ensure_concept(@concept_id, '163554AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Birth Height', 'Birth Height', 'Numeric', 'Finding', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 6);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, 0, NULL, NULL,
  'cm', 0, NULL);

-- Problem list
call ensure_concept(@concept_id, '1284AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Problem List', 'Problem List', 'Coded', 'Finding', false);
set @problem_list = @concept_id;

call ensure_concept(@concept_id, '118907AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Disruption of Cesarean Wound, Postpartum',
  'Disruption of Cesarean Wound, Postpartum', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@problem_list, @concept_id, 1);

call ensure_concept(@concept_id, '123396AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Vaginal discharge',  'Vaginal discharge', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@problem_list, @concept_id, 1);

call ensure_concept(@concept_id, '996AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Constipation',  'Constipation', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@problem_list, @concept_id, 1);

call ensure_concept(@concept_id, '129324AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Postpartum Fever',  'Postpartum Fever', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@problem_list, @concept_id, 1);

call ensure_concept(@concept_id, '111633AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Urinary tract infection',  'Urinary tract infection', 'N/A', 'Diagnosis',
  false);
call ensure_concept_answer(@problem_list, @concept_id, 1);

call ensure_concept(@concept_id, '129325AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Postpartum Depression', 'Postpartum Depression', 'N/A',
  'Diagnosis', false);
call ensure_concept_answer(@problem_list, @concept_id, 1);
-- end Problem list

-- hemorrhage
call ensure_concept(@concept_id, '230AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Postpartum Hemorrhage', 'Postpartum Hemorrhage', 'Coded', 'Finding', false);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);
call ensure_concept_answer(@concept_id, @unknown, 3);

-- Tearing (if episiotomy)
call ensure_concept(@concept_id, '159840AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Episiotomy, Postnatal Physical Exam', 'Episiotomy, postnatal physical exam',
  'Coded', 'Finding', false);
set @episiotomy_postnatal = @concept_id;
call ensure_concept_set_members(@postpartum_set, @episiotomy_postnatal, 10);

call ensure_concept(@concept_id, '159842AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Repaired, Episiotomy Wound', 'Repaired, Episiotomy Wound',
  'N/A', 'Finding', false);
call ensure_concept_answer(@episiotomy_postnatal, @concept_id, 1);

call ensure_concept(@concept_id, '159843AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Healed, Episiotomy Wound', 'Healed, Episiotomy Wound',
  'N/A', 'Finding', false);
call ensure_concept_answer(@episiotomy_postnatal, @concept_id, 2);

call ensure_concept(@concept_id, '159841AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Gap, Episiotomy Wound', 'Gap, Episiotomy Wound',
  'N/A', 'Finding', false);
call ensure_concept_answer(@episiotomy_postnatal, @concept_id, 3);

call ensure_concept(@concept_id, '113919AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Postoperative Wound Infection', 'Postoperative Wound Infection',
  'N/A', 'Diagnosis', false);
call ensure_concept_answer(@episiotomy_postnatal, @concept_id, 4);
-- Tearing (if episiotomy) end

call ensure_concept(@concept_id, 'a2ac267c-a1f4-11e7-940e-080027e99513',
  'Lactation', 'Lactation', 'Coded', 'Question', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 7);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);
call ensure_concept_answer(@concept_id, @unknown, 3);

call ensure_concept(@concept_id, '5271AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Family Planning', 'Family Planning', 'Coded', 'Question', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 8);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);
call ensure_concept_answer(@concept_id, @unknown, 3);

call ensure_concept(@concept_id, '5632AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Currently Breastfeeding Child', 'Currently Breastfeeding Child', 'Coded',
  'Question', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 8);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);
call ensure_concept_answer(@concept_id, @unknown, 3);

call ensure_concept(@concept_id, '885AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Pap Smear', 'Pap Smear', 'Coded',  'Test', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 8);
call ensure_concept_answer(@concept_id, @normal, 1);
call ensure_concept_answer(@concept_id, @abnormal, 2);
call ensure_concept_answer(@concept_id, @not_done, 3);

call ensure_concept(@concept_id, '163766AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Enrolled in Social Support', 'Enrolled in Social Support', 'Coded',
  'Question', false);
call ensure_concept_set_members(@postpartum_set, @concept_id, 8);
call ensure_concept_answer(@concept_id, @yes, 1);
call ensure_concept_answer(@concept_id, @no, 2);
call ensure_concept_answer(@concept_id, @unknown, 3);
