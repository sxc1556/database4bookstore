use errorfree;
-- SQLINES DEMO *** le SQL Developer Data Modeler 22.2.0.165.1149
-- SQLINES DEMO *** -11-04 16:10:08 EDT
-- SQLINES DEMO *** le Database 21c
-- SQLINES DEMO *** le Database 21c



-- SQLINES DEMO *** no DDL - MDSYS.SDO_GEOMETRY

-- SQLINES DEMO *** no DDL - XMLTYPE

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE au_bo (
    author_id    BIGINT NOT NULL,
    book_book_id BIGINT NOT NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE au_se (
    invitation_id BIGINT NOT NULL COMMENT 'INVITATION ID OF AUTHOR',
    author_id     BIGINT NOT NULL,
    event_id      BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN au_se.invitation_id IS
    'INVITATION ID OF AUTHOR'; */

ALTER TABLE au_se ADD CONSTRAINT au_se_pk PRIMARY KEY ( invitation_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE author (
    author_id     BIGINT NOT NULL COMMENT 'UNQIUE AUTHOR ID',
    firstname     VARCHAR(10) NOT NULL COMMENT 'FIRST NAME OF AUTHOR',
    lastname      VARCHAR(10) COMMENT 'LAST NAME OF AUTHOR',
    email_address VARCHAR(20) NOT NULL COMMENT 'EMAIL ADDRESS OF THE AUTHOR',
    street        VARCHAR(30) NOT NULL COMMENT 'STREET ADDRESS',
    city          VARCHAR(30) NOT NULL COMMENT 'CITY ADDRESS',
    state         VARCHAR(30) NOT NULL COMMENT 'STATE',
    zip_code      BIGINT NOT NULL COMMENT 'ZIP CODE OF ADDRESS'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.author_id IS
    'UNQIUE AUTHOR ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.firstname IS
    'FIRST NAME OF AUTHOR'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.lastname IS
    'LAST NAME OF AUTHOR'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.email_address IS
    'EMAIL ADDRESS OF THE AUTHOR'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.street IS
    'STREET ADDRESS'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.city IS
    'CITY ADDRESS'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.state IS
    'STATE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN author.zip_code IS
    'ZIP CODE OF ADDRESS'; */

ALTER TABLE author ADD CONSTRAINT author_pk PRIMARY KEY ( author_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE book (
    book_id  BIGINT NOT NULL COMMENT 'UNIQUE BOOK ID',
    booknmae VARCHAR(20) NOT NULL COMMENT 'NAME OF THE BOOK',
    topic    VARCHAR(20) NOT NULL COMMENT 'TOPIC OF THE BOOK'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN book.book_id IS
    'UNIQUE BOOK ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN book.booknmae IS
    'NAME OF THE BOOK'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN book.topic IS
    'TOPIC OF THE BOOK'; */

ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( book_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE copy (
    book_id      BIGINT NOT NULL,
    copy_id      VARCHAR(2) NOT NULL COMMENT 'UNIQUE COPY ID',
    availability DOUBLE NOT NULL COMMENT 'AVAILABILITY STATUS OF THE COPY'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN copy.copy_id IS
    'UNIQUE COPY ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN copy.availability IS
    'AVAILABILITY STATUS OF THE COPY'; */

ALTER TABLE copy ADD CONSTRAINT copy_pk PRIMARY KEY ( copy_id,
                                                      book_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE cu_ex (
    registration_id BIGINT NOT NULL COMMENT 'UNIQUE REGISTRATION ID',
    customer_id     BIGINT NOT NULL,
    event_id        BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN cu_ex.registration_id IS
    'UNIQUE REGISTRATION ID'; */

ALTER TABLE cu_ex ADD CONSTRAINT cu_ex_pk PRIMARY KEY ( registration_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE customer (
    customer_id    BIGINT NOT NULL COMMENT 'UNQIUE CUSTOMER ID',
    firstname      VARCHAR(20) NOT NULL COMMENT 'FIRST NAME OF CUSTOMER',
    lastname       VARCHAR(20) NOT NULL COMMENT 'LAST NAME OF CUSTOMER',
    phonenumber    VARCHAR(20) COMMENT 'PHONE NAME OF CUSTOMER',
    email          VARCHAR(30) COMMENT 'EMAIL OF CUSTOMER',
    passport       VARCHAR(20) COMMENT 'PASSPORT OF CUSTOMER',
    ssn            VARCHAR(20) COMMENT 'SSN OF CUSTOMER',
    driver_license VARCHAR(30) COMMENT 'DRIVER''S LICENSE OF CUSTOMER'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.customer_id IS
    'UNQIUE CUSTOMER ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.firstname IS
    'FIRST NAME OF CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.lastname IS
    'LAST NAME OF CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.phonenumber IS
    'PHONE NAME OF CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.email IS
    'EMAIL OF CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.passport IS
    'PASSPORT OF CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.ssn IS
    'SSN OF CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.driver_license IS
    'DRIVER''S LICENSE OF CUSTOMER'; */

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE exhibition (
    event_id BIGINT NOT NULL COMMENT 'UNIQUE ID OF THE EVENT',
    expense  DECIMAL(10, 2) COMMENT 'EXPENSE OF THE EXHIBITION'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN exhibition.event_id IS
    'UNIQUE ID OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN exhibition.expense IS
    'EXPENSE OF THE EXHIBITION'; */

ALTER TABLE exhibition ADD CONSTRAINT exhibition_pk PRIMARY KEY ( event_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE invoice (
    invoice_id     BIGINT NOT NULL COMMENT 'UNIQUE INVOICE ID',
    invoice_amount DECIMAL(7, 2) NOT NULL COMMENT 'AMOUNT OF THE INVOICE',
    invoice_status CHAR(1) NOT NULL COMMENT 'STATUS OF THE INVOCIE',
    record_id      INT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN invoice.invoice_id IS
    'UNIQUE INVOICE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN invoice.invoice_amount IS
    'AMOUNT OF THE INVOICE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN invoice.invoice_status IS
    'STATUS OF THE INVOCIE'; */

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX invoice__idx ON
    invoice (
        record_id
    ASC );

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( invoice_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE lib_event (
    event_id  BIGINT NOT NULL COMMENT 'UNIQUE ID OF THE EVENT',
    eventtype CHAR(1) NOT NULL COMMENT 'TYPE OF THE EVENT',
    eventname VARCHAR(50) NOT NULL COMMENT 'NAME OF THE EVENT',
    starttime DATETIME NOT NULL COMMENT 'START TIME OF THE EVENT',
    endtime   DATETIME NOT NULL COMMENT 'END TIME OF THE EVENT'
);

ALTER TABLE lib_event
    ADD CONSTRAINT ch_inh_lib_event CHECK ( eventtype IN ( 'E', 'R' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN lib_event.event_id IS
    'UNIQUE ID OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN lib_event.eventtype IS
    'TYPE OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN lib_event.eventname IS
    'NAME OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN lib_event.starttime IS
    'START TIME OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN lib_event.endtime IS
    'END TIME OF THE EVENT'; */

ALTER TABLE lib_event ADD CONSTRAINT lib_event_pk PRIMARY KEY ( event_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE payment (
    payment_id    BIGINT NOT NULL COMMENT 'UNIQUE PAYMENT ID',
    paymentmethod VARCHAR(20) NOT NULL COMMENT 'PAYMENT METHOD: CASH, CREDIT, DEBIT, PAYPAL',
    paymentamount DECIMAL(7, 2) NOT NULL COMMENT 'AMOUNT OF THE PAYMENT',
    invoice_id    BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN payment.payment_id IS
    'UNIQUE PAYMENT ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN payment.paymentmethod IS
    'PAYMENT METHOD: CASH, CREDIT, DEBIT, PAYPAL'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN payment.paymentamount IS
    'AMOUNT OF THE PAYMENT'; */

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( payment_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE record (
    record_id            INT NOT NULL COMMENT 'UNIQUE RECORD ID',
    return_status        VARCHAR(10) NOT NULL COMMENT 'RETURN STATUS OF THE COPY',
    borrowdate           DATETIME NOT NULL COMMENT 'BORROWED DATE OF COPY',
    expected_return_date DATETIME NOT NULL COMMENT 'EXPECTED RETURN DATE OF THE COPY',
    actual_return_date   DATETIME COMMENT 'ACUTUAL RETURN DATE OF THE COPY',
    customer_id          BIGINT NOT NULL,
    copy_id              VARCHAR(2) NOT NULL,
    book_id              BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN record.record_id IS
    'UNIQUE RECORD ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN record.return_status IS
    'RETURN STATUS OF THE COPY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN record.borrowdate IS
    'BORROWED DATE OF COPY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN record.expected_return_date IS
    'EXPECTED RETURN DATE OF THE COPY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN record.actual_return_date IS
    'ACUTUAL RETURN DATE OF THE COPY'; */



ALTER TABLE record ADD CONSTRAINT record_pk PRIMARY KEY ( record_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE reservation (
    rev_day          DATETIME NOT NULL COMMENT 'DATE OF THE RESERVATION',
    session_id       CHAR(1) NOT NULL COMMENT 'TIME SLOT OF THE EVENT',
    room_id          BIGINT NOT NULL,
    customer_id      BIGINT NOT NULL,
    number_of_people INTEGER NOT NULL COMMENT 'NUMBER OF PEOPLE FOR THE RESERVATION'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN reservation.rev_day IS
    'DATE OF THE RESERVATION'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN reservation.session_id IS
    'TIME SLOT OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN reservation.number_of_people IS
    'NUMBER OF PEOPLE FOR THE RESERVATION'; */

ALTER TABLE reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY ( rev_day,
                                                session_id,
                                                room_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE room (
    room_id       BIGINT NOT NULL COMMENT 'UNIQUE ROOM ID',
    room_capacity BIGINT NOT NULL COMMENT 'CAPACITY OF ROOM'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN room.room_id IS
    'UNIQUE ROOM ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN room.room_capacity IS
    'CAPACITY OF ROOM'; */

ALTER TABLE room ADD CONSTRAINT room_pk PRIMARY KEY ( room_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE seminar (
    event_id BIGINT NOT NULL COMMENT 'UNIQUE ID OF THE EVENT',
    topic    VARCHAR(30) NOT NULL COMMENT 'TOPIC OF SEMINAR'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN seminar.event_id IS
    'UNIQUE ID OF THE EVENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN seminar.topic IS
    'TOPIC OF SEMINAR'; */

ALTER TABLE seminar ADD CONSTRAINT seminar_pk PRIMARY KEY ( event_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE sp_se (
    sponsor_id BIGINT NOT NULL,
    amount     DECIMAL(20, 2) NOT NULL COMMENT 'AMOUNT SPONSOR SUPPORT',
    event_id   BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN sp_se.amount IS
    'AMOUNT SPONSOR SUPPORT'; */

ALTER TABLE sp_se ADD CONSTRAINT sp_se_pk PRIMARY KEY ( sponsor_id,
                                                        event_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE sponsor (
    sponsor_id BIGINT NOT NULL COMMENT 'UNIQUE SPONSOR ID',
    firstname  VARCHAR(10) NOT NULL COMMENT 'FIRST NAME OF SPONSOR',
    lastname   VARCHAR(10) COMMENT 'LAST NAME OF SPONSOR'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN sponsor.sponsor_id IS
    'UNIQUE SPONSOR ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN sponsor.firstname IS
    'FIRST NAME OF SPONSOR'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN sponsor.lastname IS
    'LAST NAME OF SPONSOR'; */

ALTER TABLE sponsor ADD CONSTRAINT sponsor_pk PRIMARY KEY ( sponsor_id );

ALTER TABLE au_bo
    ADD CONSTRAINT au_bo_author_fk FOREIGN KEY ( author_id )
        REFERENCES author ( author_id );

ALTER TABLE au_bo
    ADD CONSTRAINT au_bo_book_fk FOREIGN KEY ( book_book_id )
        REFERENCES book ( book_id );

ALTER TABLE au_se
    ADD CONSTRAINT au_se_author_fk FOREIGN KEY ( author_id )
        REFERENCES author ( author_id );

ALTER TABLE au_se
    ADD CONSTRAINT au_se_seminar_fk FOREIGN KEY ( event_id )
        REFERENCES seminar ( event_id );

ALTER TABLE copy
    ADD CONSTRAINT copy_book_fk FOREIGN KEY ( book_id )
        REFERENCES book ( book_id );

ALTER TABLE cu_ex
    ADD CONSTRAINT cu_ex_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );

ALTER TABLE cu_ex
    ADD CONSTRAINT cu_ex_exhibition_fk FOREIGN KEY ( event_id )
        REFERENCES exhibition ( event_id );

ALTER TABLE exhibition
    ADD CONSTRAINT exhibition_lib_event_fk FOREIGN KEY ( event_id )
        REFERENCES lib_event ( event_id );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_record_fk FOREIGN KEY ( record_id )
        REFERENCES record ( record_id );

ALTER TABLE payment
    ADD CONSTRAINT payment_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES invoice ( invoice_id );

ALTER TABLE record
    ADD CONSTRAINT record_copy_fk FOREIGN KEY ( copy_id,
                                                book_id )
        REFERENCES copy ( copy_id,
                          book_id );

ALTER TABLE record
    ADD CONSTRAINT record_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_room_fk FOREIGN KEY ( room_id )
        REFERENCES room ( room_id );

ALTER TABLE seminar
    ADD CONSTRAINT seminar_lib_event_fk FOREIGN KEY ( event_id )
        REFERENCES lib_event ( event_id );

ALTER TABLE sp_se
    ADD CONSTRAINT sp_se_seminar_fk FOREIGN KEY ( event_id )
        REFERENCES seminar ( event_id );

ALTER TABLE sp_se
    ADD CONSTRAINT sp_se_sponsor_fk FOREIGN KEY ( sponsor_id )
        REFERENCES sponsor ( sponsor_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TRIGGER IF EXISTS arc_fkarc_3_exhibition;

DELIMITER //

CREATE TRIGGER arc_fkarc_3_exhibition BEFORE
    INSERT OR UPDATE OF event_id ON exhibition
    FOR EACH ROW
    DECLARE d CHAR(1);
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.eventtype
    INTO d
    FROM
        lib_event a
    WHERE
        a.event_id = :new.event_id;

    IF ( d IS NULL OR d <> 'E' ) THEN
        raise_application_error(-20223, 'FK Exhibition_Lib_Event_FK in Table Exhibition violates Arc constraint on Table Lib_Event - discriminator column EventType doesn''t have value ''E'''
        );
    END IF;

    DECLARE EXIT HANDLER FOR not found BEGIN
        NULL;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        RESIGNAL;
    END;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TRIGGER IF EXISTS arc_fkarc_3_seminar;

DELIMITER //

CREATE TRIGGER arc_fkarc_3_seminar BEFORE
    INSERT OR UPDATE OF event_id ON seminar
    FOR EACH ROW
    DECLARE d CHAR(1);
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.eventtype
    INTO d
    FROM
        lib_event a
    WHERE
        a.event_id = :new.event_id;

    IF ( d IS NULL OR d <> 'R' ) THEN
        raise_application_error(-20223, 'FK Seminar_Lib_Event_FK in Table Seminar violates Arc constraint on Table Lib_Event - discriminator column EventType doesn''t have value ''R'''
        );
    END IF;

    DECLARE EXIT HANDLER FOR not found BEGIN
        NULL;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        RESIGNAL;
    END;
END;
/



-- SQLINES DEMO *** per Data Modeler Summary Report: 
-- 
-- SQLINES DEMO ***                        17
-- SQLINES DEMO ***                         1
-- SQLINES DEMO ***                        34
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** DY                      0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         2
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE BODY              0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** EGMENT                  0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** ED VIEW                 0
-- SQLINES DEMO *** ED VIEW LOG             0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** A                       0
-- SQLINES DEMO *** T                       0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
