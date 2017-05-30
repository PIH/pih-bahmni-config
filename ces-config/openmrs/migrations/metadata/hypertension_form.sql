-- This file is used to set up Hypertension form concept_set
-- IMPORTANT: The Blood Pressure Set is fully defined in vitals.sql!!!

set @concept_id = 0;

-- Hypertension form concept set: NEW
call ensure_concept(@concept_id, '628d102a-4565-11e7-be61-0800272f72ea',
  'Hypertension Form','Hypertension Form', 'N/A', 'Misc', true);
set @hypertension_form_concept_id = @concept_id;

-- Add Hypertension form to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id,
  @hypertension_form_concept_id, 1);

-- Blood Pressure Set: Wellbody concept
call ensure_concept(@concept_id, 'c36d22e6-3f10-11e4-adec-0800271c1b75',
  'Blood Pressure Set','Blood Pressure', 'N/A', 'ConvSet', true);
set @blood_pressure_concept_id = @concept_id;
call ensure_concept_set_members(@hypertension_form_concept_id,
  @blood_pressure_concept_id, 4);
