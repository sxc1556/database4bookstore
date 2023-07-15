delimiter //
CREATE TRIGGER calculateamount AFTER 
UPDATE ON record
FOR EACH ROW
BEGIN 
DECLARE startd DATE ;
DECLARE expectd DATE ;
DECLARE sum DOUBLE DEFAULT 0.0 ;

SELECT a.expectedreturndate 
INTO expectd;
SELECT a.borrowdate 
INTO startd
FROM record a
WHERE a.record_id=new.record_id;

IF (DATE(expectd)< CURDATE()) THEN
set sum =  timestampdiff(day, startd, expectd)*0.2+timestampdiff(day,expectd,CURDATE())*0.4;
ELSEIF (DATE(expectd)> CURDATE()) THEN
set sum =  timestampdiff(day, startd, CURDATE())*0.2;
END IF;
INSERT INTO `pj1`.`invoice` (`invoice_id`, `invoice_amount`, `invoice_status`) VALUES (LAST_INSERT_ID()+1, sum, '0');
END;

