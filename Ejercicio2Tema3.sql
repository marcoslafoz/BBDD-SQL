CREATE DATABASE IF NOT EXISTS universidad;
USE universidad;
create table programas_estudios(
codigo varchar(15) PRIMARY KEY,
nombre varchar(256),
departamento varchar(256)
);

create table estudiantes(
DNI varchar(9) PRIMARY KEY,
nombre varchar(256),
apellidos varchar(256)
);

create table becas(
codigo varchar(15) PRIMARY KEY,
nombre varchar(256),
requisitos varchar(256)
);

create table doctorado(
codigo varchar(15) PRIMARY KEY,
nombre varchar(256),
nhoras int
);

create table programas_doctorado(
id_programa varchar(15) REFERENCES programa_estudios(codigo),
id_doctorado varchar(15) REFERENCES doctorado(codigo),
PRIMARY KEY (id_programa,id_doctorado)
);

create table matriculas(
DNI varchar(9) REFERENCES estudiantes(DNI),
id_doctorado varchar(15) REFERENCES doctorado(codigo),
PRIMARY KEY (DNI,id_doctorado)
);

create table solicitar_becas(
DNI varchar(9) REFERENCES estudiantes(DNI),
id_beca varchar(15) REFERENCES becas(codigo),
PRIMARY KEY (DNI,id_beca)
);

create table recibir_becas(
DNI varchar(9) REFERENCES estudiantes(DNI),
id_beca varchar(15) REFERENCES becas(codigo),
PRIMARY KEY (DNI,id_beca)
);