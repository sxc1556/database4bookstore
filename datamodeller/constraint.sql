ALTER table lib_event
modify  column eventtype enum('E','R');

ALTER table lib_event
add constraint event_ck3 check(endtime-starttime > 0);

ALTER table SP_SE
add constraint SP_SE_ck check(amount >= 0);

ALTER table payment
add constraint payment_ck check(paymentamount >= 0);

ALTER table Invoice
add constraint invoice_ck check(Invoice_Amount >= 0);

ALTER table Record
add constraint record_ck check(expected_return_date - borrowdate > 0);

ALTER table Record
add constraint record_ck2 check(actual_return_date - borrowdate >= 0);

alter table copy
modify column availability tinyint(1); 

ALTER table Record
modify  column Return_Status enum('Borrowed','Return','Late');