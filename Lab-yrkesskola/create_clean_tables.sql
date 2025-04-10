create SCHEMA IF NOT EXISTS STI;

SET SEARCH_path TO STI;
-- Address table
CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    street VARCHAR(100),
    homenum VARCHAR(10),
    zip_code VARCHAR(20)
);

-- Personal Info table
CREATE TABLE personal_info (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    personnumber VARCHAR(20),
    email VARCHAR(100)
);

-- School table
CREATE TABLE school (
    school_id SERIAL PRIMARY KEY,
    school_name VARCHAR(100),
    address_id INT REFERENCES address(address_id)
);

-- Program table
CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(100),
    school_id INT REFERENCES school(school_id)
);

-- Teacher table
CREATE TABLE teacher (
    teacher_id SERIAL PRIMARY KEY
);

-- Permanent teacher (employee)
CREATE TABLE permanent_teacher (
    pteacher_id SERIAL PRIMARY KEY,
    teacher_id INT REFERENCES teacher(teacher_id),
    person_id INT REFERENCES personal_info(person_id)
);

-- Consultant table
CREATE TABLE consultant (
    consult_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    org_num VARCHAR(50),
    hour_rate NUMERIC,
    vat_registered BOOLEAN,
    address_id INT REFERENCES address(address_id),
    teacher_id INT REFERENCES teacher(teacher_id)
);

-- Course table
CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(50),
    credits INT,
    description TEXT,
    teacher_id INT REFERENCES teacher(teacher_id)
);

-- ProgramCourse table (many-to-many)
CREATE TABLE programcourse (
    program_id INT REFERENCES program(program_id),
    course_id INT REFERENCES course(course_id),
    PRIMARY KEY (program_id, course_id)
);

-- Course Coordinator table
CREATE TABLE course_coordinator (
    courseco_id SERIAL PRIMARY KEY,
    school_id INT REFERENCES school(school_id),
    person_id INT REFERENCES personal_info(person_id)
);

-- Class table
CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100),
    program_id INT REFERENCES program(program_id),
    courseco_id INT REFERENCES course_coordinator(courseco_id)
);

-- Student table
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    class_id INT REFERENCES class(class_id),
    person_id INT REFERENCES personal_info(person_id)
);

-- Enrollment table (many-to-many between students and courses)
CREATE TABLE enrollment (
    course_id INT REFERENCES course(course_id),
    student_id INT REFERENCES student(student_id),
    PRIMARY KEY (course_id, student_id)
);

CREATE TABLE sti.person_role (
    person_id INT PRIMARY KEY REFERENCES sti.personal_info(person_id),
    role VARCHAR(50) CHECK (role IN ('student', 'teacher', 'coordinator'))
);



SELECT  * FROM sti.consultant;
-- this query shows the name of permanent teachers in schools
SELECT pi.first_name, pi.last_name
FROM sti.personal_info pi
JOIN sti.permanent_teacher pt ON pi.person_id = pt.person_id;

-- this query shows the name of all students in a specific class
SElECT pi.first_name, pi.last_name
FROM sti.personal_info pi
JOIN sti.student s ON pi.person_id = s.person_id
JOIN sti.class c ON s.class_id = c.class_id
WHERE c.class_name = 'DE23';

SELECT * FROM sti.course;
-- this query shows the name of all students in a specific course
SELECT pi.first_name, pi.last_name
FROM sti.personal_info pi                               
JOIN sti.student s ON pi.person_id = s.person_id
JOIN sti.enrollment e ON s.student_id = e.student_id
JOIN sti.course c ON e.course_id = c.course_id
WHERE c.course_name = '	HTML & CSS'; 


SELECT * FROM sti.program;
-- this query shows the name of all students in a specific program
SELECT pi.first_name, pi.last_name
FROM sti.personal_info pi
JOIN sti.student s ON pi.person_id = s.person_id
JOIN sti.class c ON s.class_id = c.class_id
JOIN sti.program p ON c.program_id = p.program_id
WHERE p.program_name = 'Data Engineering'; 

SELECT * FROM sti.school;
-- this query shows the name of all students in a specific school
SELECT pi.first_name, pi.last_name
FROM sti.personal_info pi
JOIN sti.student s ON pi.person_id = s.person_id
JOIN sti.class c ON s.class_id = c.class_id
JOIN sti.program p ON c.program_id = p.program_id
JOIN sti.school sch ON p.school_id = sch.school_id
WHERE sch.school_name = 'YrkesCo Stockholm';


-- this query shows the name of all techers and their statement, are they permanent teacher or consultant
SELECT pi.first_name, pi.last_name, 
       CASE 
           WHEN pt.teacher_id IS NOT NULL THEN 'Permanent Teacher'
           WHEN c.teacher_id IS NOT NULL THEN 'Consultant'
           ELSE 'Unknown'
       END AS teacher_type
FROM sti.personal_info pi
LEFT JOIN sti.permanent_teacher pt ON pi.person_id = pt.person_id
LEFT JOIN sti.consultant c ON pi.person_id = c.teacher_id;  


-- this query will show the list of coordinators
SELECT 
  pi.person_id,
  pi.first_name,
  pi.last_name,
  pi.email,
  pr.role
FROM sti.person_role pr
JOIN sti.personal_info pi ON pr.person_id = pi.person_id
WHERE pr.role = 'coordinator';


SELECT 
  pi.person_id,
  pi.first_name,
  pi.last_name,
  pi.email,
  pr.role
FROM sti.person_role pr
JOIN sti.personal_info pi ON pr.person_id = pi.person_id
WHERE pr.role = 'teacher';

SELECT * FROM sti.person_role WHERE role = 'teacher';

SELECT * FROM sti.personal_info;

SELECT 
  pi.person_id,
  pi.first_name,
  pi.last_name,
  pr.role
FROM sti.personal_info pi
LEFT JOIN sti.person_role pr ON pi.person_id = pr.person_id
WHERE pr.role IS NULL OR pr.role = 'teacher';


-- this query will show the list of all courses which will be taught by what type of teacher 
  SELECT 
  c.course_name,
  pi.first_name,
  pi.last_name,
  CASE 
    WHEN pt.teacher_id IS NOT NULL THEN 'permanent teacher'
    WHEN co.teacher_id IS NOT NULL THEN 'consultant'
    ELSE 'unknown'
  END AS teacher_type
FROM sti.course c
JOIN sti.teacher t ON c.teacher_id = t.teacher_id
LEFT JOIN sti.permanent_teacher pt ON pt.teacher_id = t.teacher_id
LEFT JOIN sti.consultant co ON co.teacher_id = t.teacher_id
LEFT JOIN sti.personal_info pi ON 
  pi.person_id = pt.person_id  -- ✅ only using person_id from permanent_teacher



