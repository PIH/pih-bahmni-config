-- This file is used to set up Reason For Visit concept_set

set @concept_id = 0;
set @answer_concept_id = 0;

-- Reason For Visit concept set
-- call ensure_concept(@concept_id, 'A8BD7AE5-9261-4A0C-9BD0-119B2DB43E78', 'Reason for visit','Reason for visit', 'N/A', 'Misc', true);
-- set @reason_for_visit_concept_id = @concept_id;

-- Type of Visit Construct
call ensure_concept(@concept_id, '09d68a0e-c4ef-4dee-bb7d-2833c98f5c36', 'Type of visit construct','Type of visit', 'N/A', 'Misc', true);
set @visit_construct_concept_id = @concept_id;

-- Type of Visit Question
call ensure_concept(@concept_id, '86a2cf11-1ea5-4b8a-9e4b-08f4cdbe1346', 'Type of visit','Type of visit', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- add Type of Visit to the Type of Visit Construct
call ensure_concept_set_members(@visit_construct_concept_id, @parent_concept_id, 1);

-- Outpatient consultation
call ensure_concept(@concept_id, '3cdc871e-26fe-102b-80cb-0017a47871b2', 'Outpatient consultation', 'Outpatient', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Inpatient
call ensure_concept(@concept_id, '3cda41f2-26fe-102b-80cb-0017a47871b2', 'Inpatient Visit', 'Inpatient ', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- Antenatal visit
call ensure_concept(@concept_id, 'cabf0c04-7d4e-4db4-921c-d5ba90f00fc9', 'Antenatal visit', 'ANC', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Labor and delivery visit
call ensure_concept(@concept_id, 'b44e2e97-0577-4747-ae42-5ac8432729ae', 'Antenatal visit', 'ANC', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Postpartum visit
call ensure_concept(@concept_id, '272d0388-f717-4738-b3e0-9cb7a7f5632d', 'Postpartum visit', 'Postpartum', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Pre-ART visit
call ensure_concept(@concept_id, '56ac3f76-1373-4599-b223-da97a7cb5215', 'Pre-ART visit', 'Pre-ART', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- ART visit
call ensure_concept(@concept_id, '3f13b60e-5674-4a13-b5ed-5a31a62c749a', 'ART visit', 'ART', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- PMTCT visit
call ensure_concept(@concept_id, '163a6dd9-2127-417d-a47f-56c722be3ac6', 'PMTCT visit', 'PMTCT', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Immunization visit
call ensure_concept(@concept_id, '199a0a09-bd4f-47b5-93fb-337cb214e693', 'Immunization visit', 'EPI', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Family planning
call ensure_concept(@concept_id, '3ced003a-26fe-102b-80cb-0017a47871b2', 'Family planning', 'Family planning', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Malnutrition  visit
call ensure_concept(@concept_id, '3ce1e560-26fe-102b-80cb-0017a47871b2', 'Malnutrition visit', 'Malnutrition', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Mental health visit
call ensure_concept(@concept_id, '3ced9a68-26fe-102b-80cb-0017a47871b2', 'Mental health visit', 'Mental health', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- TB visit
call ensure_concept(@concept_id, '19b6e33c-a6cc-4b0e-9ad1-aa42062500e4', 'TB visit', 'TB visit', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Leprosy visit
call ensure_concept(@concept_id, 'a28d1b06-37f0-472a-b32d-3296ffcbf197', 'Leprosy visit', 'Leprosy', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Emergency visit
call ensure_concept(@concept_id, '5baf8f76-f234-4b4e-b059-9fec60af71af', 'Emergency visit', 'Emergency', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Other
call ensure_concept(@concept_id, '3cee7fb4-26fe-102b-80cb-0017a47871b2', 'Other', 'Other', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 15);