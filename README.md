# Railway Reservation System - DBMS Project

## 📌 Project Description
This repository contains a **Database Management System (DBMS)** for a railway reservation project implemented using **Oracle SQL Plus 21c**. The project aims to provide a structured database schema for managing trains, passengers, reservations, and related information in a railway transportation environment.

## 𝄜 Tables & Keys
| Table Name         | Description                                | Primary Key             | Foreign Keys                                        |
| ------------------ | ------------------------------------------ | ----------------------- | ----------------------------------------------------|
| `admin`            | Stores admin details                       | `admin_id`              | –                                                   |
| `users`            | Stores customer details                    | `user_id`               | –                                                   |
| `transaction_type` | Stores transaction categories & discounts  | `type_id`               | –                                                   |
| `train_ticket`     | Stores train ticket and schedule info      | `ticket_id`             | –                                                   |
| `reservation`      | Stores reservations                        | `reservation_id`        | `ticket_id`,`admin_id`,`customer_id`                |
| `transaction`      | Stores payment transactions                | `transaction_id`        | `type_id`,`reservation_id`,`admin_id`,`customer_id` |


## 📋 Database Schema
<img width="800" height="500" alt="image" src="https://github.com/user-attachments/assets/39deee11-36ae-42d4-8224-4359ae8cacbc" />


## 🛠️ Core Features 

### ✅ Table Operations  
- Normalized schema with `PRIMARY KEY` and `FOREIGN KEY` constraints  
- Data types selected for integrity (`VARCHAR2`, `DATE`, `TIMESTAMP`, `BLOB`)

### ✅ DML Operations  
- Standard queries: `INSERT`, `SELECT`, `UPDATE`, `DELETE`  
- Use of `%TYPE` and `%ROWTYPE` for safer variable declarations

### ✅ PL/SQL Programs  
**Anonymous blocks** for:  
- *Data retrieval*  
- *Row-level manipulation*  
- *Cursor iteration*
- *Conditional logic*  
- *Loops*
**Stored Procedure**: 
- `find_user(reservation_id, username)`: Prints the user name for the given reservation  
**Function**: 
- `get_train(ticket_id)`: Returns train name using ticket id 

### ✅ Triggers  
| Trigger Name | Timing & Event              | Description                                                                |
|--------------|-----------------------------|---------------------------------------------------------------------------|
| `trigdel`    | Before delete on Reservation | Deletes related transactions and associated train tickets          |
| `trigup`     | After update on Train_Ticket  | Updates Reservation table if ticket_id changes                   |
| `trignew`    | After insert on Transaction   | Creates a reservation entry with default values                    |
