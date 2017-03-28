
-- Ensure a concept class exists with the given attributes

CREATE PROCEDURE ensure_concept_class (
_name             VARCHAR(255),
_description      VARCHAR(255),
_uuid             CHAR(38)
)
BEGIN

DECLARE _class_id INT;

SELECT concept_class_id INTO _class_id FROM concept_class WHERE uuid = _uuid;

IF (_class_id IS NULL) THEN
INSERT INTO concept_class (name, description, creator, date_created, uuid) VALUES (_name, _description, 1, now(), _uuid);
ELSE
UPDATE concept_class SET name = _name, description = _description WHERE uuid = _uuid;
END IF;

END;
