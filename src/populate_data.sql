INSERT INTO public.employees(
	name, birthdate, identity_code_ssn, is_current_employee, email, phone_number, address)
	VALUES ( 'Mel', '1995-10-18', '2342423F', true, 'melmartinez.dev@gmail.com', '+5326345862', '3883 Lamberts Branch Road, Miami, FL');

INSERT INTO public.languages(
	 iso_code, name)
	VALUES ( 'EN', 'English');
INSERT INTO public.languages(
	 iso_code, name)
	VALUES ( 'ES', 'Español');
INSERT INTO public.languages(
	 iso_code, name)
	VALUES ( 'FR', 'Français');
-- Info for English, spanish and french
INSERT INTO public.employees_information(
	introduction, work_experience, education, employee_id, language_id)
	VALUES (
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		1,1);

INSERT INTO public.employees_information(
	introduction, work_experience, education, employee_id, language_id)
	VALUES (
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		1,2);


INSERT INTO public.employees_information(
	introduction, work_experience, education, employee_id, language_id)
	VALUES (
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo neque. Morbi et luctus leo. Nullam ultricies ipsum orci. ',
		1,3);

