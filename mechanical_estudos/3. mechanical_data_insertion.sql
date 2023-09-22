-- inserção de dados
use mechanical;

insert into clients (Contact_Name, CPF, contact_Number, Contact_Email) values
		    ('Maria Clara', 12345678985, 11977887866, 'maria_clara@zetamail.com.br'),
                    ('Pedro Rocha', 15645678985, 11977886566, null),
                    ('Antonia Silva', 17845678985, 11977459966, 'antonia_silva@alphamail.com.br'),
                    ('Gilberto Passos', 19845678985, 11966889966, null),
                    ('Roberta Leão', 12245678985, 11977899966, null);
                    
select * from clients;

insert into vehicle (Client_idClient, Car_Brand, Car_Model, License_Plate) values
		    (1, 'Volkswagen', 'Gol', 'BBT-5133'),
                    (2, 'Chevrolet', 'Onix', 'ADE-3345'),
                    (3, 'Fiat', 'Palio', 'EKI-6852'),
                    (4, 'Ford', 'Fiesta', 'DRT-5569'),
                    (5, 'Toyota', 'Hilux', 'YYT-3312');
                    
select * from vehicle;

insert into service_request (Client_idClient, Request_Date, Descriptions) values
			    (1, '2023-08-14','Replace Broken Antenna'),
                            (2, '2023-08-23','A Warning Light Shows'),
                            (3, '2023-08-29','Replace Gas Lifts'),
                            (4, '2023-09-01', 'Check the Filter'),
                            (5, '2023-09-07','The Car is Consuming Too Much Oil');
                                                        
select * from service_request;

insert into department (idDepartment, Department_Name) values
		       (1, 'Management'),
                       (2, 'Human Resources'),
                       (3, 'Operations'),
                       (4, 'Finances'),
                       (5, 'TI');
                       
select * from department;

insert into employee (Department_idDepartment, FirstName_and_LastName, Register_Number, Gender, Hire_Date, Birth_Date) values
		     (3, 'João Apolonio', 0905, 'M', '2001-04-02', '1970-03-02'),
                     (2, 'Maria Venancio', 1001, 'F', '2005-05-12', '1980-02-25'),
                     (4, 'Breno Torento', 1017, 'M', '2011-02-08', '1988-11-20'),
                     (3, 'Astrogildo Oliveira', 1045, 'M', '2012-07-02', '1968-11-15'),
                     (1, 'Paula Bricks', 1105, 'F', '2014-09-15', '1985-01-27'),
                     (1, 'Robson Silva', 1115, 'M', '2015-07-02', '1992-02-25'),
                     (5, 'Bernardo Matskau', 1201, 'M', '2017-03-05', '1984-05-22'),
                     (2, 'Bianca Gomes', 1250, 'F', '2020-06-11', '1998-12-01');                     
                     
select * from employee;

insert into task (Service_Request_idService_Request, Task_Name, Descriptions, Task_Status, Dead_Line) values
                 (1, 'Antenna', null, 'Finished', '2023-08-24'),
                 (2, 'Light Shows', null, 'Started', '2023-09-02'),
                 (3, 'Gas Lifts', null, 'Finished', '2023-09-10'),
                 (4, 'Check Filter', null, default, '2023-09-11'),
                 (5, 'Oil', 'Check oil consumption', default, '2023-09-20');
                 
select * from task;

insert into repair_quote (Client_idClient, Department_idDepartment, Price, Start_Date, End_Date, Approved) values
			 (1, 4, 120.00, '2023-08-14', '2023-08-24', 1),
                         (2, 1, 205.00, '2023-08-23', '2023-09-02', 0),
                         (3, 4, 70.00, '2023-08-29', '2023-09-10', 1),
                         (4, 1, 250.00, '2023-09-01', '2023-09-11', 0),
                         (5, 3, 95.00, '2023-09-07', '2023-09-20', 1);
                         
select * from repair_quote;

insert into employee_task (Employee_idEmployee, Employee_Department_idDepartment, Task_idTask) values
			  (3,4,1),
                          (5,1,2),
                          (3,4,3),
                          (5,1,4),
                          (4,3,5);

select * from employee_task;
	
