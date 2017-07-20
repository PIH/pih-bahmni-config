-- This code depends on phq9_form.sql !

set @concept_id = 0;

-- "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates = @concept_id;

call ensure_concept(@concept_id, '6fe1f85d-67ef-11e7-8886-080027e99513',
  'Depression Form', 'Depression Form', 'N/A',
  'ConvSet', true);
set @depression_concept_set = @concept_id;
call ensure_concept_set_members(@obs_templates, @depression_concept_set, 1);

call ensure_concept(@concept_id, '6104deee-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Problem Set', 'PHQ-9 Problems in Last 2 weeks', 'N/A', 'ConvSet',
  true);
call ensure_concept_set_members(@depression_concept_set, @concept_id, 1);

call ensure_concept(@concept_id, '7be1084e-4a00-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Difficulty Caused by Problems Set',
  'PHQ-9 Difficulty Caused by Problems', 'N/A', 'ConvSet', true);
call ensure_concept_set_members(@depression_concept_set, @concept_id, 2);

call ensure_concept(@concept_id, '8b5fea5d-67f9-11e7-b0ec-080027e99513',
  'Side effects of anti-depressants Set', 'Side effects of anti-depressants',
  'N/A', 'ConvSet', true);
set @side_effects_set = @concept_id;
call ensure_concept_set_members(@depression_concept_set, @side_effects_set, 3);

call ensure_concept(@concept_id, 'e8da6e8a-67f3-11e7-b0ec-080027e99513',
  'Side effects of anti-depressants', 'Side effects of anti-depressants',
  'Coded', 'Question', false);
set @side_effects = @concept_id;
call ensure_concept_set_members(@side_effects_set, @side_effects, 1);

-- PIH
call ensure_concept(@concept_id, '3cf1c610-26fe-102b-80cb-0017a47871b2',
  'Nausea', 'Nausea', 'N/A', 'Symptom', false);
call ensure_concept_answer(@side_effects, @concept_id, 1);

-- PIH
call ensure_concept(@concept_id, '3cedf972-26fe-102b-80cb-0017a47871b2',
  'Weight gain', 'Weight gain', 'N/A', 'Symptom/Finding', false);
call ensure_concept_answer(@side_effects, @concept_id, 2);

call ensure_concept(@concept_id, '8bdfc7ad-67f8-11e7-b0ec-080027e99513',
  'Sexual dysfunction', 'Sexual dysfunction', 'N/A', 'Symptom/Finding', false);
call ensure_concept_answer(@side_effects, @concept_id, 3);

-- PIH concept
call ensure_concept(@concept_id, '3cf19000-26fe-102b-80cb-0017a47871b2',
  'Malaise and Fatigue', 'Fatigue', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@side_effects, @concept_id, 4);

-- PIH
call ensure_concept(@concept_id, '116743AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Insomnia', 'Insomnia', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@side_effects, @concept_id, 5);

call ensure_concept(@concept_id, 'a428fb5c-67f8-11e7-b0ec-080027e99513',
  'Dry mouth', 'Dry mouth', 'N/A', 'Symptom/Finding', false);
call ensure_concept_answer(@side_effects, @concept_id, 6);

call ensure_concept(@concept_id, 'b6a5f9de-67f8-11e7-b0ec-080027e99513',
  'Blurred vision', 'Blurred vision', 'N/A', 'Symptom/Finding', false);
call ensure_concept_answer(@side_effects, @concept_id, 7);

-- PIH
call ensure_concept(@concept_id, '3cdc6504-26fe-102b-80cb-0017a47871b2',
  'Constipation', 'Constipation', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@side_effects, @concept_id, 8);

-- PIH
call ensure_concept(@concept_id, '26d45366-618d-400c-9c50-d6506cf098c2',
  'Vertigo', 'Dizziness', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@side_effects, @concept_id, 9);

call ensure_concept(@concept_id, 'cc3f05f1-67f8-11e7-b0ec-080027e99513',
  'Agitation', 'Agitation', 'N/A', 'Symptom/Finding', false);
call ensure_concept_answer(@side_effects, @concept_id, 10);

-- PIH
call ensure_concept(@concept_id, '3ce6b1ee-26fe-102b-80cb-0017a47871b2',
  'Anxiety', 'Anxiety', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@side_effects, @concept_id, 11);

-- PIH
call ensure_concept(@concept_id, '4bb8ae79-6759-4827-b84d-1b35abddff95',
  'Hypotension', 'Hypotension', 'N/A', 'Diagnosis', false);
call ensure_concept_answer(@side_effects, @concept_id, 12);

call ensure_concept(@concept_id, '504981b3-2cf6-11e7-897f-0800272f72ea',
  'Other', 'Other', 'Text', 'Misc', false);
call ensure_concept_set_members(@side_effects_set, @concept_id, 2);
