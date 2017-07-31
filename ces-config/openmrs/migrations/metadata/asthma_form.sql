set @concept_id = 0;

-- "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates = @concept_id;

call ensure_concept(@concept_id, '24db195b-73b1-11e7-8b12-080027e99513',
  'Asthma Form', 'Asthma Form', 'N/A',
  'ConvSet', true);
set @asthma_concept_set = @concept_id;
call ensure_concept_set_members(@obs_templates, @asthma_concept_set, 1);

call ensure_concept(@concept_id, '2e3a3ff8-73b1-11e7-8b12-080027e99513',
  'Nocturnal Symptoms > 2x/month', 'Nocturnal Symptoms > 2x/month', 'Boolean',
  'Symptom', false);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 1);

call ensure_concept(@concept_id, '35053e6f-73b1-11e7-8b12-080027e99513',
  'Limitation of activities', 'Limitation of activities', 'Boolean',
  'Symptom', false);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 2);

call ensure_concept(@concept_id, '3cd8a785-73b1-11e7-8b12-080027e99513',
  'Medication > 2x/week', 'Medication > 2x/week', 'Boolean',
  'Symptom', false);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 3);

-- PIH concepts
call ensure_concept(@concept_id, '0286aef4-f9db-40dd-a1fd-5b579ebde6b8',
  'Spirometry', 'Spirometry', 'Text', 'Question', false);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 4);

call ensure_concept(@concept_id, 'd13bbf4e-f466-4a62-8651-d807f9a8a7cb',
  'Predicted Peak Flow', 'Predicted Peak Flow',
  'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, 800, NULL, NULL, 75, NULL, NULL,
  'L/min', 0, NULL);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 5);

call ensure_concept(@concept_id, 'e8fc0c7f-a37b-475f-ae46-73711842a66c',
  'Peak flow before salbutamol', 'Peak flow before salbutamol',
  'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, 800, NULL, NULL, 75, NULL, NULL,
  'L/min', 0, NULL);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 6);

call ensure_concept(@concept_id, 'e5e67313-b658-4118-9a71-5d5b60fc81d7',
  'Peak flow after salbutamol', 'Peak flow after salbutamol',
  'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, 800, NULL, NULL, 75, NULL, NULL,
  'L/min', 0, NULL);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 7);

call ensure_concept(@concept_id, '4e8e6cfc-406e-45de-a9bd-338c6021c706',
  'Percent peak flow change after salbutamol',
  'Percent peak flow change after salbutamol', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, 200, NULL, NULL, 0, NULL, NULL,
  NULL, 0, NULL);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 8);

call ensure_concept(@concept_id, '40728739-d17a-4f5e-af4b-f7bcd2172e51',
  'Peak flow percent best effort vs peak flow predicted',
  'Peak flow percent best effort vs peak flow predicted', 'Numeric', 'Test',
  false);
call ensure_concept_numeric(@concept_id, 200, NULL, NULL, 0, NULL, NULL,
  NULL, 0, NULL);
call ensure_concept_set_members(@asthma_concept_set, @concept_id, 9);
