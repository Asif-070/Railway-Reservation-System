SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigdel
BEFORE delete ON reservation 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
BEGIN
delete from transaction where reservation_id=:o.id;
delete from train_ticket where id=:o.ticket_id;
END;
/

delete from reservation where id = 2;

SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigup
after update ON train_ticket 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
Enable
BEGIN
update reservation set ticket_id=:n.id where ticket_id = :o.id;
END;
/

update train_ticket set id = 9 where id = 5;

SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trignew
after insert ON transaction
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
Declare
BEGIN
insert into reservation values (:n.reservation_id, null , :n.admin_id , :n.customer_id , TO_DATE('2099-12-31', 'YYYY-MM-DD'), 'NIL', 'Unknown');
END;
/

INSERT INTO Transaction VALUES (11, 1, 100, 20, 2, 2, TO_DATE('2023-04-20', 'YYYY-MM-DD'));

drop trigger trigdel;
drop trigger trigup;
drop trigger trignew;