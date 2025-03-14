-- Create table to copy data
create table if not exists sample_dataset(
id serial primary key,
name varchar(100),
email varchar(50),
country varchar(50),
signup_date date
);



-- Extract raw data from CSV

copy data from sample_dataset(id, name, email, country, signup_date)
from "c:users/elvix/OneDrive/desktop/customer-data-etl/sample_dataset.csv"
delimiter ','
csv header;