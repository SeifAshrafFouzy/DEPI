-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

-- Work Hours Table
CREATE TABLE work_hours (
    emp_id INT,
    project_id INT,
    hours INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    status INT
);



-- Insert data into Departments
INSERT INTO departments (department_id, name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Marketing'),
(5, 'IT');

-- Insert data into Employees
INSERT INTO employees (emp_id, first_name, last_name, department_id) VALUES
(1, 'Alice', 'Smith', 1),
(2, 'Bob', 'Johnson', 1),
(3, 'Charlie', 'Williams', 2),
(4, 'David', 'Jones', 2),
(5, 'Eva', 'Brown', 3),
(6, 'Frank', 'Garcia', 3),
(7, 'Grace', 'Martinez', 4),
(8, 'Hank', 'Hernandez', 4),
(9, 'Ivy', 'Lopez', 5),
(10, 'Jack', 'Gonzalez', 5);

-- Insert data into Projects
INSERT INTO projects (project_id, project_name) VALUES
(1, 'Project A'),
(2, 'Project B'),
(3, 'Project C'),
(4, 'Project D');

-- Insert data into Work Hours
INSERT INTO work_hours (emp_id, project_id, hours) VALUES
(1, 1, 10),
(2, 2, 15),
(3, 3, 20),
(4, 4, 25),
(5, 1, 30),
(6, 2, 35),
(7, 3, 40),
(8, 4, 45),
(9, 1, 50),
(10, 2, 55);

-- Insert data into Suppliers
INSERT INTO suppliers (supplier_id, supplier_name, status) VALUES
(1, 'Supplier A', 10),
(2, 'Supplier B', 20),
(3, 'Supplier C', 25),
(4, 'Supplier D', 5),
(5, 'Supplier E', 30);




CREATE VIEW vw_employee_details AS
SELECT e.first_name AS fname, e.last_name AS lname, d.name AS dname
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM vw_employee_details;



CREATE OR REPLACE VIEW vw_work_hrs AS
SELECT e.first_name AS fname, e.last_name AS lname, p.project_name AS pname, wh.hours
FROM work_hours wh
INNER JOIN employees e ON wh.emp_id = e.emp_id
INNER JOIN projects p ON wh.project_id = p.project_id
WHERE e.department_id = 5;

SELECT * FROM vw_work_hrs;



CREATE VIEW vw_high_status_suppliers AS
SELECT *
FROM suppliers
WHERE status > 15
WITH CHECK OPTION;

SELECT * FROM vw_high_status_suppliers;
