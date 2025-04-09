create SCHEMA IF NOT EXISTS yrkesskola;

SET SEARCH_path TO yrkesskola;

CREATE TABLE "Address" (
  "address_id" serial PRIMARY KEY,
  "city" varchar,
  "street" varchar,
  "homenum" varchar,
  "zip_code" varchar
);

CREATE TABLE "PersonalInfo" (
  "person_id" serial PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "personnumer" varchar,
  "email" varchar
);

CREATE TABLE "School" (
  "school_id" serial PRIMARY KEY,
  "school_name" varchar,
  "address_id" int
);

CREATE TABLE "Program" (
  "program_id" serial PRIMARY KEY,
  "program_name" varchar,
  "school_id" int
);

CREATE TABLE "Teacher" (
  "teacher_id" serial PRIMARY KEY
);

CREATE TABLE "PermanentTeacher" (
  "pteacher_id" serial PRIMARY KEY,
  "teacher_id" int,
  "person_id" int
);

CREATE TABLE "Consult" (
  "consult_id" serial PRIMARY KEY,
  "company_name" varchar,
  "org_num" varchar,
  "hour_rate" numeric,
  "vat_registered" boolean,
  "address_id" int,
  "teacher_id" int
);

CREATE TABLE "Course" (
  "course_id" serial PRIMARY KEY,
  "course_name" varchar,
  "course_code" varchar,
  "credits" int,
  "description" text,
  "teacher_id" int
);

CREATE TABLE "ProgramCourse" (
  "program_id" int,
  "course_id" int,
  PRIMARY KEY ("program_id", "course_id")
);

CREATE TABLE "CourseCoordinator" (
  "courseCO_id" serial PRIMARY KEY,
  "school_id" int,
  "person_id" int
);

CREATE TABLE "Class" (
  "class_id" serial PRIMARY KEY,
  "class_name" varchar,
  "program_id" int,
  "courseCO_id" int
);

CREATE TABLE "Students" (
  "student_id" serial PRIMARY KEY,
  "class_id" int,
  "person_id" int
);

CREATE TABLE "Enrollment" (
  "course_id" int,
  "student_id" int,
  PRIMARY KEY ("course_id", "student_id")
);

ALTER TABLE "School" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");

ALTER TABLE "Program" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "PermanentTeacher" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "PermanentTeacher" ADD FOREIGN KEY ("person_id") REFERENCES "PersonalInfo" ("person_id");

ALTER TABLE "Consult" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");

ALTER TABLE "Consult" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "Course" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id");

ALTER TABLE "ProgramCourse" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "ProgramCourse" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "CourseCoordinator" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "CourseCoordinator" ADD FOREIGN KEY ("person_id") REFERENCES "PersonalInfo" ("person_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("courseCO_id") REFERENCES "CourseCoordinator" ("courseCO_id");

ALTER TABLE "Students" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Students" ADD FOREIGN KEY ("person_id") REFERENCES "PersonalInfo" ("person_id");

ALTER TABLE "Enrollment" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "Enrollment" ADD FOREIGN KEY ("student_id") REFERENCES "Students" ("student_id");
