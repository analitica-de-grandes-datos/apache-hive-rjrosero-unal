/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS datos;

CREATE TABLE datos (letra STRING, fecha STRING, cantidad INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA INPATH "data.tsv" OVERWRITE INTO TABLE datos;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letra, COUNT(*) FROM datos GROUP BY letra ORDER BY letra;