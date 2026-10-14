SELECT * FROM parks_and_recreation.employee_salary;

SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name, birth_date, age, age + 10 FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name, age FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender, last_name FROM parks_and_recreation.employee_demographics;


-- SQL follows PEMDAS: parenthesis, exponent, multiplication, division, addition, substraction