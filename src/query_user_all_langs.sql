SELECT employees.name, birthdate, identity_code_ssn, is_current_employee, email, phone_number, address, introduction, work_experience,education, iso_code, languages.name
	FROM employees 
	INNER JOIN employees_information 
		ON employees.id = employees_information.employee_id
	INNER JOIN languages
		ON languages.id = employees_information.language_id;