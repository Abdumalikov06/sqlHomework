use class4;

create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');


select letter from letters
order by
case
when letter='b' then 0 else 1 
end,
letter;

select letter from letters
order by
case
when letter='b' then 1 else 0 
end,
letter;
