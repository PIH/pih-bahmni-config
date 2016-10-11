-- This file is used to set up VISIT_TYPE in the system


-- OPD Visit Type
call ensure_visit_type('General OPD', 'Visit for patients coming for OPD', '1C8B8D48-8001-4218-B96A-3C7EA38A63F7');

call ensure_visit_type('Mental Health', 'Visit for patients coming for Mental Health service', '3ced9a68-26fe-102b-80cb-0017a47871b2');

call ensure_visit_type('Maternal Health', 'Visit for patients coming for Maternal Health service', '159937AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

call ensure_visit_type('Other', 'Visit for patients coming for Other service', '3cee7fb4-26fe-102b-80cb-0017a47871b2');