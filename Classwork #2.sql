--Classwork #2 Marriages and Divorces
 create table marriages(
    year int,
    marriages int,
    divorces int,
    pop bigint,
    marriagesx1000 float,
    divorcesx1000 float
);

\copy marriages from 'C:\Users\salmaelhassa\Desktop\us_marriages_divorces.csv' DELIMITER ',' CSV HEADER


select GREATEST(marriages) from marriages
where marriages is not NULL
order by marriages desc limit 10;


select marriagesx1000/divorcesx1000 from marriages; 


SELECT * FROM marriages)
WHERE
    marriages >= (time '1908.5' - interval '8.5 years')
AND
    marriages <= (time '1908.5' + interval '8.5 years');


