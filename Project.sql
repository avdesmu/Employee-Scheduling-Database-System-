--The App which I created using powerapps, which allows students to pick and find available shifts on campus. This app contains all the information of the on campus jobs available in Syracuse University. Bellow is the link to the app. [12/3/19 1:59 AM] Avin Deshmukh
   -- Netid : AVIN
   -- Password: AvinDeshmukh
 -- https://apps.powerapps.com/play/f75ee0f9-e479-4cce-9a25-d33f6655ee56?tenantId=4278a402-1a9e-4eb9-8414-ffb55a5fcf1e

--Admin --Created Admin for entering the app to find the available shifts

drop table admin;
create table admin
(
SUID numeric primary key,
netid varchar(20) not null,
passwords varchar(20) not null
)
select *from admin;

-- Student_type --Created table for all the cred
drop table student_employees;
create table student_employees
(
   Student_id numeric not null foreign key references admin(SUID),
   student_name varchar(50) not null,
   student_phone numeric not null,
   student_address varchar(100) not null,
   student_gender varchar(10) not null,
   student_email varchar(20) unique not null,
   citizenship Varchar(20) not null,
   student_workplace_id numeric(10) not null foreign key references workplace(workplace_id),
   student_employment_id varchar(100) not null foreign key references Employment_type(employment_id),
   student_shift_id numeric not null foreign key references shifts(shift_id)
   )
  select * from student_employees;
 
 --Employment_Type
  drop table Employment_type
  Create table Employment_type
  (
  employment_id varchar(100) Primary key,
    role_of_employee varchar(100) not null ,
  pay_per_hour numeric not null
  )

--WorkPlace
  drop table Workplace;
   create table Workplace
(
Workplace_id numeric(10) Primary key,
Name_of_Place Varchar(100) not null,
Phone_no numeric(10) not null,
Manager_Name Varchar(100) not null,
)


drop table shifts;
create table shifts
(Shift_id numeric primary key,
Stime time,
Etime time ,
Shift_day varchar(20) ,
shift_workplace_id numeric(10) not null foreign key references workplace(workplace_id),
shift_availability char 
)


select * from shifts;

-- Payroll
drop table payroll;
create table payroll
(payment_id numeric primary key,
method_details varchar(50) not null,
payment_student_id numeric not null foreign key references admin(SUID),
total_pay numeric not null
)
select * from payroll;




--Inserting SUID and Paswords
insert into admin(SUID,netid,passwords)
values (222794636,'AVIN', 'AvinDeshmukh');
--insert in student_employee
insert into student_employees (Student_id,student_name,student_phone,student_address,student_gender, student_email, citizenship,student_workplace_id, student_employment_id,student_shift_id )
values(222794636, 'Avin Deshmukh', 9552553203,'111,lancaster ave','Male','avdeshmu@syr.edu','Not American',1234,'avdeshmu',13);
 --Insert in Employee_type
 insert into Employment_type(employment_id, role_of_employee,pay_per_hour)
  values('avdeshmu','Student_worker',11);
 
 
 --Insert in Workplace
  insert into Workplace(Workplace_id,Name_of_Place, Phone_no,Manager_Name)
Values(1234,'Kimmel Cafe',3154550343,'Johnathan bro');
  insert into Workplace(Workplace_id,Name_of_Place, Phone_no,Manager_Name)
Values(1235,'Pages Cafe',3154550344,'Phobe Buffaw');
  insert into Workplace(Workplace_id,Name_of_Place, Phone_no,Manager_Name)
Values(1237,'Slocum Cafe',3154550345,'Ted Mosby');
  insert into Workplace(Workplace_id,Name_of_Place, Phone_no,Manager_Name)
  Values(1238,'Olstein Cafe',3154550346,'Marshal Eriksen');

--Insert in Shifts
insert into shifts(Shift_id,shift_workplace_id)
values(12,1234);
insert into shifts values(13,'2:00','5:00','Wednesday',1235,'Y')
-- insert payroll
insert into payroll (payment_id, method_details , payment_student_id ,total_pay)
values (111,'Direct Payment',222794636, 210);

--selecting 
select *from admin;
  select * from student_employees;
  select * from Workplace;
    select * from Employment_type
	select * from shifts;
