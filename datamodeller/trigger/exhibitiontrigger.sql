delimiter // 

CREATE TRIGGER arc_fkarc_3_exhibition BEFORE
    INSERT  ON exhibition
    FOR EACH ROW    
BEGIN
    declare d char(8);

    SELECT
        a.eventtype
    INTO d
    FROM
        lib_event a
    WHERE
        a.event_id = new.event_id;

    IF ( d IS NULL OR d <> 'E' ) THEN
		SIGNAL SQLSTATE '20223' SET MESSAGE_TEXT = 'FK Seminar_Event_FK in Table Seminar violates Arc constraint on Table Event - discriminator column EventType doesn''t have value ''E''';
    END IF;


END //
