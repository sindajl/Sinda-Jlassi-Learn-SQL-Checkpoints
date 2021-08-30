CREATE TABLE wine(
    wine_number INT NOT NULL,
    wine_category VARCHAR(45),
    wine_year YEAR,
    wine_degree INT,
    PRIMARY KEY (wine_number)
);

CREATE TABLE producer(
    producer_number INT NOT NULL,
    producer_first_name VARCHAR(45),
    producer_last_name VARCHAR(45),
    producer_region VARCHAR(45),
    PRIMARY KEY (producer_number)
);


CREATE TABLE harvest(
    wine_number INT NOT NULL ,
    producer_number INT NOT NULL,
    harvest_quantity INT,
    CONSTRAINT PRIMARY KEY (wine_number,producer_number),
    CONSTRAINT FOREIGN KEY (wine_number) REFERENCES Customer (wine_number),
    CONSTRAINT FOREIGN KEY (producer_number) REFERENCES producer (producer_number)
);

SELECT 
  * 
FROM 
  `producer` p;


SELECT 
  * 
FROM 
  `producer` p
ORDER BY 
  p.producer_first_name;

SELECT 
  * 
FROM 
  `producer` p
WHERE 
  p.producer_region = "Sousse";

SELECT 
  h.wine_number AS WINE_NUMBER,
  SUM(h.harvest_quantity) AS TOTALQUANTITY
FROM 
  `harvest` AS h
WHERE 
  h.wine_number = 12;

SELECT
  (SELECT 
     w.wine_number 
   FROM 
     `wine` w 
   WHERE 
     w.wine_number = h.wine_number ) AS WINENUMBER,
  SUM(h.harvest_quantity) AS QUANTITY
FROM
  `harvest` h
GROUP BY
  WINENUMBER;

SELECT
  p.producer_first_name AS NAME_PRODUCER,
  p.producer_region AS REGION_PRODUCER,
  COUNT(h.wine_number) AS How_Much_Wine,
  SUM(h.harvest_quantity) AS TOTAL_QUANTITY_WINE
FROM
  `harvest` h
INNER JOIN
  `producer` p
ON
  h.producer_number = p.producer_number
  AND
  p.producer_region = "Sousse"
AND
  h.harvest_quantity > 300
GROUP BY
  NAME_PRODUCER ASC;


SELECT 
  h.producer_number  AS PRODUCER_NUMBER, 
  h.wine_number AS WINE_NUMBER, 
  w.wine_degree AS WINE_DEGREE 
FROM 
  `harvest` h 
INNER JOIN 
  `wine` w 
ON 
  h.wine_number = w.wine_number
AND
  w.wine_degree > 12 
AND 
  h.producer_number = 24 
ORDER BY
  WINE_NUMBER;