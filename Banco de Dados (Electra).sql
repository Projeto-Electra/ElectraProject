/*Criando Banco de Dados*/
create database db_loja;

use db_loja;

/*Criando as Tabelas*/
create table Cliente(

CódigoCliente int Primary Key auto_increment,
Nome varchar(150) not null,
CPF varchar(150),
Senha varchar(160) not null

);

create table Contato(

CódigoContato int Primary Key auto_increment,
TelefoneCliente varchar(150) not null,
EmailCliente varchar(200) not null,
CódigoCliente int not null,
foreign key(CódigoCliente) references Cliente(CódigoCliente),
EndereçoCliente varchar(200) not null

);

create table Pagamento(

CódigoPagamento int Primary Key auto_increment,
ValorPago double not null,
DataPag Date not null,
CódigoCliente int not null,
foreign key(CódigoCliente) references Cliente(CódigoCliente),
Desconto varchar(10)

);

create table Estoque
(

CódigoEstoque int Primary Key auto_increment,
QuantidadeEstoque varchar(150) not null,
Descrição varchar(200),
Seção varchar(140)

);

create table Venda(

CódigoVenda int Primary Key auto_increment,
ValorVenda double(9,3) not null,
DataVenda date not null,
CódigoPagamento int not null,
foreign key(CódigoPagamento) references Pagamento(CódigoPagamento),
QuantidadeVenda int not null,
CódigoEstoque int not null,
foreign key(CódigoEstoque) references Estoque(CódigoEstoque)

);

create table Produto(

CódigoProduto int Primary Key auto_increment,
NomeProduto varchar(150) not null,
Preço double(9,3) not null,
Marca varchar(140),
CódigoEstoque int not null,
foreign key(CódigoEstoque) references Estoque(CódigoEstoque)
); 

create table ProdutoVenda(

CódigoProdutoVenda int Primary Key auto_increment,
CódigoVenda int not null,
foreign key(CódigoVenda) references Venda(CódigoVenda),
CódigoProduto int not null,
foreign key(CódigoProduto) references Produto(CódigoProduto)

);

/*Inserindo nas Tabelas*/

insert into Cliente(Nome, CPF, Senha)
Values("Minions 2", 343545,"maça123"),
	  ("Shrek 4", 456788,"banana123"),
      ("Manoel Gomes", 343545,"manga123");
      
insert into Contato(CódigoCliente, TelefoneCliente, EmailCliente, EndereçoCliente)
Values(1, "(21)95423-5567","Minions@gmail.com","AV. Mem de Sá, RJ "),
	  (3, "(11)98642-4356","Shrek@gmail.com","De baixo da Ponte, SP"),
      (2, "(81)90853-4356","Gomes@gmail.com","Caruaru, PE");

insert into Estoque(QuantidadeEstoque, Descrição, Seção)
Values(10,"Motos Elétricas da GWS","GWS"),
      (5,"Motos Elétricas da Super Soco","Super Soco"),
	  (2,"Motos Elétricas da EVS","EVS");

insert into Produto(CódigoEstoque,NomeProduto,Preço,Marca)
values(3,"Voltz EVS", 19.990,"EVS"),
      (1,"GWS K14RS", 133.000,"GWS"),
      (2,"Super Soco TC Max", 45.990,"Super Soco");

insert into Pagamento(CódigoCliente, ValorPago, Datapag, Desconto)
values(3,91.980,str_to_date('20/09/2023', '%d/%m/%Y' ),0),
	  (1,79.960,str_to_date('12/12/2022', '%d/%m/%Y' ),0),
      (2,133.000,str_to_date('12/03/2023', '%d/%m/%Y' ),0);
      
insert into Venda(QuantidadeVenda, CódigoEstoque, ValorVenda, DataVenda, CódigoPagamento)
values(2,"2", '91.980',STR_TO_DATE('21/03/2021', '%d/%m/%Y') ,1),
      (1,"1", 133.000, str_to_date('12/03/2023', '%d/%m/%Y' ),3),
      (4,"3", 79.960, str_to_date('21/05/2022', '%d/%m/%Y' ),2);

insert into ProdutoVenda(CódigoProduto, CódigoVenda)
values(1,3),
      (2,1),
      (3,2);
