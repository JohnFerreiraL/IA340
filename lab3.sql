--Q2.1
insert into student(s_email,s_name,major)

values
	('s2@jmu.edu','s2','IA'),
	('s3@jmu.edu','s3','ISAT'),
	('s4@jmu.edu','s4','ISAT');
	
update student 
set major = 'IA'
where s_email = 's1@jmu.edu'
--S1 was already written as GS major. I changed the major using the update function

--Q2.2
insert into professor (p_email, p_name, office)
values ('p1@jmu.edu','p1','o1'),
	('p2@jmu.edu','p2','o2');

--Q2.3
insert into course(c_number,c_name,room,p_email)
values('c1','postgresql','r1','p1@jmu.edu'),
	('c2','mongodb','r2','p2@jmu.edu'),
	('c3','twitter','r1','p1@jmu.edu');

--Q2.4
insert into enroll(s_email, c_number)
values ('s1@jmu.edu','c1'),
	('s2@jmu.edu', 'c1'),
	('s3@jmu.edu', 'c1'),
	('s4@jmu.edu', 'c2'),
	('s2@jmu.edu', 'c3'),
	('s3@jmu.edu', 'c3');

--Q2.5
insert into professor (p_email, p_name, office)
values ('p3@jmu.edu', 'p3', 'o3');

insert into course (c_number, c_name, room, p_email)
values ('c4', 'facebook', 'r1','p3@jmu.edu');

--professor must go first because the professor email is being refrenced in the new course table

--Q2.6
update course
set p_email = 'p3@jmu.edu'
where p_email= 'p1@jmu.edu';

delete from professor
where p_email = 'p1@jmu.edu'
--must update course first because we wont be able to delete p1 if he is still teaching a class


--Q2.7	
select * from enroll 
	
--Q2.8
select c_number, count(*) as num_student
from enroll
group by c_number
order by num_student desc
limit 1;

--Q2.9
select professor.p_name, course.c_name
from professor
inner join course
on professor.p_email = course.p_email;

--Q2.10
select p_name, count(*) as num_course
from professor
inner join course
on professor.p_email = course.p_email
group by p_name
order by num_course desc
limit 1;

