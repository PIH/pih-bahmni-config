-- This file is used to set up the HIV program concepts

set @concept_id = 0;
set @answer_concept_id = 0;
set @program_id = 0;

-- Add treatment status program concept
call ensure_concept(@concept_id, '8c69ffc8-1cac-4278-9725-fa9e6ae5063f', 'Treatment Status','Tx Status', 'N/A', 'Workflow', false);

-- Set of HIV Program Statuses
call ensure_concept(@concept_id, '754d7cef-aa86-472c-b57e-c301dc368766', 'HIV Program Outcomes','HIV Program Outcomes', 'N/A', 'ConvSet', true);
set @parent_concept_id = @concept_id;

-- Add On Treatment program state concept
call ensure_concept(@concept_id, '65664784-977f-11e1-8993-905e29aff6c1', 'On treatment','On treatment', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 1);

-- Add Patient transferred out program state concept
call ensure_concept(@concept_id, '655b604e-977f-11e1-8993-905e29aff6c1', 'Patient transferred out','Patient transferred out', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 2);

-- Add Patient died program state concept
call ensure_concept(@concept_id, '655b5e46-977f-11e1-8993-905e29aff6c1', 'Patient died','Patient died', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 3);

-- Add Discharged program state concept
call ensure_concept(@concept_id, '6566dba4-977f-11e1-8993-905e29aff6c1', 'Discharged','Discharged', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 4);

-- Add Patient defaulted program state concept
call ensure_concept(@concept_id, '655b5f4a-977f-11e1-8993-905e29aff6c1', 'Patient defaulted','Patient defaulted', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 5);

-- Add Treatment stopped program state concept
call ensure_concept(@concept_id, '655a6acc-977f-11e1-8993-905e29aff6c1', 'Treatment stopped','Treatment stopped ', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members (@parent_concept_id, @child_concept_id, 6);

-- Add HIV program concept
call ensure_concept(@concept_id, '6e07060c-af67-4ef5-9958-417c313fe3c5', 'HIV Program','HIV Program', 'N/A', 'Misc', false);

-- add HIV program, referring to the concept just added
call ensure_program(@program_id,'59d95d1d-cc6d-41f5-a431-825688823782','HIV Program','HIV Program',@concept_id,@parent_concept_id);