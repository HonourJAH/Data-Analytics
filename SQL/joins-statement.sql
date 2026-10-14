-- INNER JOINS

SELECT *
FROM parks_and_recreation.employee_demographics
;

SELECT *
FROM parks_and_recreation.employee_salary
;

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS salary
ON demo.employee_id = salary.employee_id
;

SELECT demo.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS demo
INNER JOIN parks_and_recreation.employee_salary AS salary
ON demo.employee_id = salary.employee_id
;

-- OUTER JOINS
SELECT *
FROM parks_and_recreation.employee_demographics AS demo
LEFT JOIN parks_and_recreation.employee_salary AS salary
ON demo.employee_id = salary.employee_id
;

SELECT *
FROM parks_and_recreation.employee_demographics AS demo
RIGHT JOIN parks_and_recreation.employee_salary AS salary
ON demo.employee_id = salary.employee_id
;

-- SELF JOIN

SELECT emp1.employee_id AS emp_santa_id, emp1.first_name AS first_name_santa, emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name_id, emp2.first_name AS first_name_emp, emp2.last_name AS last_name_emp
FROM parks_and_recreation.employee_salary AS emp1
JOIN parks_and_recreation.employee_salary AS emp2
ON emp1.employee_id + 1 = emp2.employee_id
;

-- Joining multiple tables

SELECT *
FROM parks_and_recreation.parks_departments
;

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS salary
ON dem.employee_id = salary.employee_id
INNER JOIN parks_and_recreation.parks_departments AS pd
ON salary.dept_id = pd.department_id
;













