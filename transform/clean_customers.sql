-- Clean raw to make it uniform and usable
-- 1. Fix missing VALUES
-- 	a. missing name
update sample_dataset
set name = "unknown"
where name is null;

-- b. missing country
update sample_dataset
set country = "unknown"
where country is null;


-- 2. Fix format inconsistencies
update sample_dataset
set email = lower(email)
where email is not null;

-- 3. Remove duplicate customer email
delete from sample_dataset
where id not in (
	select min(id) from sample_dataset
	group by email);