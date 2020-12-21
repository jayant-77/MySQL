create database assignment6;

use assignment6;

delimiter ##
create function fact(var int) returns int
begin
     declare iterator int(10) default 1;
loop1: loop
      if (var <= 0) then
      leave loop1;
      else
      set iterator = iterator * var;
      set var = var - 1;
      iterate loop1;
      end if;
      end loop;
      return iterator;
end ##

 
select fact(5) as factorial
      
delimiter ##
create function prime(x int) returns varchar(30)
begin
     declare I, M int;
     set I = 2;
     set M = x/2;
     if (x = 0 || x = 1) then
     return 'NOT PRIME';
     else
loop1 : loop
        while I <= M do
             if x % I = 0 then
                return 'NOT PRIME' ;
                leave loop1;
                else 
                set I = I + 1;
                iterate loop1;
       
	end if;         
	end while;
    return 'PRIME';
    end loop;
    end if;
end ##
                
  select prime(2) 
  
  drop function prime;
  
  delimiter //
  create function que_03(val int ) returns varchar(50)
  begin
       return concat (val,'inches',round(val/36),'yards',round(val/12),'foot');
 end //
 
 select que_03(12)

delimiter $$
create function square4(var int) returns int
begin
-- create table t3 (id int);
declare  a int;
return sqrt(var); /* sqrt means it gives a square root of particular number*/
end$$

select square4(36)

delimiter %%
create function con2(var int) returns varchar(30) 
begin
      update emp set salary = salary +(salary*0.1) where deptno = var;
      return 'updated' ;
end %%

select con2(101)

delimiter $$
create function USER_ANNUAL_COMP(p_eno int,p_comp int) returns int
begin
       declare p_sal int(6) default 0;
       declare p_comp int(6) default 0;
       
       set p_sal = (select salary from emp where empno = p_eno);
       set ANNUAL_COMP = (p_sal+p_comp)*12;
       
       return ANNUAL_COMP;
       
end $$

select USER_ANNUAL_COMP(101,500)

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

delimiter $$
create procedure rev_2(in var varchar(20))
begin
     declare val varchar(20);
     set val = var;
     if (val ='' || isnull(val)) then
     select 'string is a null';
     else
	 select reverse(val);
     end if;
end $$

call rev_2 (null) 

delimiter $$
create procedure tabledetails ()
begin
       show databases;
      select * from emp_demo;
end $$

drop procedure tabledetails;
call tabledetails()
     