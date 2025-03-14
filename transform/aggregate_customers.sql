-- Summary to show customer count by country

select country, count(*) as customer_count
from sample_dataset
group by country;