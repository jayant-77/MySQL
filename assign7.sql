create database assignment7;

use assignment7;

create table ord_master(
ord_no int(4) primary key,
cust_cd varchar(20),
status varchar(10)
);

desc ord_master;
select * from ord_dtl;
desc ord_dtl;

delimiter ##
create procedure ord_2()
begin 
      create table ord_dtl(ord_no int(4),Prod_cd varchar(10) primary key,Qty int(6));
      
       
end ##

 call ord_2()   
 
 insert into ord_dtl values (1,'P1',100),(2,'P2',200);
 
create table prod_master(
Prod_cd varchar(10),
Prod_name varchar(20),
Qty_in_stock int(6),
Booked_Qty int(6),
constraint fk_Prod_cd foreign key (Prod_cd) references ord_dtl (Prod_cd)
);

alter table ard_dtl drop primary key;
alter table prod_master drop foreign key fk_prod_cd;

desc Prod_master;

insert into Prod_master values ('P1',"Floppies",10000,1000),('P2','Printers',5000,600),('P3','modems',3000,200);

select * from prod_master;

delimiter $$
create trigger test3 before insert on ord_dtl for each row
begin
       update prod_master set booked_qty = booked_qty+new.qty where prod_cd = new.prod_cd;
end $$

	insert into ord_dtl values (2,'P1',200);

delimiter ##
create trigger b_delete2 before delete on ord_dtl for each row
begin
       update prod_master set booked_qty = booked_qty-old.qty where prod_cd = old.prod_cd;
end ##

set sql_safe_updates = 0;

delete from ord_dtl where prod_cd = 'P3';

select * from emp;
desc emp;


create table dept_sal (
deptno int(6),
totalsalary int(6)

);

desc dept_sal;

insert into dept_sal values (30,2145),(10,13200);

select * from dept_sal;

delimiter $$

create trigger update_salary after insert on emp for each row
begin
       update dept_sal set totalsalary = totalsalary+new.sal where deptno = new.deptno;
end $$

drop trigger update_salary;

drop table dept_sal;

insert into emp values (1007,'snehal','analyst',2,'2020-12-12',3000,30);
insert into emp values (1008,'jayant','',2,'2020-12-14',3000,10);

delimiter $$

create trigger update_sal after delete on emp for each row
begin
       update dept_sal set totalsalary = totalsalary-old.sal where deptno = old.deptno;
end $$

delete from emp where ename  = 'jayant';
delete from emp where ename  = 'snehal';
