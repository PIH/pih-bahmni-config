-- This file should be used to set up all Locations in the system and to tag these Locations appropriately

-- Locations

call ensure_location('Pleebo Health Center', 'Pleebo Health Center', '586357AF-895A-4953-ACBD-8036214D46D6');


-- Login Locations

call ensure_location_has_tag('Pleebo Health Center', 'Login Location');
