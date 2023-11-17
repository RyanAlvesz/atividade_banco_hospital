create database db_hospital_ryan;

use db_hospital_ryan;

create table endereco
(
	id integer primary key auto_increment,
	rua varchar(100),
	cep bigint,
	cidade varchar(50),
	estado varchar(70)
);

insert into endereco (rua, cep, cidade, estado) values
("Rua Bonita", 12345678900, "Jandira", "São Paulo");

create table hospital
(
	id integer primary key auto_increment,
	nome varchar(100),
	cnpj bigint,
	endereco_id integer,

	foreign key (endereco_id) references endereco(id)

);

insert into hospital
(nome, cnpj, endereco_id) values
("Hospital da Gabie", 123456789123, 1);

create table alas
(
	id integer primary key auto_increment,
	nome varchar(50),
	corredor integer,
    hospital_id int,
 
	foreign key (hospital_id) references hospital(id)
    
);

insert into alas (nome, corredor, hospital_id) values
("Doentes", 1, 1);

create table enfermeiros
(
	id integer primary key auto_increment,
    nome varchar(100),
    cre bigint,
    ala_id int,
    chefe_id int,
    
    foreign key (ala_id) references alas(id),
    foreign key (chefe_id) references enfermeiros(id)
    
);

insert into enfermeiros (nome, cre, ala_id, chefe_id) values
("Ryan", 5678, 1, 19); 	

select * from enfermeiros;

select chefe.nome as chefe, enfermeiros.nome as funcionario from enfermeiros
join enfermeiros as chefe on enfermeiros.chefe_id = chefe.id
where chefe.nome = 19;


create table plano_saude
(
	id integer primary key auto_increment,
	nome varchar(50),
    telefone bigint,
    numero bigint,
    hospital_id integer,
    
    foreign key (hospital_id) references hospital(id)
    
);

create table medicos
(
	id integer primary key auto_increment,
    nome varchar(100),
    especialidade varchar(50),
    crm bigint,
    plano_saude_id integer,
    
    foreign key (plano_saude_id) references plano_saude(id)
    
);

create table pacientes
(
	id integer primary key not null,
    nome varchar(100),
    cpf bigint,
    telefone bigint,
    sexo varchar(9)
);

create table atendimento
(
	id integer primary key auto_increment,
	dataHora dateTime,
    paciente_id integer not null,
    medico_id integer not null,
    
	foreign key (medico_id) references medicos(id),
    foreign key (paciente_id) references pacientes(id)
    
);


