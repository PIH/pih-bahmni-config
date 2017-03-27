DROP PROCEDURE IF EXISTS add_concept_translation;
CREATE PROCEDURE add_concept_translation (new_concept_id INT(11), translated_short_name VARCHAR(250))
BEGIN
SET @concept_id = new_concept_id;
SET @name = translated_short_name;
INSERT INTO concept_name values (NULL, @concept_id, @name, "es", 0, 1, NOW(), "SHORT", 0, NULL, NULL, NULL, UUID());
END;
