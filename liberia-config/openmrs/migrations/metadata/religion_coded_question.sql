-- This file is used to set up the Religion coded question concept

set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;

-- Religion Coded Question
call ensure_concept(@concept_id, '162929AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Religion','Religion', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- Religion Person Attribute Type
call ensure_person_attribute_type('religion', 'Religion', 'org.openmrs.Concept', @parent_concept_id, 1, 1, 0, NULL, NULL, NULL, 5, 'fdfcb781-9ade-444c-bc20-565801596caa');

-- Catholic
call ensure_concept(@concept_id, '162931AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Catholic','Catholic', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Pentecostal
call ensure_concept(@concept_id, '162934AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Pentecostal','Pentecostal', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- Jehovah's Witness
call ensure_concept(@concept_id, '162936AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Jehovah\'s Witness','Jehovah\'s Witness', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Seventh Day Adventist
call ensure_concept(@concept_id, '162935AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Seventh Day Adventist','Seventh Day Adventist', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- Baptist
call ensure_concept(@concept_id, '1162932AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Baptist','Baptist', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);
