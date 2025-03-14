-- Create new table to load cleaned data
create table if not exists cleaned_sample_dataset(
id serial primary key,
name varchar(100),
email varchar(50),
country varchar (50),
signup_date DATE
);

-- Insert cleaned data into cleaned_sample_dataset
insert into cleaned_sample_dataset (id, name, email, country, signup_date)
select distinct name, email, country, signup_date
from sample_dataset
where email is not null;
