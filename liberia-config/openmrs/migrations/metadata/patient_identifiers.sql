-- This file is used to set up PATIENT_IDENTIFIER_TYPE in the system

-- PATIENT_IDENTIFIER_TYPE
call ensure_patient_identifier_type('Bahmni Id', 'Patient identifier type for use at CES Health Centers', 1, 'NOT_USED', '00deaec3-b452-40cd-9922-7c4a2a09eed3');

call ensure_idgen_identifier_source('00deaec3-b452-40cd-9922-7c4a2a09eed3', 'CES', 'Local identifier generator for CES' ,'1234567890', '100001', 'CES', '', 9, 9, '9fb2cd26-63a7-4345-9a43-f188033626eb');
