# SQL ETL Version Control for customer data

## Overview
This project tracks SQL scripts for a customer data ETL pipeline in PostgreSQL.

## Structure
- `extract/` - Pulls data from a CSV.
- `transform/` - Cleans and aggregates data.
- `load/` - Stores the cleaned data into the database

## How to Use
1.	Run `extract/extract_customers.sql` to import raw data.
2.	Run `transform/clean_customers.sql` to clean data.
3.	Run `transform/aggregate_customers.sql` for summaries.
4.	Run `load/load_cleaned_data.sql` to store cleaned data.

## Git Workflow
- **Main branch:** Stores stable scripts.
- **Feature branches:** For modifying or optimizing scripts.

## Contributors
- [Elvis Enyiaka](https://github.com/Elvis2628)




