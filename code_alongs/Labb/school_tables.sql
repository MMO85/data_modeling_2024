create SCHEMA IF NOT EXISTS Labb_yrkCo;

SET SEARCH_path TO Labb_yrkCo;


-- Address Table
CREATE TABLE Address (
    address_id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    street VARCHAR(100),
    street_number VARCHAR(10),
    zip_code VARCHAR(20)
);

-- Personal Info Table
CREATE TABLE PersonalInfo (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    personal_number VARCHAR(20),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- School Table
CREATE TABLE School (
    school_id SERIAL PRIMARY KEY,
    school_name VARCHAR(100),
    address_id INT REFERENCES Address(address_id)
);

-- Program Table
CREATE TABLE Program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(100),
    school_id INT REFERENCES School(school_id)
);

-- Employment Table
CREATE TABLE Employment (
    employee_id SERIAL PRIMARY KEY,
    person_id INT REFERENCES PersonalInfo(person_id),
    school_id INT REFERENCES School(school_id),
    hire_date DATE,
    is_permanent BOOLEAN
);

-- Consultant Table
CREATE TABLE Consultant (
    consultant_id SERIAL PRIMARY KEY,
    person_id INT REFERENCES PersonalInfo(person_id),
    company_name VARCHAR(100),
    org_number VARCHAR(50),
    vat_registered BOOLEAN,
    hourly_rate NUMERIC,
    address_id INT REFERENCES Address(address_id)
);

-- Teacher Table (linked to either Employee or Consultant)
CREATE TABLE Teacher (
    teacher_id SERIAL PRIMARY KEY,
    person_id INT REFERENCES PersonalInfo(person_id),
    employee_id INT REFERENCES Employment(employee_id),
    consultant_id INT REFERENCES Consultant(consultant_id),
    CHECK (
        (employee_id IS NOT NULL AND consultant_id IS NULL) OR
        (employee_id IS NULL AND consultant_id IS NOT NULL)
    )
);

-- Program Manager Table
CREATE TABLE ProgramManager (
    manager_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Employment(employee_id),
    UNIQUE(employee_id)
);

-- Class Table
CREATE TABLE Class (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100),
    program_id INT REFERENCES Program(program_id),
    manager_id INT REFERENCES ProgramManager(manager_id)
);

-- Course Table
CREATE TABLE Course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(50),
    credits INT,
    description TEXT,
    teacher_id INT REFERENCES Teacher(teacher_id)
);

-- Program-Course (Many-to-Many)
CREATE TABLE ProgramCourse (
    program_id INT REFERENCES Program(program_id),
    course_id INT REFERENCES Course(course_id),
    PRIMARY KEY (program_id, course_id)
);

-- Student Table
CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    person_id INT REFERENCES PersonalInfo(person_id),
    class_id INT REFERENCES Class(class_id)
);

-- Enrollment Table (student enrolls in standalone courses)
CREATE TABLE Enrollment (
    student_id INT REFERENCES Student(student_id),
    course_id INT REFERENCES Course(course_id),
    PRIMARY KEY (student_id, course_id)
);
