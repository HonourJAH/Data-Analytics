SELECT * FROM parks_and_recreation.employee_demographics WHERE birth_date = '1985-01-01' OR gender = "Male";

SELECT * FROM parks_and_recreation.parks_departments;

SELECT * FROM parks_and_recreation.employee_salary WHERE salary >= 50000;

-- LIKE statement: % and _
SELECT * FROM parks_and_recreation.employee_demographics WHERE birth_date LIKE '1989%';
