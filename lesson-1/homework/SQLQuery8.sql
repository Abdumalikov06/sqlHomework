drop table if exists book;
create table book
(book_id int identity(1,1) primary key,
title varchar(250) not null,
price decimal(10,2) check(price>0),
genre varchar(255) null default 'Unknown');

insert into book(title,price)
values
('Otkan kunlar',12.223);

insert into book(title,price,genre)
values
('Sherlock holmes',23.99,'detective');

select * from book;
