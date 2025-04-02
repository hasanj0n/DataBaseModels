-- Inserting a user data

INSERT INTO Users (first_name, last_name, email, phone, role, birth_date) VALUES
('John', 'Doe', 'john.doe@example.com', '+998901234567', 'Student', '2002-05-14'),
('Alice', 'Smith', 'alice.smith@example.com', '+998909876543', 'Student', '2001-11-22'),
('Michael', 'Brown', 'michael.brown@example.com', '+998931112233', 'Student', '2003-03-10'),
('Emma', 'Johnson', 'emma.johnson@example.com', '+998977776655', 'Student', '2000-09-05'),
('Daniel', 'Williams', 'daniel.williams@example.com', '+998935556677', 'Teacher', '1985-07-18'),
('Sophia', 'Miller', 'sophia.miller@example.com', '+998944443322', 'Teacher', '1990-12-30'),
('James', 'Wilson', 'james.wilson@example.com', '+998955667788', 'Teacher', '1982-02-25'),
('Olivia', 'Moore', 'olivia.moore@example.com', '+998966778899', 'Admin', '1995-06-20'),
('William', 'Taylor', 'william.taylor@example.com', '+998977889900', 'Admin', '1988-04-15'),
('Ava', 'Anderson', 'ava.anderson@example.com', '+998988990011', 'Admin', '1992-10-08');

-- Inserting courses

INSERT INTO Courses (course_name, credit_hours, department) VALUES
('Database Systems', 3, 'Computer Science'),
('Algorithms and Data Structures', 4, 'Computer Science'),
('Software Engineering', 3, 'Computer Science'),
('Linear Algebra', 3, 'Mathematics'),
('Statistics and Probability', 4, 'Mathematics'),
('Microeconomics', 3, 'Economics'),
('Macroeconomics', 3, 'Economics'),
('Business Management', 3, 'Business Administration'),
('Marketing Principles', 3, 'Business Administration'),
('Financial Accounting', 4, 'Finance');




INSERT INTO Teachers_Courses (teacher_id, course_id) VALUES
(5, 1),  -- Teacher 1 teaches "Database Systems"
(5, 2),  -- Teacher 1 teaches "Algorithms and Data Structures"
(5, 3),  -- Teacher 2 teaches "Software Engineering"
(6, 4),  -- Teacher 2 teaches "Linear Algebra"
(6, 5),  -- Teacher 3 teaches "Statistics and Probability"
(6, 6),  -- Teacher 4 teaches "Microeconomics"
(6, 7),  -- Teacher 4 teaches "Macroeconomics"
(7, 8),  -- Teacher 5 teaches "Business Management"
(7, 9),  -- Teacher 5 teaches "Marketing Principles"
(7, 10); -- Teacher 6 teaches "Financial Accounting"


INSERT INTO Student_Courses (student_id, course_id, enrollment_date) VALUES
(4, 1, '2024-01-15'), -- Student 4 enrolled in "Database Systems"
(1, 1, '2024-01-16'), -- Student 1 enrolled in "Database Systems"
(3, 2, '2024-01-17'), -- Student 3 enrolled in "Algorithms and Data Structures"
(2, 3, '2024-01-18'), -- Student 2 enrolled in "Software Engineering"
(1, 4, '2024-01-19'), -- Student 1 enrolled in "Linear Algebra"
(3, 5, '2024-01-20'), -- Student 3 enrolled in "Statistics and Probability"
(4, 6, '2024-01-21'), -- Student 4 enrolled in "Microeconomics"
(2, 7, '2024-01-22'), -- Student 2 enrolled in "Macroeconomics"
(1, 8, '2024-01-23'), -- Student 1 enrolled in "Business Management"
(2, 9, '2024-01-24'); -- Student 2 enrolled in "Marketing Principles"


INSERT INTO Grades (student_id, course_id, grade, grade_date) VALUES
(4, 1, 'A', '2024-03-10'), -- Student 4 got 'A' in Database Systems
(1, 1, 'B', '2024-03-12'), -- Student 1 got 'B' in Database Systems
(3, 2, 'A', '2024-03-15'), -- Student 3 got 'A' in Algorithms and Data Structures
(2, 3, 'C', '2024-03-17'), -- Student 2 got 'C' in Software Engineering
(1, 4, 'B', '2024-03-20'), -- Student 1 got 'B' in Linear Algebra
(3, 5, 'A', '2024-03-22'), -- Student 3 got 'A' in Statistics and Probability
(4, 6, 'D', '2024-03-25'), -- Student 4 got 'D' in Microeconomics
(2, 7, 'F', '2024-03-27'), -- Student 2 failed (F) in Macroeconomics
(1, 8, 'C', '2024-03-30'), -- Student 1 got 'C' in Business Management
(2, 9, 'B', '2024-04-01'); -- Student 2 got 'B' in Marketing Principles


