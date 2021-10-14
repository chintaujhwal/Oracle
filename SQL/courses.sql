create table courses
(
course_id varchar2(5) constraint course_id_pk primary key, 
course_name varchar2(30) constraint course_name_nn not null,
course_fee number(5) constraint course_fee_nn not null
);

select * from courses

insert into courses values('OR','Oracle Database',5000);
insert into courses values('PY','Python',4500);
insert into courses values('JE','Java EE',2500);
insert into courses values('JS','Java Script',2000);


create table students
(
student_id number(5) constraint student_id_pk primary key, 
student_name varchar2(30) constraint student_name_nn not null, 
join_date date default sysdate, 
course_id varchar2(5) constraint course_id_fk references courses(course_id),  
paid_amt number(5) constraint paid_amt_chk check(paid_amt > 0), 
constraint student_fee_check check(paid_amt <= course_fee)
);


insert into students values(1,'Mike',sysdate,'OR',2000);
insert into students values(2,'El',sysdate,'PY',4000);
insert into students values(3,'Lucas',sysdate,'OR',3000);
insert into students values(4,'Max',sysdate,'PY',3500);
insert into students values(5,'Selena',sysdate,'JS',1000);
insert into students values(6,'Steve',sysdate,'JE',2500);


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