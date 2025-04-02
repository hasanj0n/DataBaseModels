-- 1. Talabalar sonini kurs bo‘yicha hisoblash

SELECT course_id, COUNT(student_id) AS num_students
FROM Student_Courses
GROUP BY course_id;


-- 2. Har bir kursdagi o‘qituvchilar sonini hisoblash

SELECT course_id, COUNT(teacher_id) AS num_teachers
FROM Teachers_Courses
GROUP BY course_id;

-- 3. Har bir talabaga berilgan baholarni hisoblash

SELECT student_id, course_id, 
       AVG(CASE 
               WHEN grade = 'A' THEN 4 
               WHEN grade = 'B' THEN 3 
               WHEN grade = 'C' THEN 2 
               WHEN grade = 'D' THEN 1 
               ELSE 0 END) AS average_grade
FROM Grades
GROUP BY student_id, course_id;


-- 3. Har bir kurs uchun o‘rtacha baholarni ko‘rish

SELECT course_id, 
       AVG(CASE 
               WHEN grade = 'A' THEN 4 
               WHEN grade = 'B' THEN 3 
               WHEN grade = 'C' THEN 2 
               WHEN grade = 'D' THEN 1 
               ELSE 0 END) AS average_course_grade
FROM Grades
GROUP BY course_id;

-- 4. Eng ko‘p kitobni ijaraga olgan talabalarni topish

SELECT s.first_name, s.last_name, COUNT(b.book_id) AS books_borrowed
FROM Users s
JOIN Library_Transactions lt ON s.user_id = lt.student_id
JOIN Books b ON lt.book_id = b.book_id
WHERE s.role = 'Student'
GROUP BY s.user_id
ORDER BY books_borrowed DESC
LIMIT 5;

-- 5. Har bir kurs uchun talabalar to‘lovlarini ko‘rish

SELECT c.course_name, SUM(p.amount) AS total_payments
FROM Courses c
JOIN Student_Courses sc ON c.course_id = sc.course_id
JOIN Payments p ON sc.student_id = p.student_id
GROUP BY c.course_id;


-- 6. Har bir o‘qituvchining darslari va o‘qitilgan talabalar soni

SELECT t.first_name, t.last_name, COUNT(sc.student_id) AS num_students, COUNT(DISTINCT c.course_id) AS num_courses
FROM Users t
JOIN Teachers_Courses tc ON t.user_id = tc.teacher_id
JOIN Student_Courses sc ON tc.course_id = sc.course_id
JOIN Courses c ON tc.course_id = c.course_id
GROUP BY t.user_id;

-- 7. Har bir talabani eng yaxshi baho bo‘yicha tartiblash

SELECT student_id, course_id, grade,
       RANK() OVER (PARTITION BY course_id ORDER BY CASE 
                                                   WHEN grade = 'A' THEN 4 
                                                   WHEN grade = 'B' THEN 3 
                                                   WHEN grade = 'C' THEN 2 
                                                   WHEN grade = 'D' THEN 1 
                                                   ELSE 0 END DESC) AS ranking
FROM Grades;

-- 8. Har oyda to‘langan to‘lovlarni ko‘rish

SELECT YEAR(payment_date) AS year, MONTH(payment_date) AS month, SUM(amount) AS total_payment
FROM Payments
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY year, month;

-- 9. Har bir talabaga o‘qish vaqtida to‘langan umumiy to‘lov

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Users s
JOIN Payments p ON s.user_id = p.student_id
GROUP BY s.user_id;


