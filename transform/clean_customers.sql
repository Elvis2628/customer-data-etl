-- Clean raw to make it uniform and usable
-- 1. Fix missing VALUES
-- 	a. missing name
update sample_dataset
set name = coalesce(name, "unknown customer");


-- b. missing country
update sample_dataset
set country = "unknown"
where country is null;


-- 2. Fix format inconsistencies by ensuring: 
-- a. all emails are in lowercase
update sample_dataset
set email = lower(email)
where email is not null;


-- b.  all customer names have first letter capitalized
update sample_dataset
set name = initcap(name)
where name is not null;


-- 3. Remove duplicate customer email
-- a. Store duplicate records before deleting to avoid accidental data loss
create table if not exists archive_sample_dataset as table sample_dataset with no data;

insert into archive_sample_dataset
select * from sample_dataset
where id not in (
	select min(id) from sample_dataset group by email
);
-- b. delete duplicate records
delete from sample_dataset
where id not in (
	select min(id) from sample_dataset
	group by email);