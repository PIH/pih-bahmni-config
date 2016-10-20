 -- Add to program workflow state table

CREATE PROCEDURE ensure_program_workflow_state (
                                _program_workflow_state_uuid CHAR(38),
                                program_workflow_id INT,
                                program_state_concept_id INT,
                                initial_state TINYINT,
                                terminal_state TINYINT
                                )
BEGIN
  DECLARE _program_workflow_state_id INT;

  SELECT program_workflow_state_id INTO _program_workflow_state_id FROM program_workflow_state WHERE uuid = _program_workflow_state_uuid;

  IF ( _program_workflow_state_id IS NULL ) THEN

    INSERT INTO program_workflow_state (program_workflow_id, concept_id, intial, terminal, creator, date_created, changed_by, date_changed, uuid)
        values (program_workflow_id, program_state_concept_id,initial_state, terminal_state, 1, now(), 1, now(), _program_workflow_state_uuid);

  END IF;

END;

