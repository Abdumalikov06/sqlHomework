drop table if exists category;
create table category
(
--category_id int primary key,
category_id int not null,
category_name varchar(255));
alter table category
add constraint pk_category primary key(category_id);
drop table if exists item;
create table item
(item_id int primary key,
item_name varchar(255),
category_id int not null);
alter table item
add constraint fk_item_category
foreign key (category_id)
references category(category_id)


insert into category
values
(1,'apple'),
(2,'banana');

insert into item
values
(3,'bmw',1),
(4,'porshe',2);


select * from category;
select * from item;
