-- This file is used to set up the HIV program concepts

set @concept_id = 0;
set @answer_concept_id = 0;
set @program_id = 0;

-- Add treatment outcome program concept
call ensure_concept(@concept_id, '8c69ffc8-1cac-4278-9725-fa9e6ae5063f', 'Treatment Outcome','Tx Outcome', 'N/A', 'Misc', false);

-- Set of HIV Program Outcomes
call ensure_concept(@concept_id, '754d7cef-aa86-472c-b57e-c301dc368766', 'HIV Program Outcomes','HIV Program Outcomes', 'N/A', 'ConvSet', true);
set @parent_concept_id = @concept_id;

-- Add Patient transferred out program outcome concept
call ensure_concept(@concept_id, '655b604e-977f-11e1-8993-905e29aff6c1', 'Patient transferred out','Patient transferred out', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 1);

-- Add Patient died program outcome concept
call ensure_concept(@concept_id, '655b5e46-977f-11e1-8993-905e29aff6c1', 'Patient died','Patient died', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 2);

-- Add Discharged program outcome concept
call ensure_concept(@concept_id, '6566dba4-977f-11e1-8993-905e29aff6c1', 'Discharged','Discharged', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 3);

-- Add Patient defaulted program outcome concept
call ensure_concept(@concept_id, '655b5f4a-977f-11e1-8993-905e29aff6c1', 'Patient defaulted','Patient defaulted', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 4);

-- Add Treatment stopped program outcome     concept
call ensure_concept(@concept_id, '655a6acc-977f-11e1-8993-905e29aff6c1', 'Treatment stopped','Treatment stopped ', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 5);

-- Add HIV program concept
call ensure_concept(@concept_id, '6e07060c-af67-4ef5-9958-417c313fe3c5', 'HIV Program','HIV Program', 'N/A', 'Misc', false);

-- add HIV program, referring to the concept just added
call ensure_program(@program_id,'59d95d1d-cc6d-41f5-a431-825688823782','HIV Program','HIV Program',@concept_id,@parent_concept_id);


-- Add treatment status program concept
call ensure_concept(@concept_id, '8c69ffc8-1cac-4278-9725-fa9e6ae5063f', 'Treatment Status','Tx Status', 'N/A', 'Misc', false);
-- Add Program Workflow, referring to the program state concept just added
call ensure_program_workflow(@program_workflow_id, '79867b53-9e2a-4dcb-900f-f0216401fd00', @program_id, @concept_id);

-- Set of HIV Treatment Statuses
call ensure_concept(@concept_id, 'a699ea46-bd60-46f4-9e82-e90c7c3dbd9c', 'HIV Program States','HIV Program States', 'Coded', 'Misc', false);
set @parent_concept_id = @concept_id;

-- Add Pre-ART program state concept
call ensure_concept(@concept_id, '655a0212-977f-11e1-8993-905e29aff6c1', 'Pre-ART','Pre-ART', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);
call ensure_program_workflow_state('f2e22640-5bca-483a-876e-c55d3dd2b764',@program_workflow_id, @concept_id,1,0);

-- Add ART program state concept
call ensure_concept(@concept_id, '655a68b0-977f-11e1-8993-905e29aff6c1', 'ART','ART', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);
call ensure_program_workflow_state('6e74a956-ade5-4a26-89b0-e2e840d28561',@program_workflow_id, @concept_id,1,0);