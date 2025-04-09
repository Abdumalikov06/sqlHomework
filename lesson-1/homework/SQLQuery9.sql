drop table if exists book;
create table book
(book_id int primary key,
title varchar(255),
author varchar(50),
published_year int);


drop table if exists member;
create table member
(
member_id int primary key,
name varchar(50),
email varchar(255),
phone_number varchar(255));

drop table if exists loan;
create table loan
(
loan_id int primary key,
book_id int foreign key references book(book_id),
member_id int foreign key references member(member_id),
loan_date date,
return_date date null);

-- Insert into book
insert into book (book_id, title, author, published_year) values
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925),
(2, '1984', 'George Orwell', 1949),
(3, 'To Kill a Mockingbird', 'Harper Lee', 1960);

-- Insert into member
insert into member (member_id, name, email, phone_number) values
(1, 'Alice Johnson', 'alice@example.com', '123-456-7890'),
(2, 'Bob Smith', 'bob@example.com', '987-654-3210');

--insert into loan
insert into loan (loan_id, book_id, member_id, loan_date, return_date) values
(1, 1, 1, '2025-04-01', '2025-04-08'),
(2, 2, 2, '2025-04-03', null); 

select * from book;
select * from member;
select * from loan;



