-- This file is used to set up Vitals concept_set

set @concept_id = 0;

-- Vitals concept set: : PIH concept
call ensure_concept(@concept_id, '3cd74ee8-26fe-102b-80cb-0017a47871b2', 'Vitals','Vitals', 'N/A', 'Misc', true);
set @vitals_concept_id = @concept_id;

-- Add Vitals to "All Observation Templates" concept set: Wellbody concept
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @vitals_concept_id, 1);

-- Height Set: Wellbody concept
call ensure_concept(@concept_id, '86ffa474-2a7d-11e6-a94f-08002715d519', 'Height Set','Height', 'N/A', 'ConvSet', true);
set @height_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @height_concept_id, 1);

--  Height Data: Wellbody concept
call ensure_concept(@concept_id, '7414450f-2a7d-11e6-a94f-08002715d519', 'Height Data','Height', 'N/A', 'Concept Details', true);
set @Height_data_concept_id = @concept_id;
call ensure_concept_set_members(@height_concept_id, @height_data_concept_id, 1);

--  Height: PIH concept
call ensure_concept(@concept_id, '3ce93cf2-26fe-102b-80cb-0017a47871b2', 'Height','Height', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@height_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 228, NULL, NULL, 10, NULL, NULL, 'cm', 0, NULL);

-- Weight Set: Wellbody concept
call ensure_concept(@concept_id, '7d52a2de-080a-43be-858a-377ebffacb34', 'Weight Set','Weight', 'N/A', 'ConvSet', true);
set @weight_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @weight_concept_id, 2);

--  Weight Data: Wellbody concept
call ensure_concept(@concept_id, '7d308557-5cb9-4bc4-9827-2d55dc8edfd6', 'Weight Data','Weight', 'N/A', 'Concept Details', true);
set @weight_data_concept_id = @concept_id;
call ensure_concept_set_members(@weight_concept_id, @weight_data_concept_id, 1);

--  Weight: PIH concept
call ensure_concept(@concept_id, '3ce93b62-26fe-102b-80cb-0017a47871b2', 'Weight','Weight', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@weight_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 250, NULL, NULL, 0.1, NULL, NULL, 'kg', 0, NULL);

-- Weight Abnormal: Wellbody concept
call ensure_concept(@concept_id, '74c42c16-a8f9-4ce7-80ad-a0ec0184df6f', 'Weight Abnormal','Weight Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@weight_data_concept_id, @child_concept_id, 2);

-- Blood Pressure Set: Wellbody concept
call ensure_concept(@concept_id, 'c36d22e6-3f10-11e4-adec-0800271c1b75', 'Blood Pressure Set','Blood Pressure', 'N/A', 'ConvSet', true);
set @blood_pressure_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @blood_pressure_concept_id, 4);

-- Systolic Data: Wellbody concept
call ensure_concept(@concept_id, 'c36ddb6d-3f10-11e4-adec-0800271c1b75', 'Systolic Data','Systolic', 'N/A', 'Concept Details', true);
set @systolic_data_concept_id = @concept_id;
call ensure_concept_set_members(@blood_pressure_concept_id, @systolic_data_concept_id, 1);

-- Systolic: PIH concept
call ensure_concept(@concept_id, '3ce934fa-26fe-102b-80cb-0017a47871b2', 'Systolic','Systolic', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@systolic_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 300, NULL, 160, 30, NULL, 75, 'mm Hg', 0, NULL);

