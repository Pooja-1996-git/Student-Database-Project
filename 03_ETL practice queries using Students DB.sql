-- ETL practice queries using Students DB
--#LEVEL 1

--1.How many total students are present in the table?  

select count(*) as Total_Students_Count from dbo.students

--2. How many students scored more than 80 marks? 
Select count(*) total_students_above_80Marks
from dbo.students   --Expected 7 students
where Marks > 80

--3️ How many students got Grade 'A'?

select count(*) total_students_grade_A
from students
where Grade = 'A'


--4.Display all female students.
select * from students
where Gender = 'Female'

--5.Find students who scored between 60 and 80 marks.

select * from students
where Marks between 60 and 80


--#LEVEL 2

--6.Check if there are any duplicate Student_id values.
select Student_id, count(*) as duplicate_value
from students
Group by Student_id
Having count(*) > 1

--7.Find records where First_Name is NULL.
select *
from students
where First_Name IS NULL

--8.Find students with marks greater than 100 or less than 0.
 select * 
 from students
 where Marks>100 or Marks<0

--9.Find invalid grades (other than A, B, C, D).
select Count(*)
from students
where Grade NOT IN('A', 'B', 'C', 'D')
group by grade

--10.Count how many students are there per Grade.

select grade, Count(*) total_students_per_grade
from students
group by grade

/*Level3 Business Rule Validation
Assume grading logic is:

90–100 → A
75–89 → B
60–74 → C
60-35 → D
Below 35 → F
*/

--11. Write a query to calculate expected grade using marks.

select Student_id, Grade, Marks,
case 
   when marks is null then 'Not_available'  -- Handling nulls
   when marks < 0 then 'Invalid_Marks'      --Handlind negative value or bad data
   when Marks >= 90 then 'A'
   when Marks >= 75 then 'B'
   when Marks >= 60 then 'C'
   when Marks >= 35 then 'D'
   else 'F'
 End Expected_Grade
from students

--12. Find students where stored Grade does NOT match expected grade.

select *
from (
select Student_id, Marks, Grade as Actual_Grade,
case 
   when marks is null then 'Not_available'  -- Handling nulls
   when marks < 0 then 'Invalid_Marks'      --Handlind negative value or bad data
   when Marks >= 90 then 'A'
   when Marks >= 75 then 'B'
   when Marks >= 60 then 'C'
   when Marks >= 35 then 'D'
   else 'F'
 End Expected_Grade
 from students
 )t
where Actual_Grade != Expected_Grade


--or 

select Student_id, Marks, Grade as Actual_Grade
from students
where Grade <>
case 
   when marks is null then 'Not_available'  -- Handling nulls
   when marks < 0 then 'Invalid_Marks'      --Handlind negative value or bad data
   when Marks >= 90 then 'A'
   when Marks >= 75 then 'B'
   when Marks >= 60 then 'C'
   when Marks >= 35 then 'D'
   else 'F'
 End 


 --13. Count how many students fall into each grade based on marks.

select Expected_Grade, Count(*) as Total_students_each_grade
from 
(select 
 case 
    when Marks Is NULL then 'Invalid_marks'
	when Marks < 0 then 'Invalid Data'
    when Marks >= 90 then 'A'
	when Marks >= 75 then 'B'
	when Marks >= 60 then 'C'
	when Marks >= 35 then 'D'
	else 'F'
 End Expected_Grade
from students
)t
group by Expected_Grade

--14.Count how many students fall into each grade based on marks and Show students along with total students in their grade
select Student_id, Marks,Grade as Actual_Grade, Expected_Grade,
Count(*) over(Partition by Expected_Grade) as student_grade from
(select *,
case 
    when Marks Is NULL then 'Invalid_marks'
	when Marks < 0 then 'Invalid Data'
    when Marks >= 90 then 'A'
	when Marks >= 75 then 'B'
	when Marks >= 60 then 'C'
	when Marks >= 35 then 'D'
	else 'F'
 End Expected_Grade
from students
)t

--#LEVEL 4 – Aggregation & ETL Validation

--15. Find average marks by Gender.
select Gender, Avg(marks) Avg_marks_Gender
from students
Group by Gender


--16.Find maximum and minimum marks in the table.
Select Max(Marks) as Max_Marks,
Min(Marks) as Min_Marks
from students

--17. Count students per Gender and Grade
Select Gender, Grade, count(*) as Count_Per_Gender
from students
Group by Gender, Grade
