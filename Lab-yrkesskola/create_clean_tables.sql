create SCHEMA IF NOT EXISTS yrkeshögskola;

SET SEARCH_path TO yrkeshögskola;


-- Table: address
CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    city VARCHAR,
    street VARCHAR,
    street_num VARCHAR,
    zip_code VARCHAR
);

-- Table: personal_info
CREATE TABLE personal_info (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    personnummber VARCHAR,
    email VARCHAR
);

-- Table: person_role
CREATE TABLE person_role (
    person_id INT PRIMARY KEY REFERENCES personal_info(person_id),
    role VARCHAR
);

-- Table: school
CREATE TABLE school (
    school_id SERIAL PRIMARY KEY,
    school_name VARCHAR,
    address_id INT REFERENCES address(address_id)
);

-- Table: program
CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR,
    school_id INT REFERENCES school(school_id)
);

-- Table: teacher
CREATE TABLE teacher (
    teacher_id SERIAL PRIMARY KEY,
    school_id INT REFERENCES school(school_id),
    person_id INT REFERENCES personal_info(person_id)
);

-- Table: course
CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR,
    course_code VARCHAR,
    credits INT,
    description TEXT,
    teacher_id INT REFERENCES teacher(teacher_id)
);

-- Table: programcourse (junction)
CREATE TABLE programcourse (
    program_id INT REFERENCES program(program_id),
    course_id INT REFERENCES course(course_id),
    PRIMARY KEY (program_id, course_id)
);



-- Table: permanent_teacher
CREATE TABLE permanent_teacher (
    pteacher_id SERIAL PRIMARY KEY,
    teacher_id INT REFERENCES teacher(teacher_id)
);

-- Table: consult
CREATE TABLE consult (
    consult_id SERIAL PRIMARY KEY,
    company_name VARCHAR,
    org_num VARCHAR,
    hour_rate NUMERIC,
    vat_registered BOOLEAN,
    address_id INT REFERENCES address(address_id),
    teacher_id INT REFERENCES teacher(teacher_id)
);

-- Table: course_coordinator
CREATE TABLE course_coordinator (
    courseco_id SERIAL PRIMARY KEY,
    school_id INT REFERENCES school(school_id),
    personal_id INT REFERENCES personal_info(person_id)
);

-- Table: class
CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR,
    program_id INT REFERENCES program(program_id),
    courseco_id INT REFERENCES course_coordinator(courseco_id)
);



-- Table: student
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    class_id INT REFERENCES class(class_id),
    person_id INT UNIQUE REFERENCES personal_info(person_id)
);

-- Table: enrollment (junction)
CREATE TABLE enrollment (
    course_id INT REFERENCES course(course_id),
    student_id INT REFERENCES student(student_id),
    PRIMARY KEY (course_id, student_id)
);

