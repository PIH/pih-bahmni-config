SET @concept_id = 0;


SET @concept_name_short_id = 0;


SET @concept_name_full_id = 0;


SELECT concept_id INTO @other_concept_id
FROM concept_view
WHERE concept_full_name = 'Baseline, Date of baseline';


SELECT concept_id INTO @set_concept_id
FROM concept_view
WHERE concept_full_name = 'Baseline Template';

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is the day of baseline assesment estimated?', 'Is the day of SAE onset estimated?', 'Boolean', 'Misc', FALSE);


SET @child1_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is the month of baseline assessment estimated?', 'Is the month of baseline assessment estimated?', 'Boolean', 'Misc', FALSE);


SET @child2_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is the year of baseline assessment estimated?', 'Is the year of baseline assessment estimated?', 'Boolean', 'Misc', FALSE);


SET @child3_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is day of HIV Diagnosis estimated?', 'Is day of HIV diagnosis estimated?', 'Boolean', 'Misc', FALSE);


SET @child4_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is month of HIV Diagnosis estimated?', 'Is month of HIV diagnosis estimated?', 'Boolean', 'Misc', FALSE);


SET @child5_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is year of HIV Diagnosis estimated?', 'Is year of HIV diagnosis estimated?', 'Boolean', 'Misc', FALSE);


SET @child6_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is day of Rifampicin resistant or MDR TB diagnosis estimated?', 'Is day of Rifampicin resistant or MDR TB diagnosis estimated?', 'Boolean', 'Misc', FALSE);


SET @child7_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is month of Rifampicin resistant or MDR-TB diagnosis estimated?', 'Is month of Rifampicin resistant or MDR-TB diagnosis estimated?', 'Boolean', 'Misc', FALSE);


SET @child8_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is year of Rifampicin resistant or MDR-TB diagnosis estimated?', 'Is year of Rifampicin resistant or MDR-TB diagnosis estimated?', 'Boolean', 'Misc', FALSE);

Baseline, 
SET @child9_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is day of last CD4 count date estimated?', 'Is day of last CD4 count estimated?', 'Boolean', 'Misc', FALSE);


SET @child10_concept_id = @concept_id;
CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is month of last CD4 count date estimated?', 'Is month of last CD4 count date estimated?', 'Boolean', 'Misc', FALSE);


SET @child11_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is year of last CD4 count date estimated?', 'Is year of last CD4 count date estimated?', 'Boolean', 'Misc', FALSE);


SET @child12_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is day of last RNA viral load estimated?', 'Is day of last RNA viral load estimated?', 'Boolean', 'Misc', FALSE);


SET @child14_concept_id = @concept_id;
CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is month of last RNA viral load estimated?', 'Is month of last RNA viral load estimated?', 'Boolean', 'Misc', FALSE);


SET @child15_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is year of last RNA viral load estimated?', 'Is year of last RNA viral load estimated?', 'Boolean', 'Misc', FALSE);


SET @child16_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is day of ARV initiation treatment start date estimated?', 'Is day of ARV initiation treatment start date estimated?', 'Boolean', 'Misc', FALSE);


SET @child17_concept_id = @concept_id;
CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is month of ARV initiation treatment start date estimated?', 'Is month of ARV initiation treatment start date estimated?', 'Boolean', 'Misc', FALSE);


SET @child18_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is year of ARV initiation treatment start date estimated?', 'Is year of ARV initiation treatment start date estimated?', 'Boolean', 'Misc', FALSE);


SET @child19_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is day of baseline physical examination estimated?', 'Is day of baseline physical examination estimated?', 'Boolean', 'Misc', FALSE);


SET @child20_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is month of baseline physical examination estimated?', 'Is month of baseline physical examination estimated?', 'Boolean', 'Misc', FALSE);


SET @child21_concept_id = @concept_id;

CALL add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Baseline, Is year of baseline physical examination estimated?', 'Is year of baseline physical examination estimated?', 'Boolean', 'Misc', FALSE);


SET @child22_concept_id = @concept_id
