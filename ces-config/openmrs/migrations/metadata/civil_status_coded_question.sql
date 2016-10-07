-- This file is used to set up Civil Status coded question concept

set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;

-- Civil Status Coded Question
call ensure_concept(@concept_id, '3cd6df26-26fe-102b-80cb-0017a47871b2', 'Civil Status','Civil Status', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- Civil Status Person Attribute Type
call ensure_person_attribute_type('civilStatus', 'Civil Status', 'org.openmrs.Concept', @parent_concept_id, 1, 1, 0, NULL, NULL, NULL, 5, 'a3c5921f-36c0-48d7-b96a-a88728e64208');

-- Single
call ensure_concept(@concept_id, 'df488243-d1d5-4b50-ae04-40b4ffdcf934', 'Single','Single', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Married
call ensure_concept(@concept_id, '3cee0aca-26fe-102b-80cb-0017a47871b2', 'Married','Married', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- Living with Partner
call ensure_concept(@concept_id, '3cd6e96c-26fe-102b-80cb-0017a47871b2', 'Living with Partner','Living with Partner', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Separated
call ensure_concept(@concept_id, '3cd6e246-26fe-102b-80cb-0017a47871b2', 'Separated','Separated', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- Divorced
call ensure_concept(@concept_id, '3cd6e55c-26fe-102b-80cb-0017a47871b2', 'Divorced','Divorced', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);

-- Widowed
call ensure_concept(@concept_id, '3cd6e6f6-26fe-102b-80cb-0017a47871b2', 'Widowed','Widowed', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 6);
