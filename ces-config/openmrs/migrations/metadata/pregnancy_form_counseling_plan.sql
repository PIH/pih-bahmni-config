-- All PIH concepts unless otherwise noted

set @concept_id = 0;

-- Yes, No, Unknown
call ensure_concept(@concept_id, '3cd6f600-26fe-102b-80cb-0017a47871b2', 'Yes',
  'Yes', 'N/A', 'Misc', false);
set @yes = @concept_id;
call ensure_concept(@concept_id, '3cd6f86c-26fe-102b-80cb-0017a47871b2', 'No',
  'No', 'N/A', 'Misc', false);
set @no = @concept_id;
call ensure_concept(@concept_id, '3cd6fac4-26fe-102b-80cb-0017a47871b2',
  'Unknown','Unknown', 'N/A', 'Misc', false);
set @unknown = @concept_id;

-- normal, abnormal, done
call ensure_concept(@concept_id, '3cd750a0-26fe-102b-80cb-0017a47871b2',
  'Normal', 'Normal', 'N/A', 'Misc', false);
set @normal = @concept_id;
call ensure_concept(@concept_id, '3cd75230-26fe-102b-80cb-0017a47871b2',
  'Abnormal', 'Abnormal', 'N/A', 'Misc', false);
set @abnormal = @concept_id;
call ensure_concept(@concept_id, '3cd75550-26fe-102b-80cb-0017a47871b2',
  'Not done', 'Not done', 'N/A', 'Misc', false);
set @not_done = @concept_id;

-- defined in pregnancy_form_general.sql
call ensure_concept(@concept_id, '98a7dda0-a1f3-11e7-940e-080027e99513',
  'Pregnancy Form', 'Pregnancy Form', 'N/A',
  'ConvSet', true);
set @pregnancy_form = @concept_id;
call ensure_concept_set_members(@obs_templates, @pregnancy_form, 1);

call ensure_concept(@concept_id, '1382AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Family Planning Counseling', 'Family Planning Counseling', 'Coded',
  'Misc', false);
set @family_planning_counseling = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @family_planning_counseling,
  4);
call ensure_concept_answer(@family_planning_counseling, @yes, 1);
call ensure_concept_answer(@family_planning_counseling, @no, 2);
call ensure_concept_answer(@family_planning_counseling, @unknown, 3);

-- new
call ensure_concept(@concept_id, 'bdfe46cf-a1f4-11e7-940e-080027e99513',
  'Lactation Counseling', 'Lactation Counseling', 'Coded', 'Misc', false);
set @lactation_counseling = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @lactation_counseling,
  5);
call ensure_concept_answer(@lactation_counseling, @yes, 1);
call ensure_concept_answer(@lactation_counseling, @no, 2);
call ensure_concept_answer(@lactation_counseling, @unknown, 3);

call ensure_concept(@concept_id, '161541AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Counseling on postpartum danger signs',
  'Counseling on postpartum danger signs' , 'Coded', 'Misc', false);
set @postpartum_monitoring_counseling = @concept_id;
call ensure_concept_set_members(@pregnancy_form,
  @postpartum_monitoring_counseling, 6);
call ensure_concept_answer(@postpartum_monitoring_counseling, @yes, 1);
call ensure_concept_answer(@postpartum_monitoring_counseling, @no, 2);
call ensure_concept_answer(@postpartum_monitoring_counseling, @unknown, 3);


-- new
call ensure_concept(@concept_id, 'bf6059a9-a1f5-11e7-940e-080027e99513',
  'Birth Plan Set', 'Birth Plan', 'N/A', 'ConvSet', true);
set @birth_plan_set = @concept_id;
call ensure_concept_set_members(@pregnancy_form, @birth_plan_set, 7);

-- new
call ensure_concept(@concept_id, 'c7732f16-a1f5-11e7-940e-080027e99513',
  'Planned Method of Delivery', 'Planned Method of Delivery' , 'Coded',
  'Question', false);
set @planned_delivery_method = @concept_id;
call ensure_concept_set_members(@birth_plan_set, @planned_delivery_method,
  1);

call ensure_concept(@concept_id, '162595AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Vaginal Delivery', 'Vaginal Delivery' , 'N/A', 'Finding', false);
call ensure_concept_set_members(@planned_delivery_method, @concept_id, 1);

call ensure_concept(@concept_id, '1171AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Caesarean Section', 'Caesarean Section' , 'N/A', 'Procedure', false);
call ensure_concept_set_members(@planned_delivery_method, @concept_id, 2);

call ensure_concept(@concept_id, '159757AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Preferred Location for Birth', 'Preferred Location for Birth' , 'Coded',
  'Question', false);
set @preferred_birth_location = @concept_id;
call ensure_concept_set_members(@birth_plan_set, @preferred_birth_location, 2);

call ensure_concept(@concept_id, '159670AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Sub-district Hospital', 'Sub-district Hospital' , 'N/A', 'Misc', false);
call ensure_concept_answer(@preferred_birth_location, @concept_id, 1);

call ensure_concept(@concept_id, '159671AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Provincial Hospital', 'Provincial Hospital' , 'N/A', 'Misc', false);
call ensure_concept_answer(@preferred_birth_location, @concept_id, 2);

call ensure_concept(@concept_id, '159662AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'District Hospital', 'District Hospital' , 'N/A', 'Misc', false);
call ensure_concept_answer(@preferred_birth_location, @concept_id, 3);

call ensure_concept(@concept_id, '1536AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Home', 'Home' , 'N/A', 'Misc', false);
call ensure_concept_answer(@preferred_birth_location, @concept_id, 4);

call ensure_concept(@concept_id, '1588AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Health Clinic/Post', 'Health Clinic/Post' , 'N/A', 'Misc', false);
call ensure_concept_answer(@preferred_birth_location, @concept_id, 5);

call ensure_concept(@concept_id, '159759AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Mother''s Preferred Feeding Method', 'Mother''s Preferred Feeding Method',
  'Coded', 'Question', false);
set @preferred_feeding_method = @concept_id;
call ensure_concept_set_members(@birth_plan_set, @preferred_feeding_method, 3);

call ensure_concept(@concept_id, '1150AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Breastfed Predominately', 'Breastfed Predominately', 'N/A', 'Finding', false);
set @breastfed_predominately = @concept_id;
call ensure_concept_set_members(@preferred_feeding_method,
  @breastfed_predominately, 1);

call ensure_concept(@concept_id, '5526AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  'Breastfed Exclusively', 'Breastfed Exclusively', 'Coded', 'Finding', false);
set @breastfed_exclusively = @concept_id;
call ensure_concept_set_members(@preferred_feeding_method,
  @breastfed_exclusively, 2);

-- new
call ensure_concept(@concept_id, 'd2835065-a1f5-11e7-940e-080027e99513',
  'Preferred Companion', 'Preferred Companion',
  'Text', 'Misc', false);
call ensure_concept_set_members(@birth_plan_set, @concept_id, 4);

-- new
call ensure_concept(@concept_id, 'da210b32-a1f5-11e7-940e-080027e99513',
  'Transportation (in case of emergency)',
  'Transportation (in case of emergency)', 'Text', 'Misc', false);
call ensure_concept_set_members(@birth_plan_set, @concept_id, 5);
