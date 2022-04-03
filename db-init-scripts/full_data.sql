 DROP DATABASE IF EXISTS insly_test;
    CREATE DATABASE insly_test
        WITH 
        OWNER = mel
        ENCODING = 'UTF8'
        CONNECTION LIMIT = -1;
    \c insly_test;

-- Drop old tables
ALTER TABLE IF EXISTS public.employees_information 
  DROP CONSTRAINT fk_employees_employee_id,
  DROP CONSTRAINT fk_languages_language_id;
DROP TABLE IF EXISTS public.employees_information;
DROP TABLE IF EXISTS public.employees;
DROP TABLE IF EXISTS public.languages;
DROP TABLE IF EXISTS public.logs;
-- Employees table
CREATE TABLE public.employees
(
    id serial NOT NULL,
    name character varying(128) NOT NULL,
    birthdate date NOT NULL,
    identity_code_ssn character varying(32) NOT NULL,
    is_current_employee boolean NOT NULL,
    email character varying(128) NOT NULL,
    phone_number character varying(32) NOT NULL,
    address character varying(128) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.employees
    OWNER to mel;

-- Languages table
CREATE TABLE public.languages
(
    id serial NOT NULL,
    iso_code character varying(6) NOT NULL,
    name character varying(16) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT iso_code_unique UNIQUE (iso_code)
);

ALTER TABLE IF EXISTS public.languages
    OWNER to mel;


-- Employees information table
CREATE TABLE public.employees_information
(
    id serial NOT NULL,
    introduction character varying(512) NOT NULL,
    work_experience character varying(512) NOT NULL,
    education character varying(512) NOT NULL,
    employee_id serial NOT NULL,
    language_id serial NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_employees_employee_id FOREIGN KEY (employee_id)
        REFERENCES public.employees (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
     CONSTRAINT fk_languages_language_id FOREIGN KEY (language_id)
        REFERENCES public.languages (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.employees_information
    OWNER to mel;

-- Logs
CREATE TABLE public.logs
(
    id serial NOT NULL,
    row_id serial NOT NULL,
    table_name character varying(32) NOT NULL,
    operation character varying(16) NOT NULL,
    user_name character varying(32) NOT NULL,
    operation_date timestamp(0) with time zone NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.logs
    OWNER to mel;

CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $dummy_table$
    DECLARE affected integer;
    BEGIN
        IF(TG_OP='DELETE') THEN 
            affected := old.id; 
        ELSE 
            affected := new.id; 
        END IF;
        INSERT INTO logs(row_id,table_name,operation,user_name, operation_date) 
        VALUES (affected,TG_TABLE_NAME,TG_OP,user, current_timestamp);
        RETURN null;
    END;
$dummy_table$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER employee_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON employees FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();
CREATE OR REPLACE TRIGGER employee_information_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON employees_information FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();
CREATE OR REPLACE TRIGGER languages_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON languages FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();

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

