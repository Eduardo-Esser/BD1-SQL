create database redes4_2026
use redes4_2026

create table user(
coduser int not null primary key auto_increment,
email varchar(120) unique not null,
nome varchar(250) not null,
datnasc date not null);

create table venda(
codvenda int not null primary key auto_increment,
dtv timestamp not null,
dtentrega timestamp not null,
transportadora varchar(120) not null,
localentrega varchar(250) not null,
coduser int not null,
foreign key(coduser) references user(coduser)
on delete no action on update no action);

create table produto(
codproduto int not null primary key auto_increment,
descricao varchar(250) not null,
estoque int not null,
embalagem varchar(120) not null);

create table itemped(
codproduto int not null,
codvenda int not null,
qtditem int not null,
preco decimal(10,2) not null,
FOREIGN KEY(codproduto) REFERENCES produto (codproduto)
on delete no action on update no action,
FOREIGN KEY(codvenda) REFERENCES venda (codvenda)
on delete no action on update no action);