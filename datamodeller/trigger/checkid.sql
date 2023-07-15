delimiter //
CREATE TRIGGER chk_idnull BEFORE
    INSERT ON customer
    FOR EACH ROW    
BEGIN

    IF ( new.passport IS NULL  AND new.ssn IS NULL AND new.driver_license IS NULL) THEN
  SIGNAL SQLSTATE '20124' SET MESSAGE_TEXT = 'id required';
    END IF;


END //