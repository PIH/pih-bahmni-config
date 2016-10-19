-- This file is used to set up the Mental Health Program concepts


set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;
set @program_id = 0;


-- Add Mental Health program concept
call ensure_concept(@concept_id, '2b04ef90-4bbc-40fb-82d5-334933cc85bb', 'Mental Health Program','Mental Health Program', 'N/A', 'Misc', false);

-- add Mental Health program, referring to the concept just added
call ensure_program(@program_id,'8809f43e-6d58-4142-8f0d-b6974ce2f11d','Mental Health Program','Mental Health Program',@concept_id);

-- Add treatment status program concept
call ensure_concept(@concept_id, '8c69ffc8-1cac-4278-9725-fa9e6ae5063f', 'Treatment Status','Tx Status', 'N/A', 'Workflow', false);

-- Set of mental Health Statuses
call ensure_concept(@concept_id, '7ed83a25-0394-445e-a5e3-bf4441823932', 'Mental Health Program States','Mental Health Program States', 'Coded', 'Workflow', false);
set @parent_concept_id = @concept_id;

-- Add On Treatment program state concept
call ensure_concept(@concept_id, '65664784-977f-11e1-8993-905e29aff6c1', 'On treatment','On treatment', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Add Patient transferred out program state concept
call ensure_concept(@concept_id, '655b604e-977f-11e1-8993-905e29aff6c1', 'Patient transferred out','Patient transferred out', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- Add Patient died program state concept
call ensure_concept(@concept_id, '655b5e46-977f-11e1-8993-905e29aff6c1', 'Patient died','Patient died', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Add Discharged program state concept
call ensure_concept(@concept_id, '6566dba4-977f-11e1-8993-905e29aff6c1', 'Discharged','Discharged', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- Add Patient defaulted program state concept
call ensure_concept(@concept_id, '655b5f4a-977f-11e1-8993-905e29aff6c1', 'Patient defaulted','Patient defaulted', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);

-- Add Treatment stopped program state concept
call ensure_concept(@concept_id, '655a6acc-977f-11e1-8993-905e29aff6c1', 'Treatment stopped','Treatment stopped ', 'N/A', 'State', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 6);