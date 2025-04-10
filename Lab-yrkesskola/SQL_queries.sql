
SET SEARCH_path TO STI;

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




--this query will show the list of all permanent teachers
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
  pi.person_id = pt.person_id 



