-- This file is used to set up the Mental Health Program concepts


set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;
set @program_id = 0;
set @program_workflow_id = 0;


-- Add Mental Health program concept
call ensure_concept(@concept_id, '2b04ef90-4bbc-40fb-82d5-334933cc85bb', 'Mental Health Program','Mental Health Program', 'N/A', 'Misc', false);
-- add Mental Health program, referring to the concept just added
call ensure_program(@program_id,'8809f43e-6d58-4142-8f0d-b6974ce2f11d','Mental Health Program','Mental Health Program',@concept_id,,);

-- Add treatment status program concept
call ensure_concept(@concept_id, '8c69ffc8-1cac-4278-9725-fa9e6ae5063f', 'Treatment Status','Tx Status', 'N/A', 'Workflow', false);
-- Add Program Workflow, referring to the program state concept just added
call ensure_program_workflow(@program_workflow_id, '79867b53-9e2a-4dcb-900f-f0216401fd00', @program_id, @concept_id);

-- Set of mental Health Statuses
call ensure_concept(@concept_id, '7ed83a25-0394-445e-a5e3-bf4441823932', 'Mental Health Program States','Mental Health Program States', 'Coded', 'Workflow', false);
set @parent_concept_id = @concept_id;

-- Add On Treatment program state concept
call ensure_concept(@concept_id, '65664784-977f-11e1-8993-905e29aff6c1', 'On treatment','On treatment', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);
call ensure_program_workflow_state('795b049c-ddd1-4476-9cc1-f65bf5bba473',@program_workflow_id, @concept_id,1,0);

-- Add Patient transferred out program state concept
call ensure_concept(@concept_id, '655b604e-977f-11e1-8993-905e29aff6c1', 'Patient transferred out','Patient transferred out', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);
call ensure_program_workflow_state('17a63faf-a250-46d1-91ae-72c11d29fab9',@program_workflow_id, @concept_id,0,1);

-- Add Patient died program state concept
call ensure_concept(@concept_id, '655b5e46-977f-11e1-8993-905e29aff6c1', 'Patient died','Patient died', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);
call ensure_program_workflow_state('ede189d2-1dff-47d2-9cdd-e6a66e95f78c',@program_workflow_id, @concept_id,0,1);

-- Add Discharged program state concept
call ensure_concept(@concept_id, '6566dba4-977f-11e1-8993-905e29aff6c1', 'Discharged','Discharged', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);
call ensure_program_workflow_state('4c0e0bf5-e16c-4053-b5e5-c7cf7daceaa2',@program_workflow_id, @concept_id,0,1);

-- Add Patient defaulted program state concept
call ensure_concept(@concept_id, '655b5f4a-977f-11e1-8993-905e29aff6c1', 'Patient defaulted','Patient defaulted', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);
call ensure_program_workflow_state('41e3a1d3-a040-468d-b990-24a4ede45da2',@program_workflow_id, @concept_id,0,1);

-- Add Treatment stopped program state concept
call ensure_concept(@concept_id, '655a6acc-977f-11e1-8993-905e29aff6c1', 'Treatment stopped','Treatment stopped ', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 6);
call ensure_program_workflow_state('fc8775b4-0577-4cce-bb7e-fefca204d871',@program_workflow_id, @concept_id,0,1);