-- criação do banco de dados para o cenário de mecânica
create database mechanical;
use mechanical;
-- drop database mechanical;

-- create table clients
create table clients (
	idClient int not null auto_increment,
	Contact_Name varchar(45) not null,
	CPF CHAR(11) not null,
	contact_Number char(11) not null,
	Contact_Email varchar(45) null,
	primary key (idClient)
);
alter table clients auto_increment=1;

-- create table Vehicle
create table vehicle (
	idVehicle int not null auto_increment,
	Client_idClient int not null,
	Car_Brand varchar(45) not null,
	Car_Model varchar(45) not null,
	License_Plate varchar(8) not null,
        primary key (idVehicle, Client_idClient),
	constraint fk_Vehicle_Client1 foreign key (Client_idClient) references clients(idClient)
);
alter table vehicle auto_increment=1;

-- create table service_request
create table service_request (
	idService_Request int not null auto_increment,
	Client_idClient int not null,
	Request_Date date not null,
	Descriptions varchar(45) not null,
        primary key (idService_Request, Client_idClient),
	constraint fk_Service_Request_Client1 foreign key (Client_idClient) references clients(idClient)
);
alter table service_request auto_increment=1;

-- create table Department
create table department (
	idDepartment int not null,
	Department_Name varchar(45) not null,
        primary key (idDepartment)
);

-- create table employee
create table employee (
	idEmployee int not null auto_increment,
	Department_idDepartment int not null,
	FirstName_and_LastName varchar(50) not null,
	Register_Number char(5) not null,
        Gender ENUM('M', 'F') not null,
	Hire_Date date not null,
        Birth_Date date not null,
        primary key (idEmployee, Department_idDepartment),
	constraint fk_Employee_Department1 foreign key (Department_idDepartment) references department(idDepartment)
);
alter table employee auto_increment=1;

-- create table task
create table task (
	idTask int not null auto_increment,
	Service_Request_idService_Request int not null, 
	Task_Name varchar(45) not null,
	Descriptions varchar(90) null,
	Task_Status enum('Started', 'Processing', 'Finished') default 'Processing',
	Dead_Line date not null,
        primary key (idTask, Service_Request_idService_Request),
	constraint fk_Task_Service_Request1 foreign key (Service_Request_idService_Request) references service_request(idService_Request)
);
alter table task auto_increment=1;

-- create table repair_quote
create table repair_quote (
	idRepair_Quote int not null auto_increment,
        Client_idClient int not null,
        Department_idDepartment int not null,
	Price float not null,
	Start_Date date not null,
	End_Date date not null,
	Approved tinyint not null,
        primary key (idRepair_Quote),
	constraint fk_Orçamento_Department1 foreign key (Department_idDepartment) references department(idDepartment),
	constraint fk_Repair_Quote_Client1 foreign key (Client_idClient) references clients(idClient)
 );
 alter table repair_quote auto_increment=1;

-- create table employee_task 
create table employee_task (
	Employee_idEmployee int not null,
	Employee_Department_idDepartment int not null,
	Task_idTask int not null,
        primary key (Employee_idEmployee, Employee_Department_idDepartment, Task_idTask),
	constraint fk_Employee_Task_Employee1 foreign key (Employee_idEmployee, Employee_Department_idDepartment) references employee(idEmployee, Department_idDepartment),
	constraint fk_Employee_Task_Task1 foreign key (Task_idTask) references task(idTask)
);
