 -- Add to program workflow table

CREATE PROCEDURE ensure_program_workflow (
                                INOUT new_program_workflow_id INT,
                                _program_workflow_uuid CHAR(38),
                                program_id INT,
                                program_concept_id INT
                                )
BEGIN
  DECLARE _program_workflow_id INT;


  SELECT program_workflow_id INTO _program_workflow_id FROM program_workflow WHERE uuid = _program_workflow_uuid;

  IF ( _program_workflow_id IS NULL ) THEN

    INSERT INTO program_workflow (program_id, concept_id, creator, date_created, changed_by, date_changed, uuid)
        values (program_id, program_concept_id, 1, now(), 1, now(), _program_workflow_uuid);
      SELECT MAX(program_workflow_id) INTO _program_workflow_id FROM program_workflow;

  END IF;

  SET new_program_workflow_id = _program_workflow_id;
END;

