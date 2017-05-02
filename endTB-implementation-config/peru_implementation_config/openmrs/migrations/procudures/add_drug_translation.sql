DROP PROCEDURE IF EXISTS add_drug_translation;
CREATE PROCEDURE add_drug_translation (english_concept_name VARCHAR(250), translated_short_name VARCHAR(250))
BEGIN

SELECT concept_id into @concept_id from drug where name=english_concept_name;
INSERT INTO concept_name values (NULL, @concept_id, translated_short_name, "es", 0, 1, NOW(), "SHORT", 0, NULL, NULL, NULL, UUID());

END;
