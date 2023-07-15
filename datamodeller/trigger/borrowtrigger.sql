delimiter //
create trigger record_insert_trigger before
	insert on record
	for each row
Begin
	declare avail tinyint default 0;
	SELECT
        a.availability
    INTO avail
    FROM
        copy a
    WHERE
        a.copy_id = new.copy_id and a.book_id = new.book_id;
	IF ( new.Actual_Return_Date is not NULL) THEN
		SIGNAL SQLSTATE '10123' SET MESSAGE_TEXT = 'When you borrow the book, the actual_return_date should be null';
    END IF;
    IF ( new.Return_Status = 'Return' OR new.Return_Status = 'Late') THEN
		SIGNAL SQLSTATE '10124' SET MESSAGE_TEXT = 'When you borrow the book, the return_status should be borrowed';
    END IF;
    IF (avail = 0) then
    SIGNAL SQLSTATE '10125' SET MESSAGE_TEXT ='copy is not available';
    end if;
    update copy set availability = 0 where book_id = new.book_id and copy_id = new.copy_id;
End // 