SET SEARCH_path TO yrkeshögskola;
-- Insert into address
INSERT INTO yrkeshögskola.address (city, street, street_num, zip_code) VALUES
('Stockholm', 'Sveavägen', '10A', '11157'),
('Gothenburg', 'Linnégatan', '22B', '41308'),
('Malmö', 'Storgatan', '5C', '21144');

-- Insert into personal_info
INSERT INTO yrkeshögskola.personal_info (first_name, last_name, personnummber, email) VALUES
('Anna', 'Karlsson', '900101-1234', 'anna.karlsson@example.com'), -- 1
('Erik', 'Svensson', '880512-5678', 'erik.svensson@example.com'), -- 2
('Maria', 'Nilsson', '920315-9876', 'maria.nilsson@example.com'), -- 3
('Lars', 'Andersson', '850505-4321', 'lars.andersson@example.com'), -- 4
('Emma', 'Johansson', '870707-1111', 'emma.johansson@example.com'), -- 5
('Oskar', 'Berg', '910910-2222', 'oskar.berg@example.com'), -- 6
('Nina', 'Lind', '950101-3333', 'nina.lind@example.com'); -- 7

-- Insert into person_role
INSERT INTO yrkeshögskola.person_role (person_id, role) VALUES
(1, 'teacher'),
(2, 'student'),
(3, 'student'),
(4, 'coordinator'),
(5, 'teacher'),
(6, 'teacher'),
(7, 'teacher');

-- Insert into school
INSERT INTO yrkeshögskola.school (school_name, address_id) VALUES
('YrkesCo Stockholm', 1),
('YrkesCo Gothenburg', 2);

-- Insert into program
INSERT INTO yrkeshögskola.program (program_name, school_id) VALUES
('Data Engineering', 1),
('Frontend Development', 2);

-- Insert into teacher
INSERT INTO yrkeshögskola.teacher (school_id, person_id) VALUES
(1, 1), -- Anna
(1, 5), -- Emma
(2, 6), -- Oskar
(2, 7); -- Nina

-- Insert into course
INSERT INTO yrkeshögskola.course (course_name, course_code, credits, description, teacher_id) VALUES
('Python for Data Engineering', 'DE101', 15, 'Intro to Python for ETL workflows.', 1),
('HTML & CSS Basics', 'FE101', 10, 'Frontend foundations with HTML and CSS.', 2),
('Advanced SQL', 'DE201', 10, 'Complex queries and indexing.', 3),
('Javascript Basics', 'FE201', 10, 'JS programming fundamentals.', 4);

-- Insert into programcourse
INSERT INTO yrkeshögskola.programcourse (program_id, course_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4);

-- Insert into permanent_teacher
INSERT INTO yrkeshögskola.permanent_teacher (teacher_id) VALUES
(1), -- Anna
(2); -- Emma

-- Insert into consult
INSERT INTO yrkeshögskola.consult (company_name, org_num, hour_rate, vat_registered, address_id, teacher_id) VALUES
('TechBrains AB', '556001-1234', 800.00, true, 2, 3), -- Oskar
('FrontendX Ltd.', '559876-4321', 750.00, true, 3, 4); -- Nina

-- Insert into course_coordinator
INSERT INTO yrkeshögskola.course_coordinator (school_id, personal_id) VALUES
(1, 4); -- Lars

-- Insert into class
INSERT INTO yrkeshögskola.class (class_name, program_id, courseco_id) VALUES
('DE23', 1, 1),
('FE23', 2, 1);

-- Insert into student
INSERT INTO yrkeshögskola.student (class_id, person_id) VALUES
(1, 2),
(2, 3);

-- Insert into enrollment
INSERT INTO yrkeshögskola.enrollment (course_id, student_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2);
