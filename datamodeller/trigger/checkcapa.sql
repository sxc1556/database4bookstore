delimiter // 

CREATE TRIGGER chk_person_number BEFORE
    INSERT  ON reservation
    FOR EACH ROW    
BEGIN
    declare d int default 0;
    SELECT
        a.room_capacity
    INTO d
    FROM
        room a
    WHERE
        a.room_id = new.room_id;

    IF ( d IS NULL OR d < new.Number_of_People ) THEN
		SIGNAL SQLSTATE '20123' SET MESSAGE_TEXT = 'Too many people';
    END IF;


END //