-- This file is used to set up Patient Category coded question concept

set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;

-- Patient Category Coded Question
call ensure_concept(@concept_id, 'acc76e46-5997-42a7-896a-41d69b907197', 'CES Patient Category','Patient Category', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- Patient Category Person Attribute Type
call ensure_person_attribute_type('CES Patient Category', 'Patient Category', 'org.openmrs.Concept', @parent_concept_id, 1, 1, 0, NULL, NULL, NULL, 5, '23abd05a-da83-4799-ae86-515d559ad974');

-- Indigina
call ensure_concept(@concept_id, '13b7a57a-6431-4f92-a841-288f5b63b67a', 'Indigina','Indigina', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Oportunidades
call ensure_concept(@concept_id, 'ae10da80-1946-4203-9a33-c1e03170f68f', 'Oportunidades','Oportunidades', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- SPSS
call ensure_concept(@concept_id, '9241c13f-8d24-490f-896e-c57b326160bc', 'SPSS','SPSS', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Migrante
call ensure_concept(@concept_id, 'eafe3d80-94d7-4676-a342-afb9f37e03d2', 'Migrante','Migrante', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- Discapacidad
call ensure_concept(@concept_id, '9e9b62db-027c-4a97-b02b-0917c364a8fa', 'Discapacidad','Discapacidad', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);