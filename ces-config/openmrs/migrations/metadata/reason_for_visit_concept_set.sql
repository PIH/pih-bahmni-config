-- This file is used to set up Reason For Visit concept_set

set @concept_id = 0;
set @answer_concept_id = 0;

-- Reason For Visit concept set
call ensure_concept(@concept_id, 'A8BD7AE5-9261-4A0C-9BD0-119B2DB43E78', 'Reason for visit','Reason for visit', 'N/A', 'Misc', true);
set @reason_for_visit_concept_id = @concept_id;

-- Type of Visit Construct
call ensure_concept(@concept_id, '09d68a0e-c4ef-4dee-bb7d-2833c98f5c36', 'Type of visit construct','Type of visit', 'N/A', 'Misc', true);
set @visit_construct_concept_id = @concept_id;

-- Type of Visit Question
call ensure_concept(@concept_id, '86a2cf11-1ea5-4b8a-9e4b-08f4cdbe1346', 'Type of visit','Type of visit', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- add Type of Visit to the Type of Visit Construct
call ensure_concept_set_members(@visit_construct_concept_id, @parent_concept_id, 1);


-- Maternity/Delivery
call ensure_concept(@concept_id, 'b44e2e97-0577-4747-ae42-5ac8432729ae', 'Maternity/Delivery', 'Maternity/Delivery', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- OPD
call ensure_concept(@concept_id, '3cdc871e-26fe-102b-80cb-0017a47871b2', 'OPD', 'OPD', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Mental Health
call ensure_concept(@concept_id, '3ced9a68-26fe-102b-80cb-0017a47871b2', 'Mental Health', 'Mental Health', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Other
call ensure_concept(@concept_id, '3cee7fb4-26fe-102b-80cb-0017a47871b2', 'Other', 'Other', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);