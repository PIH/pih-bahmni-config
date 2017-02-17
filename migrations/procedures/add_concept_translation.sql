DROP PROCEDURE IF EXISTS add_concept_translation;
CREATE PROCEDURE add_concept_translation (new_uuid VARCHAR(250), translated_short_name VARCHAR(250))
BEGIN
SET @uuid = new_uuid;
SET @name = translated_short_name;
INSERT INTO concept_name values (NULL, (select concept_id from concept where uuid = @uuid), @name, "ru", 1, 1, NOW(), "SHORT", 0, NULL, NULL, NULL, UUID());
END;
