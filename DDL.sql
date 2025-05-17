-- If table already exists
drop table Transaction;
drop table Reservation;
drop table Train_Ticket;
drop table Transaction_type;
drop table Users;
drop table Admin;

create table Admin(
id int,
first_name varchar(15),
last_name varchar(15),
gender char(1),
phone_no char(11),
email varchar(30),
address varchar(30),
picture blob,
primary key (id));

create table Users(
id int,
first_name varchar(15),
last_name varchar(15),
gender char(1),
phone_no char(11),
email varchar(30),
address varchar(30),
picture blob,
primary key (id));

create table Transaction_type(
id int,
trans_type varchar(20),
discount_percent int,
primary key (id));

create table Train_Ticket(
id int,
train_name varchar(20),
from_des varchar(20),
to_des varchar(20),
datetime_of_departure varchar(30),
issue_date date,
primary key (id));

create table Reservation(
id int,
ticket_id int,
admin_id int,
customer_id int,
reservation_date date,
seat char(4),
seat_type varchar(15),
primary key (id),
foreign key (ticket_id) references Train_Ticket,
foreign key (admin_id) references Admin,
foreign key (customer_id) references Users);

create table Transaction(
id int,
transaction_id int,
transaction_amount int,
reservation_id int,
admin_id int,
customer_id int,
transaction_date date,
primary key (id),
foreign key (transaction_id) references Transaction_type,
foreign key (reservation_id) references Reservation,
foreign key (admin_id) references Admin,
foreign key (customer_id) references Users);

ALTER TABLE Reservation 
ADD (additional_info VARCHAR2(100));

ALTER TABLE Reservation
RENAME COLUMN additional_info TO extra_info;

ALTER TABLE Reservation
DROP COLUMN extra_info;

set pagesize 200
set linesize 200


