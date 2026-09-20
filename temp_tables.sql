-- Temporary Tables

CREATE TEMPORARY TABLE temp_table(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

INSERT INTO temp_table
VALUES('Alex', 'Freberg', 'Lord of the Ring: The Two Towers')
;

SELECT *
FROM temp_table;

DROP TEMPORARY TABLE IF EXISTS salary_over_50k;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;
