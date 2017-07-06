set @concept_id = 0;

-- "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519',
  'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet',
  true);
set @obs_templates = @concept_id;

-- PHQ-9 concept set: : PIH concept
call ensure_concept(@concept_id, '5812b5cc-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Form', 'PHQ-9 Form', 'N/A',
  'ConvSet', true);
set @phq9_concept_set = @concept_id;
call ensure_concept_set_members(@obs_templates, @phq9_concept_set, 1);

call ensure_concept(@concept_id, '6104deee-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Problem Set', 'Problems in Last 2 weeks', 'N/A', 'ConvSet',
  true);
set @phq9_problem_set = @concept_id;
insert into concept_description (concept_id, description, locale, creator,
  date_created, uuid)
values (@concept_id, 'Over the last 2 weeks, how often have you been bothered by any of the following problems?',
  'en', 1, now(), uuid());
call ensure_concept_set_members(@phq9_concept_set, @phq9_problem_set, 1);

-- Possible answers to PHQ-9 questions
-- PIH concept
call ensure_concept(@concept_id, '3cdeff80-26fe-102b-80cb-0017a47871b2',
  'Not at all', 'Not at all', 'N/A', 'Misc', false);
set @not_at_all = @concept_id;
call ensure_concept(@concept_id, '6fb11f84-496d-11e7-8dbe-a0063c1ad1c7',
  'Several days', 'Several days', 'N/A', 'Misc', false);
set @several_days = @concept_id;
call ensure_concept(@concept_id, '7a87681e-496d-11e7-8dbe-a0063c1ad1c7',
  'More than half the days', 'More than half the days', 'N/A', 'Misc', false);
set @more_than_half_the_days = @concept_id;
call ensure_concept(@concept_id, '82406268-496d-11e7-8dbe-a0063c1ad1c7',
  'Nearly every day', 'Nearly every day', 'N/A', 'Misc', false);
set @nearly_every_day = @concept_id;

call ensure_concept(@concept_id, '896b1588-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Little interest or pleasure in doing things',
  'Little interest or pleasure in doing things', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 1);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '902978ce-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Feeling down, depressed, or hopeless',
  'Feeling down, depressed, or hopeless', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, 'ee21f4e0-49fb-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Trouble falling or staying asleep, or sleeping too much',
  'Trouble falling or staying asleep, or sleeping too much', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, 'fb61615e-49fb-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Feeling tired or having little energy',
  'Feeling tired or having little energy', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '06bfb3f2-49fc-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Poor appetite or overeating',
  'Poor appetite or overeating', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '0decb562-49fc-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Feeling bad about yourself',
  'Feeling bad about yourself — or that you are a failure or
have let yourself or your family down', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '174dc92a-49fc-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Trouble concentrating',
  'Trouble concentrating on things, such as reading the
newspaper or watching television', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '20a91330-49fc-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Moving or speaking slowly',
  'Moving or speaking so slowly that other people could have
noticed? Or the opposite — being so fidgety or restless
that you have been moving around a lot more than usual', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '2a078d44-49fc-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Harmful thoughts',
  'Thoughts that you would be better off dead or of hurting
yourself in some way', 'Coded', 'Question', false);
call ensure_concept_set_members(@phq9_problem_set, @concept_id, 2);
call ensure_concept_answer(@concept_id, @not_at_all, 1);
call ensure_concept_answer(@concept_id, @several_days, 2);
call ensure_concept_answer(@concept_id, @more_than_half_the_days, 3);
call ensure_concept_answer(@concept_id, @nearly_every_day, 4);

call ensure_concept(@concept_id, '9d553f4c-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Total Score', 'PHQ-9 Total Score', 'Numeric', 'Finding', false);
call ensure_concept_numeric(@concept_id, 27, NULL, NULL, 0, NULL, NULL,
  NULL, 0, NULL);

-- Difficulty Caused by Problems
call ensure_concept(@concept_id, '7be1084e-4a00-11e7-a9e1-f1a66b257af4',
  'PHQ-9 Difficulty Caused by Problems Set', 'Difficulty Caused by Problems',
  'N/A', 'ConvSet', true);
set @phq9_problem_difficulty_set = @concept_id;
call ensure_concept_set_members(@phq9_concept_set, @phq9_problem_difficulty_set,
  2);

call ensure_concept(@concept_id, 'aecfa06e-496d-11e7-8dbe-a0063c1ad1c7',
  'PHQ-9 Difficulty Caused by Problems',
  'If you checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?',
  'Coded', 'Question', false);
set @difficulty_assessment = @concept_id;
call ensure_concept_set_members(@phq9_problem_difficulty_set, @concept_id, 1);

-- Difficulty Assessment answers
call ensure_concept(@concept_id, 'b4d0fcec-496d-11e7-8dbe-a0063c1ad1c7',
  'Not difficult', 'Not difficult', 'N/A', 'Misc', false);
call ensure_concept_answer(@difficulty_assessment, @concept_id, 1);

call ensure_concept(@concept_id, 'bc8be820-496d-11e7-8dbe-a0063c1ad1c7',
  'Somewhat difficult', 'Somewhat difficult', 'N/A', 'Misc', false);
call ensure_concept_answer(@difficulty_assessment, @concept_id, 2);

call ensure_concept(@concept_id, 'c2c07f76-496d-11e7-8dbe-a0063c1ad1c7',
  'Very difficult', 'Very difficult', 'N/A', 'Misc', false);
call ensure_concept_answer(@difficulty_assessment, @concept_id, 3);

call ensure_concept(@concept_id, 'c80cb026-496d-11e7-8dbe-a0063c1ad1c7',
  'Extremely difficult', 'Extremely difficult', 'N/A', 'Misc', false);
call ensure_concept_answer(@difficulty_assessment, @concept_id, 4);
