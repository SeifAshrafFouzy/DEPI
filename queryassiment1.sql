CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments (department_id, name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Marketing');

INSERT INTO employees (emp_id, last_name, salary, manager_id, department_id) VALUES
(101, 'Smith', 2500.00, NULL, 1),
(102, 'Johnson', 4000.00, 101, 1),
(103, 'Williams', 4500.00, 200, 1),
(104, 'Brown', 5000.00, 101, 2),
(105, 'Jones', 3000.00, NULL, 2),
(106, 'Garcia', 2000.00, 102, 3),
(107, 'Martinez', 3500.00, 101, 3),
(108, 'Hernandez', 4700.00, 102, 4),
(109, 'Lopez', 2100.00, 200, 4),
(110, 'Gonzalez', 3900.00, NULL, 4),
(111, 'Wilson', 2700.00, 105, 1),
(112, 'Anderson', 4200.00, 200, 2),
(113, 'Thomas', 2300.00, 102, 3),
(114, 'Taylor', 3000.00, 101, 3),
(115, 'Moore', 2200.00, 200, 4),
(116, 'White', 2400.00, 102, 1),
(117, 'Harris', 2600.00, 200, 3),
(118, 'Clark', 3500.00, 105, 2),
(119, 'Lewis', 2800.00, 101, 2),
(120, 'Walker', 4100.00, NULL, 4);


SELECT emp_id, last_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 5000
  AND manager_id NOT IN (101, 200);



SELECT e.last_name AS employee_name, d.name AS department_name
FROM employees e
INNER JOIN departments d
  ON e.department_id = d.department_id
ORDER BY d.name ASC;

SELECT department_id, COUNT(emp_id) AS num_employees, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
