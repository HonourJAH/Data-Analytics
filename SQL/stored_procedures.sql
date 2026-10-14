-- Stored Procedures

CREATE PROCEDURE large_salaries()
SELECT *,
ROW_NUMBER() OVER() AS row_num
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

CALL parks_and_recreation.large_salaries();


DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 50000;
    SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL parks_and_recreation.large_salaries2();


DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT salary
	FROM parks_and_recreation.employee_salary
	WHERE employee_id = employee_id_param;

END $$
DELIMITER ;

CALL parks_and_recreation.large_salaries3(2);


