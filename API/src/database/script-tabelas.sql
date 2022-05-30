-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE acquatec;

USE acquatec;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	cpf char (11),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);




/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);

-- \/ \/ \/ \/ \/ FISH CARING \/ \/ \/ \/ \/
create database Fishcaring;
use Fishcaring;
create table Empresa(
	idEmpresa int primary key auto_increment,
    NomeEmpresa varchar(45) not null,
    NomeResponsavel varchar(45) not null,
    CNPJ char(14) not null,
    Telefone char(11),
    Email varchar(60) not null,
    Senha varchar(30) not null
);

create table Especie(
	idEspecie int primary key auto_increment,
    nomeEspecie varchar(80),
    tempMax decimal(5,2) not null,
    tempMin decimal(5,2) not null
);

create table Tanque(
	idTanque int primary key auto_increment,
    Identificador varchar(255),
    fkEmpresa int not null,
    foreign key (fkEmpresa) references Empresa(idEmpresa),
    fkEspecie int not null,
    foreign key (fkEspecie) references Especie(idEspecie)
);

create table Sensor(
	idSensor int primary key auto_increment,
    fkTanque int not null,
    foreign key (fkTanque) references Tanque(idTanque),
    Descricao varchar(80)
);
create table Monitoramento(
	idMonitoramento int auto_increment,
    fkSensor int not null,
    foreign key (fkSensor) references Sensor(idSensor),
    primary key (idMonitoramento, fkSensor),
    Temperatura decimal (5,2) not null,
    dataHora datetime not null
);
insert into Empresa values (null,'teste','teste','12345678901234','1166666666','teste@teste.com','123');
insert into especie values (null,'tilapia','33','26');
insert into tanque values (null, 'teste',1,1);
insert into sensor values (null,1,'teste');
insert into monitoramento values
	(null, 1, 30, '2022-05-30 12:25:00'),
	(null, 1, 32, '2022-05-30 12:26:00'),
	(null, 1, 26, '2022-05-30 12:27:00')
;
