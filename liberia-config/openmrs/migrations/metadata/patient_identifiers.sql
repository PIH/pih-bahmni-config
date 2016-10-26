-- This file is used to set up PATIENT_IDENTIFIER_TYPE in the system

-- PATIENT_IDENTIFIER_TYPE
call ensure_patient_identifier_type('Bahmni Id', 'Patient identifier type for use at Liberia Health Centers', 1, 'NOT_USED', 'FDC6DDD1-CE83-4814-9922-6E9AC0F1F443');

call ensure_idgen_identifier_source('FDC6DDD1-CE83-4814-9922-6E9AC0F1F443', 'Liberia', 'Local identifier generator for Liberia' ,'1234567890', '100001', 'CES', '', 9, 9, '586357AF-895A-4953-ACBD-8036214D46D6');
