CREATE DATABASE Student_record;
USE student_record;
CREATE TABLE course (
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
course_duration INT
);
CREATE TABLE student (
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
grade INT,
course_id INT,
FOREIGN KEY (course_id) REFERENCES course(course_id)
);
CREATE TABLE login(
user_id INT PRIMARY KEY,
password INT(50),
student_id INT,
FOREIGN KEY (student_id) REFERENCES  student(student_id)
);

INSERT INTO course(course_id, course_name, course_duration)
VALUES (454565, 'programming', 3);  
INSERT INTO course(course_id, course_name, course_duration)
VALUES (49872, 'math', 3);
INSERT INTO course(course_id, course_name, course_duration)
VALUES (4794, 'system design', 2);
INSERT INTO student (student_id, first_name, last_name,grade, course_id)
VALUES (123, 'ahmed', 'omar', 90, 454565); 
INSERT INTO student (student_id, first_name, last_name,grade, course_id)
VALUES (56, 'ali', 'amr', 10, 49872); 
INSERT INTO student (student_id, first_name, last_name,grade)
VALUES (20, 'mohamed', 'hazem', 10); 
INSERT INTO login(user_id,password, student_id)
VALUES (4565,'4521', 123); 
INSERT INTO login(user_id,password, student_id)
VALUES (456,'7089', 56); 
INSERT INTO login(user_id,password)
VALUES (213,'4322'); 

# 1) How to get the number of characters in the student's first name ?
SELECT LENGTH(first_name) from student;

# 2) how to get the full name of the student ?
SELECT CONCAT(first_name, " ", last_name) from student;

# 3) how do i return the ASCII value for the student's first_name?
SELECT ASCII(first_name) 
FROM student; 

# 4) how do i get the length of student's last name?
SELECT CHAR_LENGTH(last_name) FROM student;

# 5)how do i get the length of characters in string?
SELECT CHARACTER_LENGTH(course_name) from course;

# 6) how do i convert the course name into lowercase?
SELECT LOWER(course_name)from course; 

 # 7) how do i convert the string into uppercase?
SELECT upper(course_name)from course; 
# 8)how to add student's attributes  with a separator?
SELECT CONCAT_WS("-", first_name,last_name,grade,student_id) from student;
# 9) how do i Return the index position of  first_name in the string list
SELECT FIELD(first_name , last_name , grade) from student; 

# 10)how to extract 2 characters from course name from left?
SELECT LEFT(course_name,2) from course;

# 11) how to extract 3 character from right from user_id?
SELECT RIGHT(user_id,3) from login;

# 12) how do i search for 5 in course_duration?
SELECT LOCATE(2 ,course_duration) from course;

# 13) how to remove spce from user_id?
SELECT LTRIM(user_id)from login;

# 14) how to select specific letters from course name?
SELECT MID(course_name, 1, 2) from course;

# 15) how to get the position of the first occurence of number 3 in course name?
SELECT POSITION(3 IN course_duration) from course;

# 16) how do i repeat student's grade 4 times?
SELECT REPEAT (grade,4) from student;

#17) how do i replace the letter"a" with the letter "e" in student's first name?
SELECT REPLACE(first_name,"a","e") from student;

# 18) how do i reverse the letters of course name?
SELECT REVERSE (course_name) from course;

# 19) how do i return the number of grades?
SELECT COUNT(grade) from student;

# 20) how do i return the maximum value of students' grade?
SELECT MAX( grade) from student;

SELECT * FROM student WHERE course_id in (SELECT course_id from course where course_name="programming");
SELECT * FROM student WHERE student_id in (SELECT student_id from login WHERE password=4521);
SELECT * FROM student WHERE course_id in (SELECT course_id from course where course_name="math");
# COUNT AND GROUP BY
SELECT count(*), course_duration FROM course GROUP BY course_duration;
SELECT count(*), grade FROM student GROUP BY grade;
# JOINS 
SELECT student.first_name, course.course_name FROM student INNER JOIN course on student.course_id = course.course_id;
SELECT student.first_name, course.course_name FROM student LEFT JOIN course on student.course_id = course.course_id;
SELECT student.first_name, course.course_name FROM student RIGHT JOIN course on student.course_id = course.course_id;
SELECT student.first_name, course.course_name FROM student LEFT JOIN course on student.course_id = course.course_id
UNION
SELECT student.first_name, course.course_name FROM student RIGHT JOIN course on student.course_id = course.course_id;
SELECT *
FROM login A, login B
WHERE A.user_id <> B.user_id;




#UPATE
UPDATE student
SET first_name='samer' ,last_name='alaa'
WHERE student_id= 20;
UPDATE student
SET grade=100
WHERE course_id=49872;
UPDATE login
SET student_id=null 
WHERE user_id=4565;
UPDATE login
SET password=7081
WHERE user_id=456;
UPDATE course
SET course_duration=7 , course_name='statistics'
WHERE course_id=454565;

#DELETE
DELETE FROM login WHERE user_id=456;
DELETE FROM student WHERE course_id=49872;
DELETE FROM course WHERE course_id=4794;
DELETE FROM course WHERE course_id=49872;
DELETE FROM login WHERE user_id=213;










DROP DATABASE student_record;
DROP TABLE login;
DROP TABLE student;
DROP TABLE course;



