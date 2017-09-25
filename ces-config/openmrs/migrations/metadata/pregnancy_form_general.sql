-- All PIH concepts unless otherwise noted

set @concept_id = 0;

-- "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates = @concept_id;

-- defined in pregnancy_form_general.sql
call ensure_concept(@concept_id, '98a7dda0-a1f3-11e7-940e-080027e99513',
  'Pregnancy Form', 'Pregnancy Form', 'N/A',
  'ConvSet', true);
set @pregnancy_form = @concept_id;
call ensure_concept_set_members(@obs_templates, @pregnancy_form, 1);

-- new
call ensure_concept(@concept_id, 'c3508c16-a1f3-11e7-940e-080027e99513',
  'Obstetric History text', 'Obstetric History', 'Text',
  'Misc', false);
set @obstetric_history = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @obstetric_history, 1);

call ensure_concept(@concept_id, '162143AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Patient-generated history: Social history section text',
  'Social History', 'Text',
  'Question', false);
call ensure_concept_set_members(@pregnancy_form, @concept_id, 2);

-- new
call ensure_concept(@concept_id, 'df31628f-a1f3-11e7-940e-080027e99513',
  'Pregnancy Warning Signs', 'Warning Signs', 'Coded', 'Question', false);
set @warning_signs = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @warning_signs, 3);

call ensure_concept(@concept_id, '150802AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Abnormal Vaginal Bleeding', 'Abnormal Vaginal Bleeding', 'Coded',
  'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 1);

call ensure_concept(@concept_id, '117617AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Hemorrhage in Early Pregnancy', 'Hemorrhage in Early Pregnancy', 'N/A',
  'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 2);

call ensure_concept(@concept_id, '148968AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Amniotic Fluid Leaking', 'Amniotic Fluid Leaking', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 3);

call ensure_concept(@concept_id, '127244AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Ruptured Membranes','Water break', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 4);

call ensure_concept(@concept_id, '153551AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Abdominal pain complicating pregnancy',
  'Abdominal pain complicating pregnancy' , 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 5);

call ensure_concept(@concept_id, '146945AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Braxton-Hicks Contractions', 'Braxton-Hicks Contractions' , 'N/A',
  'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 6);

call ensure_concept(@concept_id, '1452AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'No fetal movements', 'No fetal movements' , 'Boolean', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 7);

call ensure_concept(@concept_id, '113377AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Decreased fetal movements', 'Decreased fetal movements' , 'N/A', 'Diagnosis',
  false);
call ensure_concept_answer(@warning_signs, @concept_id, 8);

call ensure_concept(@concept_id, '139084AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Headache', 'Headache' , 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 9);

call ensure_concept(@concept_id, '123588AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Tinnitus', 'Tinnitus' , 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 10);

call ensure_concept(@concept_id, '123074AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Visual disturbance', 'Visual disturbance' , 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 11);

call ensure_concept(@concept_id, '140238AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Fever', 'Fever' , 'Coded', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 12);

call ensure_concept(@concept_id, '127368AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Right Upper Quadrant Pain', 'Right Upper Quadrant Pain' , 'Coded',
  'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 13);

-- new
call ensure_concept(@concept_id, 'fb01ba98-a1f3-11e7-940e-080027e99513',
  'Contractions or Pain in Pregnancy', 'Contractions or Pain' , 'N/A',
  'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 14);

call ensure_concept(@concept_id, '206AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Seizure', 'Seizure' , 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@warning_signs, @concept_id, 15);
