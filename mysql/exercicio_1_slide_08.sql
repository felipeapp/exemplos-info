drop database if exists exercicio_1_slide_08;
create database exercicio_1_slide_08;

use exercicio_1_slide_08;

create table setor (
    codigo int primary key not null,
    nome varchar(100) not null
);

create table programador (
    cpf char(11) primary key not null,
    nome varchar(100) not null,
    data_nascimento date not null,
    codigo_setor int not null,
    foreign key(codigo_setor) references setor(codigo)
        on update cascade on delete restrict
);

create table projeto (
    codigo int primary key not null,
    nome varchar(100) not null,
    cpf_programador char(11) not null,
    data_coordenacao date not null,
    foreign key(cpf_programador) references programador(cpf)
        on update cascade on delete restrict
);

create table linguagem_programacao (
    nome varchar(50) primary key not null,
    multiplataforma boolean not null,
    aberta boolean not null
);

create table domina (
    cpf_programador char(11) not null,
    nome_linguagem varchar(50) not null,
    anos_experiencia int not null,
    primary key(cpf_programador, nome_linguagem),
    foreign key(cpf_programador) references programador(cpf)
        on update cascade on delete restrict,
    foreign key(nome_linguagem) references linguagem_programacao(nome)
        on update cascade on delete restrict
);
