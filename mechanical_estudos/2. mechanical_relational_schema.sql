-- Language: SQL
-- criação do banco de dados para o cenário de mecânica
CREATE DATABASE mechanical;
USE mechanical;
-- drop database mechanical;

-- create table clients
CREATE TABLE clients (
	idClient int NOT NULL auto_increment,
	Contact_Name varchar(45) NOT NULL,
	CPF CHAR(11) NOT NULL,
	contact_Number char(11) NOT NULL,
	Contact_Email varchar(45) NULL,
	PRIMARY KEY (idClient)
);
ALTER TABLE clients auto_increment=1;

-- create table Vehicle
CREATE TABLE vehicle (
	idVehicle int NOT NULL auto_increment,
	Client_idClient int NOT NULL,
	Car_Brand varchar(45) NOT NULL,
	Car_Model varchar(45) NOT NULL,
	License_Plate varchar(8) NOT NULL,
        PRIMARY KEY (idVehicle, Client_idClient),
	CONSTRAINT fk_Vehicle_Client1 FOREIGN KEY (Client_idClient) REFERENCES clients(idClient)
);
ALTER TABLE vehicle auto_increment=1;

-- create table service_request
CREATE TABLE service_request (
	idService_Request int NOT NULL auto_increment,
	Client_idClient int NOT NULL,
	Request_Date date NOT NULL,
	Descriptions varchar(45) NOT NULL,
        PRIMARY KEY (idService_Request, Client_idClient),
	CONSTRAINT fk_Service_Request_Client1 FOREIGN KEY (Client_idClient) REFERENCES clients(idClient)
);
ALTER TABLE service_request auto_increment=1;

-- create table Department
CREATE TABLE department (
	idDepartment int NOT NULL,
	Department_Name varchar(45) NOT NULL,
        PRIMARY KEY (idDepartment)
);

-- create table employee
CREATE TABLE employee (
	idEmployee int NOT NULL auto_increment,
	Department_idDepartment int NOT NULL,
	FirstName_and_LastName varchar(50) NOT NULL,
	Register_Number char(5) NOT NULL,
        Gender ENUM('M', 'F') NOT NULL,
	Hire_Date date NOT NULL,
        Birth_Date date NOT NULL,
        PRIMARY KEY (idEmployee, Department_idDepartment),
	CONSTRAINT fk_Employee_Department1 FOREIGN KEY (Department_idDepartment) REFERENCES department(idDepartment)
);
ALTER TABLE employee auto_increment=1;

-- create table task
CREATE TABLE task (
	idTask int NOT NULL auto_increment,
	Service_Request_idService_Request int NOT NULL, 
	Task_Name varchar(45) NOT NULL,
	Descriptions varchar(90) NOT NULL,
	Task_Status enum('Started', 'Processing', 'Finished') DEFAULT 'Processing',
	Dead_Line date NOT NULL,
        PRIMARY KEY (idTask, Service_Request_idService_Request),
	CONSTRAINT fk_Task_Service_Request1 FOREIGN KEY (Service_Request_idService_Request) REFERENCES service_request(idService_Request)
);
ALTER TABLE task auto_increment=1;

-- create table repair_quote
CREATE TABLE repair_quote (
	idRepair_Quote int NOT NULL auto_increment,
        Client_idClient int NOT NULL,
        Department_idDepartment int NOT NULL,
	Price float NOT NULL,
	Start_Date date NOT NULL,
	End_Date date NOT NULL,
	Approved tinyint NOT NULL,
        PRIMARY KEY (idRepair_Quote),
	CONSTRAINT fk_Orçamento_Department1 FOREIGN KEY (Department_idDepartment) REFERENCES department(idDepartment),
	CONSTRAINT fk_Repair_Quote_Client1 FOREIGN KEY (Client_idClient) REFERENCES clients(idClient)
 );
 ALTER TABLE repair_quote auto_increment=1;

-- create table employee_task 
CREATE TABLE employee_task (
	Employee_idEmployee int NOT NULL,
	Employee_Department_idDepartment int NOT NULL,
	Task_idTask int NOT NULL,
        PRIMARY KEY (Employee_idEmployee, Employee_Department_idDepartment, Task_idTask),
	CONSTRAINT fk_Employee_Task_Employee1 FOREIGN KEY (Employee_idEmployee, Employee_Department_idDepartment) REFERENCES employee(idEmployee, Department_idDepartment),
	CONSTRAINT fk_Employee_Task_Task1 FOREIGN KEY (Task_idTask) REFERENCES task(idTask)
);
