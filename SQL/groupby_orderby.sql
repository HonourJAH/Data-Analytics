-- GROUP BY
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT gender, COUNT(gender), AVG(age), MIN(age), MAX(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT first_name
FROM parks_and_recreation.employee_demographics
GROUP BY first_name;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT occupation, salary, COUNT(occupation)
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary;

-- ORDER BY
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age;