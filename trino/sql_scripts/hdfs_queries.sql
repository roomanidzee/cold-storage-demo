create schema hdfs.data_path
with (location = 'hdfs://hadoop-node:9000/data_path/')

create table hdfs.data_path.zstd_table(
  id int,
  secondname varchar,
  firstname varchar,
  email varchar,
  jobtype varchar,
  recordcreationtime timestamp,
  year bigint,
  month bigint,
  day bigint
)
WITH (
  format = 'PARQUET',
  partitioned_by = ARRAY['year', 'month', 'day']
)

insert into hdfs.data_path.zstd_table 
select
  *
from sql_server.dbo.usersinfo_extracted;

create schema hdfs_snappy.data_path_snappy
with (location = 'hdfs://hadoop-node:9000/data_path_snappy/')

create table hdfs_snappy.data_path.snappy_table(
  id int,
  secondname varchar,
  firstname varchar,
  email varchar,
  jobtype varchar,
  recordcreationtime timestamp,
  year bigint,
  month bigint,
  day bigint
)
WITH (
  format = 'PARQUET',
  partitioned_by = ARRAY['year', 'month', 'day']
)

insert into hdfs_snappy.data_path.snappy_table 
select
  *
from sql_server.dbo.usersinfo_extracted   

create table hdfs_lz4.data_path.lz4_table(
  id int,
  secondname varchar,
  firstname varchar,
  email varchar,
  jobtype varchar,
  recordcreationtime timestamp,
  year bigint,
  month bigint,
  day bigint
)
WITH (
  format = 'PARQUET',
  partitioned_by = ARRAY['year', 'month', 'day']
)

insert into hdfs_lz4.data_path.lz4_table 
select
  *
from sql_server.dbo.usersinfo_extracted 

create table hdfs_gzip.data_path.gzip_table(
  id int,
  secondname varchar,
  firstname varchar,
  email varchar,
  jobtype varchar,
  recordcreationtime timestamp,
  year bigint,
  month bigint,
  day bigint
)
WITH (
  format = 'PARQUET',
  partitioned_by = ARRAY['year', 'month', 'day']
)

insert into hdfs_gzip.data_path.gzip_table 
select
  *
from sql_server.dbo.usersinfo_extracted