DROP PROCEDURE IF EXISTS pih_concept_reference_term;
CREATE PROCEDURE pih_concept_reference_term (_new_code VARCHAR(250), _uuid VARCHAR(250))
BEGIN
INSERT INTO concept_reference_term (concept_reference_term_id, concept_source_id, code, creator, date_created, UUID) values (NULL, 37, _new_code, 4, NOW(), _uuid);
END;
