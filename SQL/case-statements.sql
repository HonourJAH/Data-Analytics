-- Case Statements

SELECT *
FROM parks_and_recreation.employee_salary
;

SELECT *
FROM parks_and_recreation.parks_departments
;

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Adult'
    WHEN age >= 50 THEN 'Old'
END AS Age_Bracket
FROM parks_and_recreation.employee_demographics
;


SELECT first_name, last_name, salary AS Previous_salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
	WHEN salary BETWEEN 50000 AND 70000 THEN salary * 1.07
	WHEN salary > 70000 THEN salary * 1.10
END AS New_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS Bonus
FROM parks_and_recreation.employee_salary
;
