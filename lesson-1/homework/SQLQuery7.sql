drop table if exists invoice
create table invoice
(
invoice int identity(1,1),
amount decimal(10,2));
insert into invoice(amount)
values
(12.345),
(11.234),
(23.4567),
(24.5678),
(11.123);
set identity_insert invoice on;
insert into invoice (invoice,amount)
values(100,999.99);

set identity_insert invoice off;

select * from invoice;