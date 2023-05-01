# cold-storage-demo
Sources for my presentation meetup about work with Cold Storage data

To run the examples on your personal work machine, please, read an instruction in each directory. 

First, you should run instruction from "mssql" directory.

Then:
  - For demonstration of hadoop + trino: ```docker compose up -d mssql hadoop-node trino-hdfs```
  - For demonstration of s3 + trino: ```docker compose up -d mssql mariadb hive-metastore minio minio-setup trino-s3```
