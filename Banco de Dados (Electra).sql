create database db_loja;

use db_loja;

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
ValorVenda double not null,
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
Preço double not null,
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





