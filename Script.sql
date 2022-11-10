/*TABELA USERS*/
create table user(
id_user int auto_increment,
nome varchar(40) not null,
email varchar(40) not null,
password varchar(10) not null,
created date default now(),
uptated date,
primary key(id_user)
);

select * from user;
select nome, email, password from user;


insert into user
(nome, email, password)
values
('Kananda', 'kananda@gmail.com', '12345'),
('Kailane', 'kailane@gmail.com', '54321'),
('Kaio', 'kaio@gmail.com', '678910'),
('Augusto', 'augusto@gmail.com', '445566'),
('Luan', 'luan@gmail.com', '0010911');

/*TABELA  ROLES*/
create table roles(
id_roles int auto_increment,
nome varchar(40),
primary key(id_roles)
);

select * from roles;

insert into roles
(nome)
values
('Admin'),('Employee'),('Client');

/*TABELA USER_ROLES*/
create table userroles(
id_user int,
id_roles int,
foreign key(id_user) references user(id_user),
foreign key(id_roles) references roles(id_roles)
);


select user.id_user, user.email, roles.nome from userroles
join user on userroles.id_user = user.id_user join roles on 
roles.id_roles = userroles.id_roles where roles.nome = 'Admin';

select user.id_user, user.email, roles.nome from userroles
join user on userroles.id_user = user.id_user join roles on 
roles.id_roles = userroles.id_roles where roles.nome = 'Employee';

select user.id_user, user.email, roles.nome from userroles
join user on userroles.id_user = user.id_user join roles on 
roles.id_roles = userroles.id_roles where roles.nome = 'Client';

/*DEFINIR QUAL NÍVEL DE ACESSO*/
insert into userroles
(id_user, id_roles)
values
('1', '1'),
('2', '2'),
('3', '3'),
('4', '3'),
('5', '1');

/*TABELA POST*/
create table post(
id_post int auto_increment,
title varchar(40),
description text,
id_user int,
foreign key(id_user) references user(id_user),
primary key (id_post)
);

alter table post

add column updated date;


/drop table if exists post;/

select * from post;
select id_user, title, description from post;


select title, description from Post where id_user = 3;
select title, description from Post where id_user = 5;


delete from post where id_post = 4;
delete from post where id_user = 2;


insert into post
(id_user, title, description)
values
('1', 'Abracadabra 2', 'filme ótimo'),
('1', 'Disney Plus', 'melhor plataforma de filmes!'),

('2', 'Jogos Mortais', 'melhor filme de terror psicológico!'),
('2', 'HBO MAX', 'essa plataforma possui os melhores filmes de terror!'),

('3', 'A morte do Autotune', 'é uma das melhores músicas do Matue!'),
('3', 'Matue', 'o Matue é o melhor trapper do Brasil!'),

('4', 'Looney Tunes', 'esse desenho animado fez parte da minha infancia!'),
('4', 'Desenho Animado', 'é meu tipo de programa de tv favorito!'),

('5', 'Papo de Augustinho', 'é minha música favorita dele!'),
('5', 'Oruam', 'esse cantor ta fazendo muito sucesso atualmente!');

/*ATUALIZAR POST*/
update post 
set title = 'Pantera Negra 2',
description = 'filme de qualidade espetacular, ultrapassou todas as minhas expectativas!',
update = '11/11/2022'
where id_post = 1;