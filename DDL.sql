-- If table already exists
drop table Transaction;
drop table Reservation;
drop table Train_Ticket;
drop table Transaction_type;
drop table Users;
drop table Admin;

create table Admin(
admin_id int,
first_name varchar(15),
last_name varchar(15),
gender char(1),
phone_no varchar(15),
email varchar(30),
address varchar(30),
picture blob,
primary key (admin_id));

create table Users(
user_id int,
first_name varchar(15),
last_name varchar(15),
gender char(1),
phone_no char(11),
email varchar(30),
address varchar(30),
picture blob,
primary key (user_id));

create table Transaction_type(
type_id int,
trans_type varchar(20),
discount_percent int,
primary key (type_id));

create table Train_Ticket(
ticket_id int,
train_name varchar(20),
from_des varchar(20),
to_des varchar(20),
datetime_of_departure varchar(30),
issue_date date,
primary key (ticket_id));

create table Reservation(
reservation_id int,
ticket_id int,
admin_id int,
customer_id int,
reservation_date date,
seat char(4),
seat_type varchar(15),
primary key (reservation_id),
foreign key (ticket_id) references Train_Ticket(ticket_id),
foreign key (admin_id) references Admin(admin_id),
foreign key (customer_id) references Users(user_id));

create table Transaction(
transaction_id int,
type_id int,
transaction_amount int,
reservation_id int,
admin_id int,
customer_id int,
transaction_date date,
primary key (transaction_id),
foreign key (type_id) references Transaction_type(type_id),
foreign key (reservation_id) references Reservation(reservation_id),
foreign key (admin_id) references Admin(admin_id),
foreign key (customer_id) references Users(user_id));

-- Alter table demo
ALTER TABLE Reservation 
ADD (additional_info VARCHAR2(100));

ALTER TABLE Reservation
RENAME COLUMN additional_info TO extra_info;

ALTER TABLE Reservation
DROP COLUMN extra_info;

set pagesize 200
set linesize 200