-- Systolic Abnormal: Wellbody concept
call ensure_concept(@concept_id, 'c36f5a8b-3f10-11e4-adec-0800271c1b75', 'Systolic Abnormal','Systolic Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@systolic_data_concept_id, @child_concept_id, 2);

-- Diastolic Data: Wellbody concept
call ensure_concept(@concept_id, 'c378f635-3f10-11e4-adec-0800271c1b75', 'Diastolic Data','Diastolic', 'N/A', 'Concept Details', true);
set @diastolic_data_concept_id = @concept_id;
call ensure_concept_set_members(@blood_pressure_concept_id, @diastolic_data_concept_id, 2);

-- Diastolic: PIH concept
call ensure_concept(@concept_id, '3ce93694-26fe-102b-80cb-0017a47871b2', 'Diastolic','Diastolic', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@diastolic_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 150, NULL, 100, 20, NULL, 45, 'mm Hg', 0, NULL);

-- Diastolic Abnormal: Wellbody concept
call ensure_concept(@concept_id, 'c37a5735-3f10-11e4-adec-0800271c1b75', 'Diastolic Abnormal','Diastolic Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@diastolic_data_concept_id, @child_concept_id, 2);

-- Blood Oxygen Set: Wellbody concept
call ensure_concept(@concept_id, '54cf74db-fad6-4a7d-bfe2-750424727f90', 'Blood Oxygen Saturation Set','Blood Oxygen', 'N/A', 'ConvSet', true);
set @oxygen_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @oxygen_concept_id, 5);

--  Blood Oxygen Data: Wellbody concept
call ensure_concept(@concept_id, 'd4aaacd9-de67-4187-be85-849e303a3363', 'Blood Oxygen Saturation Data','Blood Oxygen Saturation Data', 'N/A', 'Concept Details', true);
set @oxygen_data_concept_id = @concept_id;
call ensure_concept_set_members(@oxygen_concept_id, @oxygen_data_concept_id, 1);

--  Oxygen Saturation: PIH concept
call ensure_concept(@concept_id, '3ce9401c-26fe-102b-80cb-0017a47871b2', 'Blood Oxygen Saturation',' SAO2', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@oxygen_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 100, NULL, 100, 30, NULL, 94, '%', 0, NULL);

-- Oxygen Saturation Abnormal: Wellbody concept
call ensure_concept(@concept_id, '2cf2580f-ab29-4f58-951b-8dd2613ce091', 'Blood Oxygen Saturation Abnormal', 'Blood Oxygen Saturation Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@oxygen_data_concept_id, @child_concept_id, 2);

-- Glucose Set: new
call ensure_concept(@concept_id, '88e77141-aacf-4286-b2bc-5acc53c15109', 'Glucose Set','Glucose', 'N/A', 'ConvSet', true);
set @glucose_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @glucose_concept_id, 6);

--  Glucose Data: new
call ensure_concept(@concept_id, '88d130ed-3553-4be5-845c-8ffb1584715a', 'Glucose Data','Glucose', 'N/A', 'Concept Details', true);
set @glucose_data_concept_id = @concept_id;
call ensure_concept_set_members(@glucose_concept_id, @glucose_data_concept_id, 1);

-- Glucose(F): new
call ensure_concept(@concept_id, '705d0c1d-1e3e-4507-90f1-b4020569eacb', 'Glucose(F)', 'Glucose(F)', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@glucose_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 110, NULL, NULL, 70, 'mg/dL', 0, NULL);

-- Glucose Abnormal: new
call ensure_concept(@concept_id, 'bff209da-8c30-4240-92d8-ad77e8353d1d', 'Glucose Abnormal','Glucose Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@glucose_data_concept_id, @child_concept_id, 2);

-- Temperature Set: Wellbody concept
call ensure_concept(@concept_id, '85bfd9d5-0c3c-4e78-b55f-8467d34c005a', 'Temperature Set','Temperature', 'N/A', 'ConvSet', true);
set @temp_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @temp_concept_id, 7);

-- Temperature Data: Wellbody concept
call ensure_concept(@concept_id, 'c37afa71-3f10-11e4-adec-0800271c1b75', 'Temperature Data','Temperature', 'N/A', 'Concept Details', true);
set @temp_data_concept_id = @concept_id;
call ensure_concept_set_members(@temp_concept_id, @temp_data_concept_id, 1);

-- Temperature: PIH concept
call ensure_concept(@concept_id, '3ce939d2-26fe-102b-80cb-0017a47871b2', 'Temperature','Temperature', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@temp_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 43, NULL, 38, 25, NULL, 36, 'C', 0, NULL);

-- Temperature Abnormal: Wellbody concept
call ensure_concept(@concept_id, 'c37c942d-3f10-11e4-adec-0800271c1b75', 'Temperature Abnormal','Temperature Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@temp_data_concept_id, @child_concept_id, 2);

-- Pulse Set: Wellbody concept
call ensure_concept(@concept_id, 'C485C3CF-4BEA-4389-A9C8-20111F66EAC2', 'Pulse Set','Pulse', 'N/A', 'ConvSet', true);
set @pulse_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @pulse_concept_id, 8);

-- Pulse Data: new
call ensure_concept(@concept_id, '6d4330dd-31e3-40fe-b472-b66a92fb47fa', 'Pulse Data','Pulse', 'N/A', 'Concept Details', true);
set @pulse_data_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_concept_id, @pulse_data_concept_id, 1);

-- Pulse: PIH concept
call ensure_concept(@concept_id, '3ce93824-26fe-102b-80cb-0017a47871b2', 'Pulse','Pulse', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 300, NULL, 140, 20, NULL, 55, '/min', 0, NULL);

-- Pulse Abnormal: Wellbody concept
call ensure_concept(@concept_id, 'c36c7c98-3f10-11e4-adec-0800271c1b75', 'Pulse Abnormal','Pulse Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 2);

-- Respiratory Rate Set: Wellbody concept
call ensure_concept(@concept_id, '00ca72e2-cc86-4d36-aeb1-b90f803f6c9c', 'Respiratory Rate Set','Respiratory Rate', 'N/A', 'ConvSet', true);
set @rr_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @rr_concept_id, 9);

--  Respiratory Rate Data: Wellbody concept
call ensure_concept(@concept_id, '1ed7b7d0-b09d-4b24-8f27-22c816c5ac06', 'Respiratory Rate Data','Respiratory Rate', 'N/A', 'Concept Details', true);
set @rr_data_concept_id = @concept_id;
call ensure_concept_set_members(@rr_concept_id, @rr_data_concept_id, 1);

--  Respiratory Rate: PIH concept
call ensure_concept(@concept_id, '3ceb11f8-26fe-102b-80cb-0017a47871b2', 'Respiratory Rate','Respiratory Rate', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@rr_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, 120, NULL, 32, 0, NULL, 12, '/min', 0, NULL);

-- Respiratory Rate Abnormal: Wellbody concept
call ensure_concept(@concept_id, 'ab33bc98-ac76-4c5d-8c51-579dc06ce657', 'Respiratory Rate Abnormal','Respiratory Rate Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@rr_data_concept_id, @child_concept_id, 2);

-- Chief Complaint: PIH concept
call ensure_concept(@concept_id, 'a80392d7-a0d3-4a26-bdca-123fbbc2f4cb', 'Chief Complaint', 'Chief Complaint', 'Text', 'Finding', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @child_concept_id, 10);

