CREATE EXTERNAL TABLE IF NOT EXISTS dbkingmonster.actividades (
 `Id_num` int,
 `Actividad` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ',',
 'field.delim' = ','
) LOCATION 's3://killers-jason/alumnos/'
TBLPROPERTIES (
 'has_encrypted_data'='false',
 'skip.header.line.count'='1'
); 




CREATE EXTERNAL TABLE IF NOT EXISTS dbkingmonster.ciudad (
 `Ciudad` string,
 `Pais` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ',',
 'field.delim' = ','
) LOCATION 's3://killers-jason/alumnos/ciudad/'
TBLPROPERTIES (
 'has_encrypted_data'='false',
 'skip.header.line.count'='1'
); 


CREATE EXTERNAL TABLE IF NOT EXISTS dbkingmonster.empleados (
 `Nombre` string,
 `Direccion` string,
 `Ciudad` string,
 `Telefono` string,
 `Supervisor` string
 )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ',',
 'field.delim' = ','
) LOCATION 's3://killers-jason/empleados/'
TBLPROPERTIES (
 'has_encrypted_data'='false',
 'skip.header.line.count'='1'
); 


select *
from dbkingmonster.empleados as emp
inner join dbkingmonster.empleados as sup
on emp.supervisor = sup.nombre
order by emp.nombre

select *
from alumnos.ciudad

select * from alumnos.datos_personales 


select a.id_num,
b.nombre,
a.actividad,
b.ciudad 
from alumnos.actividades as a
inner join alumnos.datos_personales as b
on a.id_num  = b.id_num 
inner join alumnos.ciudad as c 
on b.ciudad  = c.ciudad 



select a.id_num ,
a.nombre ,
b.actividad 
from alumnos.datos_personales as a
left join  alumnos.actividades as b
on a.id_num = b.id_num 


select a.id_num,
b.nombre ,
a.actividad 
from alumnos.actividades as a
left join  alumnos.datos_personales as b
on a.id_num = b.id_num 

select 
a.id_num as "id_datos",
b.id_num  as "id_actividades",
a.nombre,
b.actividad 
from alumnos.datos_personales as a
full join alumnos.actividades as b 
on a.id_num  = b.id_num 


select * from 
alumnos.actividades 
where id_num = 3

