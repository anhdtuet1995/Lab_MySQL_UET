create database my_classicmodels;

use my_classicmodels;

create table orders(
	orderNumber int(11) not null auto_increment primary key,
	orderDate datetime not null,
	requiredDate datetime not null,
	shippedDate datetime,
	status varchar(15),
	comments text,
	customersNumber int(11) not null
);

create table productlines(
	productLine varchar(50) not null primary key,
	textDescription varchar(4000),
	htmlDescription mediumtext,
	image mediumblob
);

create table products(
	productCode varchar(15) not null primary key,
	productName varchar(70) not null,
	productLine varchar(50) not null,
	foreign key (productLine) references productlines(productLine) on update cascade,
	productScale varchar(10) not null,
	productVendor varchar(50) not null,
	productDescription text not null,
	quanlityInStock smallint(6) not null,
	buyPrice double not null
);

create table orderdetails(
	orderNumber int(11) not null,
	productCode varchar(15) not null,
	quanlityOrdered int(11) not null,
	priceEach double not null,
	orderLineNumber smallint(6) not null,
	primary key (orderNumber, productCode),
	foreign key (orderNumber) references orders(orderNumber) on update cascade,
	foreign key (productCode) references products(productCode) on update cascade
);