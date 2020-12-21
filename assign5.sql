use assignment5;

show tables;

show procedure status;

select * from emp;
select * from dept;

drop table dept;


/* question1 */

delimiter $$
create procedure calculate(in x int,in y int)
begin
     select x+y as addition;
     select x-y as substraction;
     select x*y as multiplication;
     select x/y as division;
end $$

call calculate(5,4)

-- question 2 --

delimiter ##
create procedure rev1(in a varchar(20))
begin
      select reverse(a) as reverse;
end ##

call rev1('JAYANT PAWAR')

-- question 3 --

delimiter //
create procedure Top_5( var int)
begin
     select empno,ename,sal from emp order by sal desc limit var;
end //

call Top_5 (5)

-- question 4 --

delimiter &&
create procedure test (a int,b varchar(10),c date)
begin
      create table emp_test (emp_id int,emp_name varchar(20),e_joining_date date);
      insert into emp_test values(a,b,c);
end &&

call test (1001,'Jayant','2020-12-12')

-- question 5 -- 

delimiter ##
create procedure add1(a int, b varchar(20), c varchar (20))
begin
       insert into dept(dno,dname,area) values (a,b,c);
end ##

call add1 (70,'Education','pune')

delete from dept where area = 'pune';

-- question 6 --

delimiter //
create procedure prog()
begin 
     declare num int default 0;
     set num = 5;
     
     select num * num as square ;
     select num * num * num as cube;
     
end //

call prog()

-- question 7 --

delimiter $$
create procedure prog_4(out a int)
begin
      declare var int;
      set var = 10;
      set a = var;
      
end $$

call prog_4(@a)
select @a;
      
     
     
delimiter $$
create procedure prog_in_out2(inout dept_name varchar(100))
begin 
      
     select concat(dname ,"department is at location",area)
     into dept_name from dept where dname = dept_name;
end $$


 set @x = 'store';
call prog_in_out2(@x)
select @x;

DELIMITER $$

CREATE PROCEDURE RepeatDemo1(counter int)
BEGIN
     DECLARE result VARCHAR(100) DEFAULT '';
    
    REPEAT
        SET result = CONCAT(result,counter,',');
        SET counter = counter + 1;
    UNTIL counter >= 10   /* repeat the condition until condition become true,once the condition become true loop terminate*/
    END REPEAT;
    
    SELECT result;
END$$

CALL RepeatDemo1(5)

delimiter %%

create function con7(var int) returns varchar(30)
begin
      update emp set sal = sal +(sal*0.1) where deptno = var;
      return 'updated';
end %%

select con7(10)

delimiter $$
create procedure USER_QUERY_EMP  (in p_myeno int,out p_myjob varchar(20),out p_mysal int)
begin
      declare NO int ;
      SET NO = (SELECT COUNT(*) FROM EMP WHERE EMPNO = p_myeno);
      if no = 0 then
      select 'employee not exist';
      set p_myjob = ' ';
      set p_mysal = 0;
      else
      select sal,job into p_mysal,p_myjob from emp_demo where empno = p_myeno;
      end if;
end $$

call USER_QUERY_EMP (0,@sal,@job)
select @sal,@job;




