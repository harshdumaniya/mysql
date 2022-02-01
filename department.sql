-- Create a job table
create table job (
    id int not null auto_increment,
    name varchar(35),
    min_salary decimal(15, 2),
    max_salary decimal(15, 2),
    primary key (id)
);
	
-- Create a country table	
create table country (
    id int not null auto_increment,
    name varchar(35),
    primary key (id)
);
	
-- Create a department table	
create table department (
    id int not null auto_increment,
    name varchar(15),
    fk_country_id int(10),
    foreign key (fk_country_id)
        references country (id)
        on update cascade on delete cascade,
    primary key (id)
);
			
-- Create an employee table	
create table employee (
    id int not null auto_increment,
    first_name varchar(45),
    last_name varchar(45),
    email varchar(70),
    salary decimal(15, 2),
    fk_department_id int(10),
    fk_job_id int(10),
    foreign key (fk_department_id)
        references department (id)
        on update cascade on delete cascade,
    foreign key (fk_job_id)
        references job (id)
        on update cascade on delete cascade,
    primary key (id)
);


-- Insert data into job table
insert into job(name, min_salary, max_salary) values ('ca', 50000, 90000);
insert into job(name, min_salary, max_salary) values ('hr manager', 20000, 50000);
insert into job(name, min_salary, max_salary) values ('developer', 12000, 25000);
insert into job(name, min_salary, max_salary) values ('peon', 10000, 21000);
insert into job(name, min_salary, max_salary) values ('intern', 5000, 10000);

-- Insert data into country table
insert into country(name) values ('India');
insert into country(name) values ('Australia');
insert into country(name) values ('Canada');
insert into country(name) values ('Usa');
insert into country(name) values ('Africa');

-- Insert data into department table
insert into department(name, fk_country_id) values ('account', 1);
insert into department(name, fk_country_id) values ('hr management', 2);
insert into department(name, fk_country_id) values ('it', 3);
insert into department(name, fk_country_id) values ('general', 4);
insert into department(name, fk_country_id) values ('it', 5);

-- Insert data into employee table
insert into employee(first_name, last_name, email, salary, fk_department_id, fk_job_id) values ('Mehul', 'Maheshwari', 'mehulmaheshwari123@gmailcom',50000, 1, 1);
insert into employee(first_name, last_name, email, salary, fk_department_id, fk_job_id) values ('Sanjay', 'Srivastav','sanjusri45@gmail.com',45000, 2, 2);
insert into employee(first_name, last_name, email, salary, fk_department_id, fk_job_id) values ('Lokesh','Patel', 'lokkypatel99@gmail.com',12000, 3, 3);
insert into employee(first_name, last_name, email, salary, fk_department_id, fk_job_id) values ('Durgesh','Solanki','durgeshsolanki70@gmail.com',6000, 4, 4);
insert into employee(first_name, last_name, email, salary, fk_department_id, fk_job_id) values ('Arjun', 'Rana','arjrana777@gmail.com', 4000, 5, 5);

-- Records from all tables
select * from job;
select * from country;
select * from department;
select * from employee;

-- Create a query to get name (firstname + lastname) with department name, country name, job name
select concat(e.first_name, ' ' ,e.last_name) as full_name, d.name as department_name, j.name as job_name, c.name as country_name
from employee as e
left join department as d on  d.id = e.fk_department_id
left join job as j on j.id = e.fk_job_id
left join country as c on c.id = d.fk_country_id
group by e.id;


-- Query to get 2nd highest salary of the employee
select *from employee 
order by  salary desc limit 1, 1;

 -- Query to get all job name and department name in single query
select name from job union select name from department;
