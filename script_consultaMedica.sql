-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.


CREATE TABLE PACIENTE (
	numPaciente int PRIMARY KEY,
	nome 		varchar(50) not null,
	endereco 	varchar(50)not null,
	telefone 	varchar(15)not null,
	dataNasc 	date not null,
	RG 			varchar(15) not null,
	sexo 		charnot null,
	estadoCivil varchar(20)not null,
	convenio 	varchar(100)
);

CREATE TABLE MEDICO (
	crmMedico 		int PRIMARY KEY,
	nome 			varchar(50)not null,
	especialidade 	varchar(100)not null,
	telefone 		varchar(15)not null,
);

CREATE TABLE EXAME (
	idExame 	int PRIMARY KEY,
	nome 		varchar(100)not null,
	descricao 	varchar(255)not null
);

CREATE TABLE CONSULTA (
	numConsulta 	int PRIMARY KEY,
	dataConsulta 	date not null,
	diagnostico 	varchar(255) not null,
	numPaciente 	int not null,	-- chave estrangeira
	crmMedico 		int not null,	-- chave estrangeira
	FOREIGN KEY(numPaciente) REFERENCES PACIENTE (numPaciente),
	FOREIGN KEY(crmMedico)   REFERENCES MEDICO (crmMedico)
);

CREATE TABLE proceder (
	idListaExames 	int PRIMARY KEY not null,
	dataExame 		date not null,
	idExame 		int not null,  	-- chave estrangeira
	numConsulta 	int not null,	-- chave estrangeira
	FOREIGN KEY(idExame) REFERENCES EXAME (idExame),
	FOREIGN KEY(numConsulta) REFERENCES CONSULTA (numConsulta)
);



