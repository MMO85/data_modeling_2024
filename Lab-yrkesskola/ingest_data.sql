SET SEARCH_path TO yrkesskola;
-- Address
INSERT INTO Address (city, street, homenum, zip_code) VALUES
('Stockholm', 'Sveavägen', '12A', '11157'),
('Gothenburg', 'Linnégatan', '45B', '41308');

-- PersonalInfo
INSERT INTO PersonalInfo (first_name, last_name, personnumer, email) VALUES
('Anna', 'Karlsson', '900101-1234', 'anna.karlsson@example.com'),
('Erik', 'Svensson', '880512-5678', 'erik.svensson@example.com'),
('Maria', 'Nilsson', '920315-9876', 'maria.nilsson@example.com');

-- School
INSERT INTO School (school_name, address_id) VALUES
('YrkesCo Stockholm', 1),
('YrkesCo Gothenburg', 2);

-- Program
INSERT INTO Program (program_name, school_id) VALUES
('Data Engineering', 1),
('Frontend Development', 2);

-- Teacher
INSERT INTO Teacher (teacher_id) VALUES
(1), (2), (3);

-- PermanentTeacher
INSERT INTO PermanentTeacher (teacher_id, person_id) VALUES
(1, 1),
(2, 2);

-- Consult
INSERT INTO Consult (company_name, org_num, hour_rate, vat_registered, address_id, teacher_id) VALUES
('DataWorks AB', '556001-1234', 850.00, true, 2, 3);

-- Course
INSERT INTO Course (course_name, course_code, credits, description, teacher_id) VALUES
('Python for Data Engineering', 'DE101', 15, 'Covers basics to intermediate Python for pipelines.', 1),
('HTML & CSS', 'FR101', 10, 'Introduction to frontend layout and styling.', 2),
('NoSQL Databases', 'DE202', 10, 'Working with MongoDB and document data models.', 3);

-- ProgramCourse
INSERT INTO ProgramCourse (program_id, course_id) VALUES
(1, 1),
(1, 3),
(2, 2);

-- CourseCoordinator
INSERT INTO CourseCoordinator (school_id, person_id) VALUES
(1, 1),
(2, 2);

-- Class
INSERT INTO Class (class_name, program_id, courseCO_id) VALUES
('DE23', 1, 1),
('FE23', 2, 2);

-- Students
INSERT INTO Students (class_id, person_id) VALUES
(1, 2),
(1, 3),
(2, 1);

-- Enrollment
INSERT INTO Enrollment (course_id, student_id) VALUES
(1, 1),
(3, 2),
(2, 3);
