SET SEARCH_path TO Labb_yrkCo;


-- Insert into Address
INSERT INTO Address (city, street, street_number, zip_code) VALUES
('Stockholm', 'Sveavägen', '12A', '11157'),
('Gothenburg', 'Linnégatan', '45B', '41308');

-- Insert into PersonalInfo
INSERT INTO PersonalInfo (first_name, last_name, personal_number, email, phone) VALUES
('Anna', 'Karlsson', '900101-1234', 'anna.karlsson@example.com', '0701234567'),
('Erik', 'Svensson', '880512-5678', 'erik.svensson@example.com', '0707654321'),
('Maria', 'Nilsson', '920315-9876', 'maria.nilsson@example.com', '0703456789');

-- Insert into School
INSERT INTO School (school_name, address_id) VALUES
('YrkesCo Stockholm', 1),
('YrkesCo Gothenburg', 2);

-- Insert into Program
INSERT INTO Program (program_name, school_id) VALUES
('IT Project Management', 1),
('Web Development', 2);

-- Insert into Employment
INSERT INTO Employment (person_id, school_id, hire_date, is_permanent) VALUES
(1, 1, '2022-08-15', true),
(2, 2, '2023-01-10', false);

-- Insert into Consultant
INSERT INTO Consultant (person_id, company_name, org_number, vat_registered, hourly_rate, address_id) VALUES
(3, 'CodeConsult AB', '556677-8899', true, 800.00, 2);

-- Insert into Teacher
INSERT INTO Teacher (person_id, employee_id, consultant_id) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, NULL, 1);

-- Insert into ProgramManager
INSERT INTO ProgramManager (employee_id) VALUES
(1);

-- Insert into Class
INSERT INTO Class (class_name, program_id, manager_id) VALUES
('ITPM23', 1, 1);

-- Insert into Course
INSERT INTO Course (course_name, course_code, credits, description, teacher_id) VALUES
('Agile Project Management', 'APM101', 15, 'Introduction to agile principles.', 1),
('Frontend Development', 'WEB201', 20, 'HTML, CSS, JS basics.', 3);

-- Insert into ProgramCourse
INSERT INTO ProgramCourse (program_id, course_id) VALUES
(1, 1),
(2, 2);

-- Insert into Student
INSERT INTO Student (person_id, class_id) VALUES
(2, 1);

-- Insert into Enrollment
INSERT INTO Enrollment (student_id, course_id) VALUES
(1, 1),
(1, 2);

