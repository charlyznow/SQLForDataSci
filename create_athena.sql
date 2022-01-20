CREATE EXTERNAL TABLE IF NOT EXISTS alumnos.actividades (
 `Id_num` int,
 `Actividad` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ',',
 'field.delim' = ','
) LOCATION 's3://killers-jason.s3.us-east-1.amazonaws.com/alumnos/'
TBLPROPERTIES (
 'has_encrypted_data'='false',
 'skip.header.line.count'='1'
); 