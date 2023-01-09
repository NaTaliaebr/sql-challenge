SELECT *
FROM employees
LIMIT (5);

SELECT *
FROM departments
LIMIT (5);

SELECT *
FROM departments_employees
LIMIT (5);


SELECT *
FROM managers
LIMIT (5);

SELECT *
FROM salaries
LIMIT (5);

SELECT *
FROM titles
LIMIT (5);

--1

SELECT employees.emp_no AS Employee_Number, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
LIMIT (5);

--2

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date > '1986-1-1'::date AND employees.hire_date < '1987-1-1'::date
LIMIT (15);
--3

SELECT managers.dept_no, departments.dept_name, managers.emp_no, employees.last_name, employees.first_name
FROM managers
JOIN employees 
ON managers.emp_no = employees.emp_no
JOIN departments 
ON managers.dept_no = departments.dept_no
LIMIT (10);

--4

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN departments_employees 
ON employees.emp_no = departments_employees.emp_no
JOIN departments 
ON departments_employees.dept_no = departments.dept_no
LIMIT (10);

--5

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
LIMIT (10);

--6
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN departments_employees 
ON employees.emp_no = departments_employees.emp_no
JOIN departments 
ON departments_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
LIMIT (10);

--7
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN departments_employees 
ON employees.emp_no = departments_employees.emp_no
JOIN departments 
ON departments_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
LIMIT (10);

--8
SELECT employees.last_name, Count (*)
FROM employees
GROUP BY employees.last_name
ORDER BY Count (*) DESC;