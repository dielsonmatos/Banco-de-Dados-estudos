-- inserção de dados
use ecommerce;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)values
		    ('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		    ('Matheus','O','Pimentel', 987654321,'rua alameda 289, Centro - Cidade das flores'),
		    ('Ricardo','F','Silva', 45678913,'avenida alameda vinha 1009, Centro - Cidade das flores'),
		    ('Julia','S','França', 789123456,'rua laranjeiras 861, Centro - Cidade das flores'),
		    ('Roberta','G','Assis', 98745631,'avenida de koller 19, Centro - Cidade das flores'),
		    ('Isabela','M','Cruz', 654789123,'rua alameda das flores 28, Centro - Cidade das flores');
              
-- consulta de valores na tabela clients
select * from clients;

-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliation, size
insert into product (Pname, classification_kids, category, avaliation, size) values
		    ('Fone de ouvido',false,'Eletrônico','4', null),
                    ('Barbie Elsa',true,'Brinquedos','3',null),
                    ('Body Carters',true,'Vestimenta',5,null),
                    ('Microfone Vedo - Youtuber', false,'Eletrônico','4',null),
                    ('Sofá retrátil',false,'Móveis','3','3x57x80'),
                    ('Farinha de arroz',false,'Alimentos','2',null),
                    ('Fire Stick Amazon',false,'Eletrônico','3',null);

-- consulta de valores na tabela product
select * from product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		   (1, default, 'compra via aplicativo',null,1),
		   (2,default,'compra via aplicativo',null,1),
		   (3,'Confirmado',null,null,1),
		   (4,default,'compra via web site', 150,0);

-- consulta de valores na tabela orders
select * from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
			 (1,1,2,null),
                         (2,1,1,null),
                         (3,2,1,null);
                         
-- consulta de valores na tabela productOrder
select * from productOrder;

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values
			   ('Rio de Janeiro',1000),
                           ('Rio de Janeiro',500),
                           ('São Paulo',10),
                           ('São Paulo',100),
                           ('São Paulo',10),
                           ('Brasília',60);

-- consulta valores da tabela productStorage
select * from productStorage;

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
			    (1,2,'RJ'),
                            (2,6,'GO');
                            
-- consulta valores da tabela storageLocation
select * from storageLocation;

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
		     ('Almeida e filhos', 123456789123456,'21985474'),
                     ('Eletrônicos Silva',854519649143457,'21985484'),
                     ('Eletrônicos Vilma',934567893934695,'21975474');
                     
-- consulta valores da tabela supplier
select * from supplier;

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
			    (1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
-- consulta valores da tabela productSupplier
select * from productSupplier;

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
		   ('Tech eletronics',null,123456789456321,null,'Rio de Janeiro',219946287),
                   ('Botique Durgas',null,null,123456783,'Rio de Janeiro',219567895),
                   ('Kids World',null,456789123654485,null,'São Paulo',1198657484);
                   
-- consulta valores da tabela seller
select * from seller;

-- idPseller, idPproduct, Quantity
insert into productSeller (idPseller, idPproduct, Quantity) values
			  (1,6,80),
                          (2,7,10);
                   
-- consulta valores da tabela productSeller
select * from productSeller;
