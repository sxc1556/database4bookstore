
delimiter //

CREATE TRIGGER record_update_trigger AFTER 
UPDATE ON record
FOR EACH ROW
BEGIN 
	DECLARE startd DATE ;
	DECLARE expectd DATE ;
    DECLARE actuald DATE ;
    declare num_invoice int default 0;
	DECLARE sum DOUBLE DEFAULT 0.0 ;
IF (new.actual_return_date is NULL) then
SIGNAL SQLSTATE '10121' SET MESSAGE_TEXT = 'book have not returned';
end if;

IF (new.expected_return_date <> old.expected_return_date OR new.borrowdate <> old.borrowdate) then
SIGNAL SQLSTATE '10122' SET MESSAGE_TEXT = 'You should change the borrow date and expected date after the book is borrowed';
end if;

set startd = new.borrowdate;
set expectd  = new.expected_return_date;
set actuald = new.actual_return_date;
select count(*) into num_invoice from invoice ; 


IF (DATE(expectd)< actuald) THEN
IF (new.return_status <> 'Late') then
SIGNAL SQLSTATE '10125' SET MESSAGE_TEXT = 'Return Status should be late';
end if;
set sum =  timestampdiff(day, startd, expectd)*0.2+timestampdiff(day,expectd,actuald)*0.4;
ELSEIF (DATE(expectd)> actuald) THEN
IF (new.return_status <> 'Return') then
SIGNAL SQLSTATE '10126' SET MESSAGE_TEXT = 'Return Status should be Return';
end if;
set sum =  timestampdiff(day, startd, actuald)*0.2;
END IF;
INSERT INTO `invoice` (`invoice_id`, `invoice_amount`, `invoice_status`,`record_id`) VALUES ( num_invoice+1, sum, '0',new.record_id);
update copy set availability = 1 where book_id = new.book_id and copy_id = new.copy_id;
END //