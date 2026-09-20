-- Window Functions

SELECT gender, AVG(salary) as avg_salary
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN parks_and_recreation.employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;


SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total,
AVG(salary) OVER(PARTITION BY gender) AS avg_salary
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN parks_and_recreation.employee_salary as sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER( PARTITION BY gender ORDER BY salary DESC) as row_num,
RANK() OVER( PARTITION BY gender ORDER BY salary DESC) as rank_num,
DENSE_RANK() OVER( PARTITION BY gender ORDER BY salary DESC) as dense_rank_num
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN parks_and_recreation.employee_salary as sal
	ON dem.employee_id = sal.employee_id
;







