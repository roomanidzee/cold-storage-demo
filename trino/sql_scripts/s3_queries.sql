CREATE SCHEMA iceberg.example_schema
WITH (location = 's3a://datalake/data_path/');

create table iceberg.example_schema.data_table(
  id int,
  secondname varchar,
  firstname varchar,
  email varchar,
  jobtype varchar,
  recordcreationtime timestamp(6),
  year bigint,
  month bigint,
  day bigint
)
WITH (
  format = 'PARQUET',
  partitioning = ARRAY['year', 'month', 'day']
)

insert into iceberg.example_schema.data_table
select 
  *
from sql_server.dbo.usersinfo_extracted

delete from iceberg.example_schema.data_table
where id > 9500;

SELECT * FROM iceberg.example_schema."data_table$properties"

SELECT * FROM iceberg.example_schema."data_table$history"

SELECT * FROM iceberg.example_schema."data_table$snapshots"

SELECT * FROM iceberg.example_schema."data_table$manifests"

SELECT * FROM iceberg.example_schema."data_table$partitions"

SELECT * FROM iceberg.example_schema."data_table$files"

SELECT * FROM iceberg.example_schema."data_table$refs"

select 
  *, "$path", "$file_modified_time"
from iceberg.example_schema.data_table

select
  *
from iceberg.example_schema.data_table for VERSION as of 7234725003914673686
where id > 9500

merge into iceberg.example_schema.data_table t1
using sql_server.dbo.usersinfo_extracted t2
on (t1.id = t2.id)
WHEN MATCHED
        THEN UPDATE
            SET recordcreationtime = current_timestamp
when not matched 
     then insert (id, secondname, firstname, email,jobtype,recordcreationtime)
          values (t2.id, t2.secondname, t2.firstname, t2.email, t2.jobtype, t2.recordcreationtime)

CREATE SCHEMA delta_lake.example_schema_one
WITH (location = 's3a://datalake/data_path1/');

create table delta_lake.example_schema_one.data_table(
  id int,
  secondname varchar,
  firstname varchar,
  email varchar,
  jobtype varchar,
  recordcreationtime timestamp(3) with time zone,
  year bigint,
  month bigint,
  day bigint
)
WITH (
  partitioned_by = ARRAY['year', 'month', 'day']
)

insert into delta_lake.example_schema_one.data_table
select 
  *
from sql_server.dbo.usersinfo_extracted

update delta_lake.example_schema_one.data_table set jobtype = 'test'

select * from delta_lake.example_schema_one."data_table$history"

delete from delta_lake.example_schema_one.data_table
where id > 9500

merge into delta_lake.example_schema_one.data_table t1
using sql_server.dbo.usersinfo_extracted t2
on (t1.id = t2.id)
WHEN MATCHED
        THEN UPDATE
            SET recordcreationtime = current_timestamp
when not matched 
     then insert (id, secondname, firstname, email,jobtype,recordcreationtime, year, month, day)
          values (t2.id, t2.secondname, t2.firstname, t2.email, t2.jobtype, t2.recordcreationtime, t2.year, t2.month, t2.day)