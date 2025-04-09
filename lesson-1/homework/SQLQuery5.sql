drop table if exists account;
create table account
(--account_id int primary key,
--balance decimal(10,2) check(balance>=0),
--account_type varchar(20) check(account_type in ('cheking','saving'))
account_id int not null,
balance decimal(10,2),
account_type varchar(20))
;
alter table account
add constraint pk_account primary key(account_id);
alter table account
add constraint chk_balance_non_negative
check (balance >= 0);
alter table account
add constraint chk_account_type
check(account_type in ('cheking','saving'));

insert into account
values 
(1,2.3456,'cheking'),
(4,2.3456,'saving');

select * from account;