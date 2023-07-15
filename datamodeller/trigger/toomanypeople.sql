delimiter // 

CREATE TRIGGER chk_person_number1 BEFORE
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
        a.room_id = new.room_room_id;

    IF ( d IS NULL OR d < new.number_of_people ) THEN
  SIGNAL SQLSTATE '20123' SET MESSAGE_TEXT = 'Too many people';
    END IF;


END //