create table photos
(
id int primary key,
photo varbinary(max));

insert into photos
select 6,BulkColumn from openrowset(
	BULK 'D:\photos\xnteqqbfzc841.jpg', SINGLE_BLOB
) AS img;

select * from photos

SELECT @@SERVERNAME;