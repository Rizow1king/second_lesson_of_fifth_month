-- ----------------------------------------1-chi topshiriq---------------------------------------------

DROP TABLE IF EXISTS department;

CREATE TABLE IF NOT EXISTS department (
    dep_id SERIAL PRIMARY KEY UNIQUE,
    dep_name TEXT,
    dep_location TEXT
);

DROP TABLE IF EXISTS employee;

CREATE TABLE IF NOT EXISTS employee (
    emp_id SERIAL PRIMARY KEY UNIQUE,
    emp_name TEXT,
    emp_position TEXT,
    dep_id INTEGER REFERENCES department(dep_id)
);

DROP TABLE IF EXISTS projects;

CREATE TABLE IF NOT EXISTS projects (
    pro_id SERIAL PRIMARY KEY UNIQUE,
    pro_title TEXT,
    dep_id INTEGER REFERENCES department(dep_id)
);

DROP TABLE IF EXISTS tasks;

CREATE TABLE IF NOT EXISTS tasks (
    task_id SERIAL PRIMARY KEY UNIQUE,
    task_description TEXT,
    pro_id INTEGER REFERENCES projects(pro_id),
    emp_id INTEGER REFERENCES employee(emp_id)
);

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM projects;
SELECT * FROM tasks;

INSERT INTO department(dep_name, dep_location) VALUES
('bugalteria', '1-chi qavat'),
('solix', '2-chi qavat');

INSERT INTO employee(emp_name, emp_position, dep_id) VALUES
('muhammadrizo', 'manager', 1),
('solix', 'main', 2);

INSERT INTO projects(pro_title, dep_id) VALUES
('green', 2),
('gray', 1);

INSERT INTO tasks(task_description, pro_id, emp_id) VALUES
('bla-bla', 1, 1),
('something', 2, 2);

-- ------------------------------------------2-chi topshiriq------------------------------------------------

ALTER TABLE employee
ADD COLUMN IF NOT EXISTS email TEXT DEFAULT 'example@gmail.com';

-- --------------------------------------------------
ALTER TABLE tasks
ALTER COLUMN task_description TYPE VARCHAR(255);

-- -----------------------------------------3-chi topshiriq------------------------------------------------
UPDATE employee SET emp_position='SENILOR DEV' WHERE emp_id =1
----------------------------------------------------------------
UPDATE projects SET pro_title='New Project Name' WHERE pro_id=2
-- -----------------------------------------4-chi topshiriq------------------------------------------------
DELETE FROM projects WHERE pro_id = 3;
-- --------------------------------------------------------
DELETE FROM employee WHERE emp_id = 4;