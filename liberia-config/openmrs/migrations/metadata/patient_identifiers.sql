-- This file is used to set up PATIENT_IDENTIFIER_TYPE in the system

-- PATIENT_IDENTIFIER_TYPE
call ensure_patient_identifier_type('Bahmni Id', 'Patient identifier type for use at Liberia Health Centers', 1, '7dfc1a64-e42f-11e5-8c3e-08002715d519');

call ensure_idgen_identifier_source('7dfc1a64-e42f-11e5-8c3e-08002715d519', 'LIB', 'Local identifier generator for Liberia' ,'1234567890', '100001', 'LIB', '', 9, 9, '586357AF-895A-4953-ACBD-8036214D46D6');