# Setup Information

For launch of SQL Server 2019 Instance with test data, please, run following commands in the root directory of repository:

```bash

docker pull mcr.microsoft.com/mssql/server:2019-latest
docker-compose up -d mssql
docker logs -f mssql_db #check if there are no problems in launch
docker exec -it mssql_db mkdir /usr/sqlsetup
docker cp mssql/setup.sql mssql_db:/usr/sqlsetup/setup.sql
docker exec -it mssql_db /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Qwerty1234 -d master -i /usr/sqlsetup/setup.sql

```

Data was generated with the help of following sites: [Data Generation](https://extendsclass.com/csv-generator.html#container-result-first) and [SQL Statements Generation](https://sql.info/h/tools/query-builder/insert.html)
