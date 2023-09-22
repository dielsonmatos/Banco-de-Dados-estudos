-- language: sql
use mechanical;

-- displaying total clients
select count(*) from clients;

-- displaying clients with repair quote prices ​​greater than 100.00
select
    clients.idClient,
    clients.Contact_Name,
    clients.Contact_Number,
    repair_quote.Price
from
    clients
inner join
    repair_quote on clients.idClient = repair_quote.Client_idClient
having repair_quote.Price > 100.00;

-- displaying the number of employees for each gender
select
    count(*) as 'Total',
case
    when gender = 'M' then 'Male'
    when gender = 'F' then 'Female'
end as "Gender"
from
    employee
group by
    gender;
    
-- displaying the number of employees by department
select
    d.idDepartment,
    d.Department_Name,
    count(e.idEmployee) as Employee_Count
from
    department d
inner join
    employee e on d.idDepartment = e.Department_idDepartment
group by
    d.idDepartment, d.Department_Name
having
    count(e.idEmployee) > 0;
    
-- displaying clients with their service request
select
    clients.idClient,
    clients.Contact_Name,
    clients.Contact_Number,
    service_request.Request_Date,
    service_request.Descriptions
from
    clients
inner join
service_request on clients.idClient = service_request.Client_idClient;
