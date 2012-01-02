create database bbs;

use bbs;

create table article 
(
id int primary key auto_increment,
pid int not null,
rootid int not null,
title varchar(255) not null,
cont text,
pdate datetime not null,
scan int not null,
isleaf int not null,
author varchar(20),
jinghua boolean,
zhiding boolean,
cid int,
lastdate datetime,
foreign key(cid) references category(id),
foreign key(author) references user(name) 
);

create table category
(
id int primary key auto_increment,
name varchar(50) not null,
description varchar(255)
)


create table user
(
id int primary key auto_increment,
name varchar(20) not null unique,
email varchar(40) not null,
password varchar(20) not null,
address varchar(40),
job varchar(20),
website varchar(20),
description varchar(255),
signature varchar(255),
autoLogin boolean,
rdate datetime,
totalPost int not null,
hasUserImg boolean,
hasSignatureImg boolean
);

create table banzhu
(
id int primary key,
foreign key(id) references user(id),
level int not null
)

create table banzhu_category
(
bid int,
cid int,
foreign key(bid) references banzhu(id),
foreign key(cid) references category(id),
primary key(bid,cid)
)

