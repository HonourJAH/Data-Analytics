-- Subqueries

SELECT *
FROM parks_and_recreation.employee_salary
;
SELECT *
FROM parks_and_recreation.employee_demographics
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN ( SELECT employee_id
						FROM parks_and_recreation.employee_salary
						WHERE dept_id = 1 )
;

-- using join for the query above
SELECT dem.employee_id, dem.first_name, dem.last_name, dem.age, dem.gender, dem.birth_date
FROM parks_and_recreation.employee_demographics dem
INNER JOIN parks_and_recreation.employee_salary sal
    ON dem.employee_id = sal.employee_id
    AND sal.dept_id = 1
;

SELECT first_name, salary, (SELECT AVG(salary) FROM parks_and_recreation.employee_salary) AS Avg_salary
FROM parks_and_recreation.employee_salary
;

SELECT *
FROM (SELECT gender,
AVG(age) as avg_age,
MAX(age) as max_age,
MIN(age)  as min_age,
COUNT(age) as counts
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Agg_table
;

