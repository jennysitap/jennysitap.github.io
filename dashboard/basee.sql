create database dietas;
use dietas;
create table users(
id integer not null auto_increment,
name varchar (30),
last_name varchar (30),
age integer,
weight double,
height double,
email varchar (100),
password varchar(200),
primary key (id)
);
select * from users;