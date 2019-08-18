create table T(C text);
insert into T values('A');
insert into T values('A');
update T set C='B' where C='A';
select changes();
