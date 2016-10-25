 -- Add to program table

CREATE PROCEDURE ensure_program (
                                INOUT new_program_id INT,
                                _program_uuid CHAR(38),
                                program_name VARCHAR(50),
                                program_description VARCHAR(255),
                                program_concept_id INT,
                                program_outcomes_concept_id INT
                                )
BEGIN
  DECLARE _program_id INT;


  SELECT program_id INTO _program_id FROM program WHERE uuid = _program_uuid;

  IF ( _program_id IS NULL ) THEN

    INSERT INTO program (concept_id, outcomes_concept_id, name, description, creator, date_created, changed_by, date_changed, uuid)
        values (program_concept_id,  program_outcomes_concept_id, program_name, program_description, 1, now(), 1, now(), _program_uuid);
      SELECT MAX(program_id) INTO _program_id FROM program;

  END IF;

  SET new_program_id = _program_id;
END;

