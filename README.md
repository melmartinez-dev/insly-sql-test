# Insly Fullstack Test Asignment

![Insly logo](https://insly.com/en/wp-content/themes/Bonamore/img/logo.svg)

## Task

Create a database structure to store employee information. The information stored is as follows:

   - Name
   - Birthdate
   - ID code / SSN
   - Is a current employee (yes/no)
   - Contact information (e-mail, phone, address)

   - The following information in English, Spanish and French:
     - Introduction
     - Previous work experience
     - Education information

   - Log info:
     - Who and when created the entry
     - Who and when last modified the data

2. The information should be presented as an .sql file which can be imported into a database without errors.
3. Write example query to get 1-person data in all languages
4. Add test data for one customer into database

### Local Usage

You can run any of the sripts from the terminal

Example:

```sh
psql -U mel -d insly_test -f script.sql
```
Dev server will be listening at port 3000

### Life is easier, Docker to the rescue !!

```sh
docker-compose up
```

This will spin up a postgres server and a pgadmin4 web interface. When running for first time insly_test database will be created and populated with test data.

