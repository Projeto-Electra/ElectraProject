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
CódigoClienteConta int not null,
foreign key(CódigoClienteConta) references Cliente(CódigoCliente),
EndereçoCliente varchar(200) not null

);

create table Pagamento(

CódigoPagamento int Primary Key auto_increment,
ValorPago double(9,3) not null,
DataPag Date not null,
CódigoClienteContaPag int not null,
foreign key(CódigoClienteContaPag) references Cliente(CódigoCliente),
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
CódigoEstoqueVenda int not null,
foreign key(CódigoEstoqueVenda) references Estoque(CódigoEstoque)

);

create table Produto(

CódigoProduto int Primary Key auto_increment,
NomeProduto varchar(150) not null,
Preço double(9,3) not null,
Marca varchar(140),
CódigoEstoqueProd int not null,
foreign key(CódigoEstoqueProd) references Estoque(CódigoEstoque)
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
      
insert into Contato(CódigoClienteConta, TelefoneCliente, EmailCliente, EndereçoCliente)
Values(1, "(21)95423-5567","Minions@gmail.com","AV. Mem de Sá, RJ "),
	  (2, "(11)98642-4356","Shrek@gmail.com","De baixo da Ponte, SP"),
      (3, "(81)90853-4356","Gomes@gmail.com","Caruaru, PE"),
	  (2, "(11)92632-4326","ShrekAlt@hotmail.com","De baixo da Ponte, SP");

insert into Estoque(QuantidadeEstoque, Descrição, Seção)
Values(10,"Motos Elétricas da GWS","GWS"),
      (5,"Motos Elétricas da Super Soco","Super Soco"),
	  (2,"Motos Elétricas da EVS","EVS");

insert into Produto(CódigoEstoqueProd,NomeProduto,Preço,Marca)
values(3,"Voltz EVS", 19.990,"EVS"),
      (1,"GWS K14RS", 133.000,"GWS"),
      (2,"Super Soco TC Max", 45.990,"Super Soco");

insert into Pagamento(CódigoClienteContaPag, ValorPago, Datapag, Desconto)
values(3,91.980,str_to_date('20/09/2023', '%d/%m/%Y' ),0),
	  (1,79.960,str_to_date('12/12/2022', '%d/%m/%Y' ),0),
      (1,133.000,str_to_date('12/03/2023', '%d/%m/%Y' ),0),
       (2,14.900,str_to_date('23/05/2023', '%d/%m/%Y' ),0);
      
insert into Venda(QuantidadeVenda, CódigoEstoqueVenda, ValorVenda, DataVenda, CódigoPagamento)
values(2,"2", '91.980',STR_TO_DATE('21/03/2021', '%d/%m/%Y') ,1),
      (1,"1", 133.000, str_to_date('12/03/2023', '%d/%m/%Y' ),3),
      (4,"3", 79.960, str_to_date('21/05/2022', '%d/%m/%Y' ),2),
      (1,"3", '19.990',STR_TO_DATE('22/05/2023', '%d/%m/%Y') ,4);

insert into ProdutoVenda(CódigoProduto, CódigoVenda)
values(1,3),
      (2,1),
      (3,2);


/*Inner Join para Consultar os Contatos dos Clientes*/
Select Nome, CPF, TelefoneCliente, EmailCliente, EndereçoCliente from Contato
Inner Join Cliente
On(Cliente.CódigoCliente = Contato.CódigoClienteConta);

/*Inner Join para Consultar as Contas Pagas pelos Clientes*/
Select Nome, CPF,ValorPago, Datapag, Desconto from Cliente
Inner Join Pagamento
On(Cliente.CódigoCliente= Pagamento.CódigoClienteContaPag);

/*Inner Join para Consultar o Estoque dos Produtos*/
Select NomeProduto, Preço, Marca, QuantidadeEstoque,Descrição, Seção from Produto
Inner Join Estoque
On(Produto.CódigoEstoqueProd = Estoque.CódigoEstoque);

/*Inner Join para Consultar os Produtos que foram Vendidos*/
Select NomeProduto, Preço, Marca,ValorVenda,DataVenda,QuantidadeVenda from Produto
Inner join Venda
On(Produto.CódigoEstoqueProd = Venda.CódigoEstoqueVenda);
