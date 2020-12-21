create database assignment8;

use assignment8;

use assignment5;

create table emprec as select * from emp;


select * from emprec;

delimiter $$
create procedure proc()
begin
declare done int default 0;
declare eno int;
declare dcur cursor for select empno from emprec;
declare continue handler for not found set done = 1;

open dcur;

repeat
       fetch dcur into eno;
       update emprec set sal = sal+1000 where empno = eno;
until done
end repeat;
close dcur;
end $$

 call proc()
 
 
 delimiter %%
 create procedure proc_1()
 begin
       declare done int default 0;
	   declare e_job varchar (20);
       declare ecur cursor for select job from emprec;
       declare continue handler for not found set done = 1;
       
       open ecur;
       
       repeat
              fetch ecur into e_job;
              select ename,sal from emprec where job = 'analyst';
	   until done
       end repeat;
       close ecur;
end %%

call proc_1()

delimiter ^^
create procedure proc_2()
begin
     declare done int default 0;
     declare cur_sal int;
     declare scur cursor for select sal from emprec;
     declare continue handler for not found set done = 1;
     
     open scur;
      
      loop1 : loop
      fetch scur into cur_sal;
      if done =1 then
      leave loop1;
      else 
            select empno,ename,sal from emprec order by sal desc limit 5;
      
      end if;
      end loop;
      close scur;
end ^^
  
  drop procedure proc_2;
		
  call proc_2()    

