-- This file is used to set up PERSON_ATTRIBUTE_TYPE in the system

-- telephoneNumber
call ensure_person_attribute_type('telephoneNumber', 'Telephone Number', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 1, 'f5eaf645-4c78-11e5-9192-080027b662ec');

-- Expediente SSA
call ensure_person_attribute_type('Expediente_SSA', 'Expediente SSA', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 2, 'ac6d9ae7-daf6-4a3c-848d-39d7f38656af');

-- Contact Name
call ensure_person_attribute_type('contactName', 'Contact Name', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 3, '3cd997f2-26fe-102b-80cb-0017a47871b2');

-- Contact Relationship
call ensure_person_attribute_type('contactRelationship', 'Contact Relationship', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 4, '3cd99a68-26fe-102b-80cb-0017a47871b2');

-- Contact Phone Number
call ensure_person_attribute_type('contactPhone', 'Contact Phone Number', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 5, '276f8057-55a4-4b1c-8915-69ad090fcffb');

-- retire givenNameLocal
call ensure_person_attribute_type('givenNameLocal', 'First name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', 5, '7e6db4ea-e42f-11e5-8c3e-08002715d519');

-- retire familyNameLocal
call ensure_person_attribute_type('familyNameLocal', 'Family name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', 6, '7e6f78a4-e42f-11e5-8c3e-08002715d519');

-- retire middleNameLocal
call ensure_person_attribute_type('middleNameLocal', 'Middle name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', 7, '7e709f5b-e42f-11e5-8c3e-08002715d519');