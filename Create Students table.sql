
Use StudentDB

Create Table students(
Student_id INT NOT NULL,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50),
Gender VARCHAR(10) NOT NULL,
Marks INT,
Grade VARCHAR(2),
CONSTRAINT PK_students Primary key(student_id)
);

Go

Insert into students(Student_id,First_Name,Last_Name,Gender,Marks,Grade) values
(1, 'Pooja', 'N', 'Female', 92, 'A'),
(2, 'Rahul', 'Sharma', 'Male', 76, 'B'),
(3, 'Sneha', 'Reddy', 'Female', 88, 'A'),
(4, 'Amit', 'Verma', 'Male', 67, 'C'),
(5, 'Divya', 'Iyer', 'Female', 81, 'B'),
(6, 'Kiran', 'Kumar', 'Male', 59, 'D'),
(7, 'Anjali', 'Mehta', 'Female', 95, 'A'),
(8, 'Vikram', 'Singh', 'Male', 73, 'B'),
(9, 'Neha', 'Patel', 'Female', 84, 'B'),
(10, 'Arjun', 'Das', 'Male', 91, 'A'),
(11, 'Meera', 'Joshi', 'Female', 78, 'B'),
(12, 'Rohit', 'Gupta', 'Male', 62, 'C'),
(13, 'Priya', 'Naik', 'Female', 89, 'A'),
(14, 'Sanjay', 'Kulkarni', 'Male', 71, 'B'),
(15, 'Lakshmi', 'Menon', 'Female', 55, 'D');

Go



select * from dbo.Students