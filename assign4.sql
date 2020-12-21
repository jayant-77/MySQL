use assignment4;

show tables;

select * from dept;

select * from employee;

select dept_name,empname from employee inner join dept on dept.dept_id = employee.dept_id;

select * from employee inner join dept on employee.dept_id = dept.dept_id;

select dept_id,sum(salary) from employee group by dept_id;

select dept_name,empname from dept left outer join employee on dept.dept_id = employee.dept_id;

select dept_name,empname from dept right outer join employee on dept.dept_id = employee.dept_id;

-- select dept_name,empname from dept right join employee on dept.dept_id = employee.dept_id; 

select empname from employee order by manager;

select employee.empname,dept.dept_name from employee,dept;

create table emp1(
emp_no int(4),
emp_name varchar(20)
);

desc emp1;

insert into emp1 values (1,'A'),(2,'B'),(3,'C');
select * from emp1;

create table emp2 as select * from emp1;

select * from emp2;

update emp2 set emp_name = 'D',emp_no = 4 where emp_no = 3;

insert into emp2 values (5,'E');

select * from emp1 union all select * from emp2;

select empname from employee where salary = (select salary from employee where empname = 'Arun');

select empname from employee where dept_id = (select dept_id from employee where empname = 'jack');

select empname from employee where salary = (select min(salary) from employee);

update employee set salary = 15000 where dept_id = (select dept_id from dept where dept_name = 'training');

