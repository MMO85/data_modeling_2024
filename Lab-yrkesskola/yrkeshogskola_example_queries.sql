
-- 1. List all students and their personal details
SELECT s.student_id, pi.first_name, pi.last_name, pi.email, c.class_name
FROM yrkeshögskola.student s
JOIN yrkeshögskola.personal_info pi ON s.person_id = pi.person_id
JOIN yrkeshögskola.class c ON s.class_id = c.class_id;

-- 2. Show all courses and the name of the teacher who teaches them
SELECT c.course_name, pi.first_name || ' ' || pi.last_name AS teacher_name
FROM yrkeshögskola.course c
JOIN yrkeshögskola.teacher t ON c.teacher_id = t.teacher_id
JOIN yrkeshögskola.personal_info pi ON t.person_id = pi.person_id;

-- 3. List permanent teachers with their personal info
SELECT pt.pteacher_id, pi.first_name, pi.last_name, pi.email
FROM yrkeshögskola.permanent_teacher pt
JOIN yrkeshögskola.teacher t ON pt.teacher_id = t.teacher_id
JOIN yrkeshögskola.personal_info pi ON t.person_id = pi.person_id;

-- 4. List consultant teachers with their company info and personal info
SELECT con.consult_id, con.company_name, con.hour_rate, pi.first_name, pi.last_name
FROM yrkeshögskola.consult con
JOIN yrkeshögskola.teacher t ON con.teacher_id = t.teacher_id
JOIN yrkeshögskola.personal_info pi ON t.person_id = pi.person_id;

-- 5. Show all students enrolled in each course
SELECT co.course_name, pi.first_name || ' ' || pi.last_name AS student_name
FROM yrkeshögskola.enrollment e
JOIN yrkeshögskola.course co ON e.course_id = co.course_id
JOIN yrkeshögskola.student s ON e.student_id = s.student_id
JOIN yrkeshögskola.personal_info pi ON s.person_id = pi.person_id;

-- 6. Count number of courses per program
SELECT p.program_name, COUNT(pc.course_id) AS total_courses
FROM yrkeshögskola.program p
JOIN yrkeshögskola.programcourse pc ON p.program_id = pc.program_id
GROUP BY p.program_name;

-- 7. List all classes and their coordinators
SELECT cl.class_name, pi.first_name || ' ' || pi.last_name AS coordinator_name
FROM yrkeshögskola.class cl
JOIN yrkeshögskola.course_coordinator cc ON cl.courseco_id = cc.courseco_id
JOIN yrkeshögskola.personal_info pi ON cc.personal_id = pi.person_id;