INSERT INTO Payments (student_id, amount, payment_date, status) VALUES
(1, 1500.00, '2024-01-10', 'Paid'),    -- Student 1 paid full fee
(2, 1200.00, '2024-02-15', 'Paid'),    -- Student 2 paid full fee
(3, 500.00, '2024-03-01', 'Pending'),  -- Student 3 partially paid, pending
(4, 2000.00, '2024-03-10', 'Paid'),    -- Student 4 paid full fee
(1, 750.00, '2024-03-20', 'Pending'),  -- Student 1 second installment pending
(2, 400.00, '2024-03-25', 'Overdue'),  -- Student 2 has overdue payment
(3, 1300.00, '2024-04-01', 'Paid'),    -- Student 3 completed payment
(4, 800.00, '2024-04-05', 'Pending'),  -- Student 4 has pending payment
(1, 500.00, '2024-04-10', 'Overdue'),  -- Student 1 has overdue balance
(2, 1000.00, '2024-04-15', 'Paid');    -- Student 2 cleared overdue


INSERT INTO Books (title, author, available_copies) VALUES
('Introduction to Algorithms', 'Thomas H. Cormen', 5),
('Database System Concepts', 'Abraham Silberschatz', 3),
('Clean Code', 'Robert C. Martin', 4),
('The Pragmatic Programmer', 'Andrew Hunt', 2),
('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 6),
('Machine Learning Yearning', 'Andrew Ng', 7),
('Deep Learning', 'Ian Goodfellow', 3),
('Computer Networking: A Top-Down Approach', 'James F. Kurose', 5),
('Operating System Concepts', 'Abraham Silberschatz', 2),
('Python Crash Course', 'Eric Matthes', 8);


INSERT INTO Library_Transactions (student_id, book_id, borrow_date, return_date) VALUES
(1, 3, '2025-03-01', '2025-03-15'),
(2, 5, '2025-03-02', '2025-03-16'),
(3, 1, '2025-03-05', '2025-03-19'),
(4, 7, '2025-03-06', NULL),
(1, 2, '2025-03-07', '2025-03-21'),
(2, 8, '2025-03-10', NULL),
(3, 4, '2025-03-11', '2025-03-25'),
(4, 6, '2025-03-12', NULL),
(1, 9, '2025-03-14', '2025-03-28'),
(2, 10, '2025-03-15', NULL);



INSERT INTO Classrooms (room_number, capacity) VALUES
('A101', 30),
('A102', 25),
('B201', 40),
('B202', 35),
('C301', 20),
('C302', 50),
('D401', 15),
('D402', 30),
('E501', 45),
('E502', 60);


INSERT INTO Schedule (course_id, room_id, day_of_week, start_time, end_time) VALUES
(1, 1, 'Monday', '08:00:00', '10:00:00'),
(2, 2, 'Monday', '10:30:00', '12:30:00'),
(3, 3, 'Tuesday', '09:00:00', '11:00:00'),
(4, 4, 'Tuesday', '13:00:00', '15:00:00'),
(5, 5, 'Wednesday', '08:30:00', '10:30:00'),
(6, 6, 'Wednesday', '11:00:00', '13:00:00'),
(7, 7, 'Thursday', '14:00:00', '16:00:00'),
(8, 8, 'Thursday', '09:30:00', '11:30:00'),
(9, 9, 'Friday', '08:00:00', '10:00:00'),
(10, 10, 'Friday', '10:30:00', '12:30:00');


INSERT INTO Exams (course_id, exam_date, max_score) VALUES
(1, '2025-06-01', 100),
(2, '2025-06-02', 100),
(3, '2025-06-03', 100),
(4, '2025-06-04', 100),
(5, '2025-06-05', 100),
(6, '2025-06-06', 100),
(7, '2025-06-07', 100),
(8, '2025-06-08', 100),
(9, '2025-06-09', 100),
(10, '2025-06-10', 100);


INSERT INTO Exam_Results (student_id, exam_id, score) VALUES
(1, 1, 85),
(2, 1, 90),
(3, 1, 78),
(4, 2, 88),
(5, 2, 92),
(6, 2, 76),
(7, 3, 95),
(8, 3, 89),
(9, 4, 84),
(10, 4, 91);


INSERT INTO Attendance (student_id, course_id, date, status) VALUES
(1, 1, '2025-04-01', 'Present'),
(2, 1, '2025-04-01', 'Absent'),
(3, 1, '2025-04-01', 'Late'),
(4, 2, '2025-04-01', 'Present'),
(5, 2, '2025-04-01', 'Absent'),
(6, 2, '2025-04-01', 'Present'),
(7, 3, '2025-04-01', 'Late'),
(8, 3, '2025-04-01', 'Present'),
(9, 4, '2025-04-01', 'Absent'),
(10, 4, '2025-04-01', 'Present');
