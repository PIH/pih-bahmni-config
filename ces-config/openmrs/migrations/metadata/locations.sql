-- This file should be used to set up all Locations in the system and to tag these Locations appropriately

-- Locations

call ensure_location('CES Health Center', 'CES Health Center', '9fb2cd26-63a7-4345-9a43-f188033626eb');


-- Login Locations

call ensure_location_has_tag('CES Health Center', 'Login Location');
