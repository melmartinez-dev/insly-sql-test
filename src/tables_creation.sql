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