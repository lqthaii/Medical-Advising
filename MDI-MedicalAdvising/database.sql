drop database if exists medical_advising;

create database medical_advising;
use medical_advising;



create table type_account(
id int primary key,
type_name varchar(50));


create table `account`(
user_name varchar(30) primary key,
email varchar(50),
`password` varchar(50),
type_account int,
foreign key(type_account) references type_account(id)
);

insert into type_account(id,type_name)
values(1,"Khách hàng"),
(2,"Bác sĩ"),
(3,"Nhà thuốc"),
(4,"Quản trị viên");


insert into `account`(user_name,email,`password`,type_account)
values("admin","admin@medicaladvising.com","admin",4),
("doctor","admin@medicaladvising.com","admin",2);


create table `admin`(
id int auto_increment primary key,
full_name varchar(50),
user_name varchar(30),
foreign key (user_name) references `account`(user_name));

create table customer(
id int auto_increment primary key,
identity_card varchar(11),
full_name varchar(50),
number_phone varchar(30),
user_name varchar(30),
foreign key (user_name) references `account`(user_name)
);


create table doctor(
id int auto_increment primary key,
identity_card varchar(11),
full_name varchar(50),
education varchar(30),
specialized varchar(50),
number_phone varchar(30),
user_name varchar(30),
address varchar(50) ,
foreign key (user_name) references `account`(user_name)
);

insert into doctor(full_name,user_name)
values("Lê Quang Thái","doctor");

create table question(
id int auto_increment primary key,
id_customer int,
id_doctor int,
time_question varchar(50),
time_answer varchar(50),
title varchar(50),
question varchar(1000),
reply varchar(10000),
`status` int);
create table pharmacies(
business_license_number varchar(11) primary key,
pharmacies_name varchar(10),
number_phone varchar(30),
user_name varchar(30),
address varchar(50) ,
foreign key (user_name) references `account`(user_name)
);
select  * from question;