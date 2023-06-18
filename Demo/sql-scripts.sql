Create database KafkaTraning_Db;
--------------------------------------------

use KafkaTraning_Db;

create table Article(
id int primary key identity(1,1),
title varchar(30),
createdBy int not null,
createdDate dateTime not null,
modifiedBy int,
modifiedDate dateTime
);
---------------------------------------------

Insert into Article("title", "createdBy", "createdDate") values 
('Test Article 1', 100 , GETDATE()),
('Test Article-2', 101,GETDATE()),
('Test Article-3', 100,GETDATE());

-----------------------------------------------


--To enable cdc (database)---------------------
exec sys.sp_cdc_enable_db;

--Enable CDC (table) ---------------------------
EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name = N'Article',
@role_name = NULL,
@filegroup_name = NULL,
@supports_net_changes = 1

--------------------------------------------------