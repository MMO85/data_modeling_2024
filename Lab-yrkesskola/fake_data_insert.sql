
SET SEARCH_path TO STI;

-- Address
INSERT INTO address (city, street, homenum, zip_code) VALUES
('Stockholm', 'Sveavägen', '12A', '11157'),
('Gothenburg', 'Linnégatan', '45B', '41308');

-- Personal Info
INSERT INTO sti.personal_info (first_name, last_name, personnumber, email) VALUES
('Anna', 'Karlsson', '900101-1234', 'anna.karlsson@example.com'),
('Erik', 'Svensson', '880512-5678', 'erik.svensson@example.com'),
('Maria', 'Nilsson', '920315-9876', 'maria.nilsson@example.com'),
('Johan', 'Eriksson', '870405-4567', 'johan.eriksson@example.com'),
('Lina', 'Andersson', '950225-7890', 'lina.andersson@example.com'),
('Peter', 'Jonsson', '891130-3210', 'peter.jonsson@example.com');

-- School
INSERT INTO school (school_name, address_id) VALUES
('YrkesCo Stockholm', 1),
('YrkesCo Gothenburg', 2);

-- Program
INSERT INTO program (program_name, school_id) VALUES
('Data Engineering', 1),
('Web Development', 2);

-- Teacher
INSERT INTO teacher DEFAULT VALUES;
INSERT INTO teacher DEFAULT VALUES;
INSERT INTO teacher DEFAULT VALUES;

-- Permanent Teacher
INSERT INTO permanent_teacher (teacher_id, person_id) VALUES
(1, 1),
(2, 2);

-- Consultant
INSERT INTO consultant (company_name, org_num, hour_rate, vat_registered, address_id, teacher_id) VALUES
('TechBrains AB', '556001-1234', 800.00, true, 2, 3);

-- Course
INSERT INTO course (course_name, course_code, credits, description, teacher_id) VALUES
('Python for Data Engineers', 'DE101', 15, 'Covers Python basics and ETL concepts.', 1),
('HTML & CSS', 'WD201', 10, 'Frontend layout and styling.', 2),
('NoSQL Databases', 'DE202', 10, 'Intro to MongoDB and document stores.', 3);

-- ProgramCourse
INSERT INTO programcourse (program_id, course_id) VALUES
(1, 1),
(1, 3),
(2, 2);

-- Course Coordinator
INSERT INTO course_coordinator (school_id, person_id) VALUES
(1, 1),
(2, 2);

-- Class
INSERT INTO class (class_name, program_id, courseco_id) VALUES
('DE23', 1, 1),
('WD23', 2, 2);

-- Student
INSERT INTO student (class_id, person_id) VALUES
(1, 2),
(1, 3),
(2, 1);

-- Enrollment
INSERT INTO enrollment (course_id, student_id) VALUES
(1, 1),
(3, 2),
(2, 3);

INSERT INTO sti.person_role (person_id, role) VALUES
(1, 'teacher'),
(2, 'student'),
(3, 'teacher'),
(7, 'coordinator'),
(8, 'student'),
(9, 'teacher');


