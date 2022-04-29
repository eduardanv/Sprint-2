create database Greentech;
use Greentech;


-- CRIANDO TABELA 1 EMPRESA --
  create table Empresa
	(
    idEmpresa int primary key auto_increment,
    nomeEmpresa varchar (100),
    CNPJ char (14)
	)auto_increment=500;
    
-- CRIANDO TABELA 2 USUARIO --
create table Usuario 
	(
	idUsuario int primary key auto_increment,
    nome varchar (45),
	email varchar (45),
	senha varchar (45),
    telefone char (11),
    fkEmpresa int,
    foreign key (fkEmpresa)references Empresa(idEmpresa)
	);
        
-- CRIANDO TABELA 3 ESTUFA --
create table Estufa
	(
    fkEmpresa int,
	foreign key (fkEmpresa) references Empresa(idEmpresa),
	idEstufa int,
	primary key(fkEmpresa, idEstufa),
    nomeEstufa varchar (45),
    tamanho varchar (45),
	tipo varchar (45),
	minTemp decimal (5,2),
    maxTemp decimal (5,2),
	minUmidade decimal (5,2),
    maxUmidade decimal (5,2)
	);
    
-- CRIANDO TABELA 4 SENSORES --
create table Sensor
	(
    localizacao varchar (45),
    modelo varchar (45),
	fkEmpresa int,
    fkEstufa int,
	foreign key (fkEmpresa, fkEstufa) references Estufa (fkEmpresa, idEstufa),
    idSensor int primary key
    );

-- CRIANDO TABELA 5 DE MONITORAMENTO DOS SENSORES --
create table MonitoramentoSensor 
	(
    fkSensor int,
    foreign key (fkSensor) references Sensor(idSensor),
	idMonitoramento int,
    primary key(fkSensor, idMonitoramento),
	temperatura decimal (5,2),
	umidade decimal (5,2),
	hora time,
	dataMonitoramento date
	);
    
    
-- CRIANDO TABELA DE ALERTAS QUE SERÃO MOSTRADOS NA DASHBOARD --
create table Alerta 
	(
	idAlerta int primary key,
	fkMonitoramento int,
	fkSensor int,
	foreign key (fkSensor, fkMonitoramento) references MonitoramentoSensor(fkSensor, idMonitoramento),
	tipoAlerta varchar (45)
	)auto_increment = 600;