1: 		Simple Statements:

--A:	How many employees are registered in the database?
select count(eid) + count(fname) from employee;

--B:	Which employees' first names start with the letter A
select fname from employee where fname like 'A%'; 

--C:	What is the EID and full name of employees whose first and last names begin with A?

select eid, concat(fname, '', lname)
from employee
where fname like 'A%' and lname like 'A%';

select eid, concat(fname, '', lname)
from employee
where fname like '%A' and lname like 'A%''

--CI (wacky):	What is the average of the EIDs of C?

select avg(eid)
from employeewhere fname like 'A%' and lname like 'A%';


2:		Building up to an inner join:

--A:	What are the cid's and names of each company?
select cid, name from companies;
--B:	What are the eid's and full names (hint: concatenate) of all employees?
select eid, concat(fname,'',lname) from employee;
--C:	What are the did's and eid's of all employees?
select did, eid from positions;
--D:	What are the full names, eid's and did's of all employees?
select p.did e.eid, concat(e.fname, '', e.lname)
from employee E
inner join positions p on
e.eid = p.eid
--E:	What are the full names, eid''s, did''s of employees and what are the names and cid''s of companies?
select p.did, e.eid, concat(e.fname, '', e.lname), di.cid, c.name
from employee E
inner join positions p on
p.did = d.didinner join companies c 

3:		Inner Joins:

--A:	What are the EIDs of employees in the company whose CID is 5?
--B:	Which employees from A have an EID between (inclusive) 400 and 500?
--C:	What is the average salary for people who are developers split by company?
--D:	How many employees have a position of 'contractor' in department 8?
ET (thinking):	What would your output in D be if: 	we used did 117?
							we used cid 19?
							we used cid 3 and did 55?

4:		More practice:

--A:	What is the average salary each department pays for its employees?
--B:	Which department pays the maximum average salary (only output that department)
--C:	How many employees does each company have?
--D:	How many employees per department does each company have?

select count(e.eid), d.did, c.cid from employee E
inner join positions p on e.eid = p.eid 
inner join department d on p.did = d.did 
inner join companies c on d.cid = c.cid 
group by did, c.name
order by c.name;


--E:	How much does each company pay in total salaries?

select sum(p.salary), d.cid 
from positions p
inner join departmemts d 
on p.did = d.did 
group by d.cid;

union 

select count(p.eid) from positions p
inner join department d on p.did = d.did
group by d.cid;



5:		Food!>?: (this is a harder problem set)


Premise:	Your company had a great earnings report and they're too cheap to give bonuses. Instead they decide to host a party.

--A:	What are the full names of employees who don't have a favorite food?

select e.eid, concat(e.fname, '', e.lname) fullname, f.favofood from employee E
inner join foodies f on e.eid = f.eid
where favfood is null; 

--B:	What are the number of employees each food category has?

select count(e.eid), f.favfood from employee E
inner join foodies f on e.eid = f.eid
group by favfood;


--C:	The company realizes that too many employees have different preferences and they can't host a party for everyone...instead they decide to choose the three most popular foods and have a party just for those employees. What are the 3 favorite foods of employees in company 3?

select c.cid, e.eid, favfood from companies C
inner join department d on c.cid = d.did
inner join positions p on d.did = p.did
inner join employee e on d.eid = e.eid
inner join foodies f on e.eid = f.eid
where c.cid, f.favfood
order by count(e.eid) desc
limit 3;



	CI:	The company realizes that this would be unfair to many employees so they call other companies (the ones in our database) and each decides to host a party with their employees favorite foods and invite employees who like that food to their company feast as well.

	CII:	What is wrong with this idea?

	CIII:	Which employees not in company 3 should be invited to company 3's party?

select c.cid, e.eid, favfood from companies C
CASE
	when f.favfood like 'Pizza' then 1
	when f.favfood like 'Cronut' then 1
	when f.favfood like 'Ribs' then 1
	else 0
end
from companies c
inner join department d on c.cid = d.did
inner join positions p on d.did = p.did
inner join employee e on d.eid = e.eid
inner join foodies f on e.eid = f.eid

where c.cid != 3 and case != 0;
	hen f.favfood like 'Pizza' then 1	
	when f.favfood like 'Cronut' then 1
	when f.favfood like 'Ribs' then 1
	else 0
end; 


	