create table sql_server.dbo.usersinfo_extracted
as
select
id,
secondname,
firstname,
email,
jobtype,
cast(recordcreationtime as timestamp) as recordcreationtime,
extract(year from recordcreationtime) as year,
extract(month from recordcreationtime) as month,
extract(day from recordcreationtime) as day
from sql_server.dbo.usersinfo 