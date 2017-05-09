DROP PROCEDURE IF EXISTS pih_concept_reference_map; 
CREATE PROCEDURE pih_concept_reference_map (_new_code VARCHAR(250), _fully_specified VARCHAR(250), _uuid VARCHAR(250))
BEGIN
INSERT into concept_reference_map (concept_map_id, concept_reference_term_id, concept_map_type_id, creator, date_created, concept_id, UUID) values (NULL, (SELECT concept_reference_term_id from concept_reference_term where code=_new_code), 1, 4, NOW(), (SELECT concept_id from concept_name where name=_fully_specified), _uuid);
END;
