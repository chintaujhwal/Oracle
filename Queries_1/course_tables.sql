create table courses
(
course_id varchar2(5) constraint course_id_pk primary key, 
course_name varchar2(30) constraint course_name_nn not null
);


insert into courses values('ora','Oracle Database');
insert into courses values('pyt','Python');
insert into courses values('jee','Java EE');
insert into courses values('jsc','Java Script');


create table students
(
student_id number(5) constraint student_id_pk primary key, 
student_name varchar2(30) constraint student_name_nn not null, 
join_date date default sysdate, 
course_id varchar2(5) constraint course_id_fk references courses(course_id), 
total_fee number(5) constraint total_fee_chk check(total_fee > 0), 
fee_paid number(5) constraint fee_paid_chk check(fee_paid > 0), 
constraint student_fee_check check(fee_paid <= fee)
);


insert into students values(1,'Mike',sysdate,'ora',3300,2000);
insert into students values(2,'El',sysdate,'pyt',4000,4000);
insert into students values(3,'Lucas',sysdate-10,'ora',3300,3000);
insert into students values(4,'Max',sysdate-10,'pyt',4000,3500);
insert into students values(5,'Selena',sysdate-30,'jsc',2500,2500);
insert into students values(6,'Steve',sysdate-60,'jee',3500,1500);


create table payments
(
payment_id number(20) constraint payment_id_pk primary key,
student_id number(5) constraint student_id__fk references students(student_id),
payment_date date default sysdate,
payment_amount number(5) constraint payment_amount_chk check(payment_amount > 0),
payment_mode char(1) constraint payment_mode_chk check(upper(payment_mode) in ('C','O')),
remarks varchar(40) 
);


insert into payments values(101,1,sysdate+5,1300,'o','Google Pay');
insert into payments values(102,2,sysdate,null,'o','Google Pay');
insert into payments values(103,3,sysdate-5,300,'o','PhonePe');
insert into payments values(104,4,sysdate-5,500,'c',null);
insert into payments values(105,5,sysdate-20,null,'o','Paytm');
insert into payments values(100,6,sysdate-50,2000,'c',null);

commit;