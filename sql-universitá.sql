create database universitá;

use universitá;

create table dipartimenti (
	id int not null auto_increment,
	nome varchar(255) not null,
	indirizzo varchar(255) not null,
	telefono varchar(13) not null,
	email varchar(255) not null,
	direttore varchar(255) not null,
	primary key(id)
);

create table corsi_di_laurea(
	id int not null auto_increment,
	nome varchar(255) not null,
	sede varchar(255) not null,
	classe varchar(10) not null,
	telefono varchar(13) not null,
	coordinatore varchar(255) not null,
	vicecoordinatore varchar(255) not null,
	primary key(id)
);

alter table corsi_di_laurea add column dipartimenti_id int;
alter table corsi_di_laurea add foreign key(dipartimenti_id) references dipartimenti(id);

create table studenti (
	matricola int not null auto_increment,
	nome varchar(255) not null,
	cognome varchar (255) not null,
	indirizzo varchar(255),
	email varchar(255) not null,
	id_corsi_di_laurea int not null,
	primary key(id),
	foreign key(id_corsi_di_laurea) references corsi_di_laurea(id)
);

create table corsi (
	id int not null auto_increment,
	nome varchar(255) not null,
	ore int not null,
	primary key(id)
);

create table insegnanti (
	id int not null auto_increment,
	nome varchar(255) not null,
	cognome varchar(255) not null,
	email varchar(255) not null,
	primary key(id)
);

create table corsi_corsidilaurea(
	id_corsi_di_laurea int not null,
	id_corsi int not null,
	foreign key (id_corsi_di_laurea) references corsi_di_laurea(id),
	foreign key (id_corsi) references corsi(id)
);

create table insegnanti_corsi (
	id_insegnanti int not null,
	id_corsi int not null,
	foreign key (id_insegnanti) references insegnanti(id),
	foreign key(id_corsi) references corsi(id)
);

INSERT INTO dipartimenti
(nome, indirizzo, telefono, email, direttore)
VALUES('Psicologia', 'via ciaociao', '054234546', 'ciao@ciao.it', 'mario');


INSERT INTO corsi_di_laurea
(nome, sede, classe, telefono, coordinatore, vicecoordinatore, dipartimenti_id)
VALUES('Scienze sociali', 'Bologna', 'boh', '054252693', 'marione', 'marietto', 1);
