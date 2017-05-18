-- The CES EMR requires a note to capture information regarding patient diabetes
-- The fields to be captured are:
--     Glucose
--     HBA1C
--     Cholesterol
--     HDL
--     LDL
--     Proteinuria
--         level (mg/dl) or
--         dipstick level (1-4)
--     Feet review
--         Normal
--         Abnormal
--         comments

-- Diabetes Form: new concept
call ensure_concept(@concept_id, '87e11ad7-3bdd-11e7-932a-0800272f72ea',
  'PIH Diabetes Form Concept Set', 'Diabetes Form', 'N/A', 'ConvSet', true);
set @form_id = @concept_id;

-- Add "Diabetes form" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates_id = @concept_id;
call ensure_concept_set_members(@obs_templates_id, @form_id, 3);

call ensure_concept(@concept_id, '3cd4e194-26fe-102b-80cb-0017a47871b2',
  'Serum Glucose', 'Glucose', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, 999, NULL, 100, 0, NULL, 70,
  'mg/dl', 1, NULL);
call ensure_concept_set_members(@form_id, @concept_id, 1);

call ensure_concept(@concept_id, '159644AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'HbA1c', 'HbA1c', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, NULL, NULL, 5.6, NULL, NULL, 4,
  '%', 1, NULL);
call ensure_concept_set_members(@form_id, @concept_id, 2);

call ensure_concept(@concept_id, '3cd68c7e-26fe-102b-80cb-0017a47871b2',
  'Total Cholesterol', 'Cholesterol', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, NULL, NULL, 200, NULL, NULL, NULL,
  'mg/dl', 0, NULL);
call ensure_concept_set_members(@form_id, @concept_id, 3);

call ensure_concept(@concept_id, '3cd68e18-26fe-102b-80cb-0017a47871b2',
  'High-density Lipoprotein Cholesterol', 'HDL', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, 60,
  'mg/dl', 0, NULL);
call ensure_concept_set_members(@form_id, @concept_id, 4);

call ensure_concept(@concept_id, '3cd68fa8-26fe-102b-80cb-0017a47871b2',
  'Low-density Lipoprotein Cholesterol', 'LDL', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, NULL, NULL, 129, NULL, NULL, 100,
  'mg/dl', 0, NULL);
call ensure_concept_set_members(@form_id, @concept_id, 5);

call ensure_concept(@concept_id, '3cd49d88-26fe-102b-80cb-0017a47871b2',
  'Urinary Albumin', 'Proteinuria', 'Numeric', 'Test', false);
call ensure_concept_numeric(@concept_id, NULL, NULL, NULL, NULL, NULL, NULL,
  'mg/dl', 0, NULL);
call ensure_concept_set_members(@form_id, @concept_id, 6);

-- new concept
call ensure_concept(@concept_id, 'a068324e-3bdd-11e7-932a-0800272f72ea',
  'Proteinuria dipstick level', 'Proteinuria dipstick level', 'Coded', 'Misc',
  false);
set @proteinuria_dipstick_level_id = @concept_id;
call ensure_concept_set_members(@form_id, @concept_id, 7);

-- new concept
call ensure_concept(@concept_id, 'b90ab527-3bdd-11e7-932a-0800272f72ea',
  'Trace amount', 'Trace', 'N/A', 'Misc', false);
call ensure_concept_answer(@proteinuria_dipstick_level_id, @concept_id, 1);

call ensure_concept(@concept_id, 'f8ae4d73-a6f0-4363-9db6-35041ecb7f9f',
  'One or more', '1+', 'N/A', 'Misc', false);
call ensure_concept_answer(@proteinuria_dipstick_level_id, @concept_id, 2);

call ensure_concept(@concept_id, 'b0c9fa5d-bcb4-4bbf-8c1b-d7124d6d5593',
  'Two or more', '2+', 'N/A', 'Misc', false);
call ensure_concept_answer(@proteinuria_dipstick_level_id, @concept_id, 3);

call ensure_concept(@concept_id, 'fde82d16-0ba1-4b65-be70-45781843a3db',
  'Three or more', '3+', 'N/A', 'Misc', false);
call ensure_concept_answer(@proteinuria_dipstick_level_id, @concept_id, 4);

-- new concept
call ensure_concept(@concept_id, 'ccfb521a-3bdd-11e7-932a-0800272f72ea',
  'Four or more', '4+', 'N/A', 'Misc', false);
call ensure_concept_answer(@proteinuria_dipstick_level_id, @concept_id, 5);

-- new
call ensure_concept(@concept_id, '9282a6fd-3be6-11e7-9701-0800272f72ea',
  'Feet Review Concept Details', 'Feet Review', 'N/A', 'Concept Details', true);
set @feet_review_details_id = @concept_id;
call ensure_concept_set_members(@form_id, @feet_review_details_id,
  8);

call ensure_concept(@concept_id, 'd45f6f13-3bdd-11e7-932a-0800272f72ea',
  'Feet Review Question', 'Feet review', 'Coded', 'Misc', false);
set @feet_review_question_id = @concept_id;
call ensure_concept_set_members(@feet_review_details_id,
  @feet_review_question_id,1);

call ensure_concept(@concept_id, '3cd750a0-26fe-102b-80cb-0017a47871b2',
  'Normal', 'Normal', 'N/A', 'Misc', false);
call ensure_concept_answer(@feet_review_question_id, @concept_id, 3);

call ensure_concept(@concept_id, '3cd75230-26fe-102b-80cb-0017a47871b2',
  'Abnormal', 'Abnormal', 'N/A', 'Misc', false);
call ensure_concept_answer(@feet_review_question_id, @concept_id, 4);
