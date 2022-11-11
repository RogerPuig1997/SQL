DROP SCHEMA IF EXISTS SQL10;
CREATE SCHEMA IF NOT EXISTS SQL10;
USE SQL10;

CREATE TABLE `salesman` (
	`SALESMAN_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `NAME` VARCHAR(30),
    `CITY` VARCHAR(15),
    `COMMISSION` DECIMAL(5,2),
    PRIMARY KEY (`SALESMAN_ID`)
);

CREATE TABLE `customer` (
	`CUSTOMER_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `CUST_NAME` VARCHAR(30),
    `CITY` VARCHAR(15),
    `GRADE` NUMERIC(3),
    PRIMARY KEY (`CUSTOMER_ID`)
);

CREATE TABLE `orders` (
	`ORD_NO` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `PURCH_AMT` DECIMAL(8,2),
    `ORD_DATE`DATE,
    `CUSTOMER_ID` INT UNSIGNED,
    `SALESMAN_ID` INT UNSIGNED,
    PRIMARY KEY (`ORD_NO`, `CUSTOMER_ID`, `SALESMAN_ID`),
		FOREIGN KEY (`CUSTOMER_ID`) REFERENCES customer(`CUSTOMER_ID`),
        FOREIGN KEY (`SALESMAN_ID`) REFERENCES salesman(`SALESMAN_ID`)
);

INSERT INTO salesman VALUES
	(NULL, 'David', 'Barcelona', '0.5'),
    (NULL, 'Ismael', 'Caceres', '0.2')
;
-- SELECT * FROM salesman;

INSERT INTO customer VALUES
	(NULL, 'Roger', 'Terrassa', '2'),
    (NULL, 'Miguel', 'Sabadell', '1'),
    (NULL, 'Ismael', 'Badalona', '3'),
    (NULL, 'Ruben', 'Badalona','1'),
    (NULL, 'David', 'Madrid', '2')
;
-- SELECT * FROM customer;

INSERT INTO orders VALUES
	(NULL, '4.50', '20221111', 1, 2),
    (NULL, '38.00', '20221111', 2, 1),
    (NULL, '12.50', '20221111', 3, 1),
    (NULL, '2.50', '20221111', 4, 2),
    (NULL, '49.95', '20221111', 5, 2)
;
-- SELECT * FROM orders;

SELECT COUNT(*) FROM orders;

SELECT DISTINCT CUST_NAME FROM customer;

SELECT SALESMAN_ID, SUM(PURCH_AMT) FROM orders GROUP BY SALESMAN_ID ORDER BY PURCH_AMT;

SELECT * FROM customer ORDER BY CUSTOMER_ID LIMIT 5;

SELECT MIN(PURCH_AMT), MAX(PURCH_AMT) FROM orders;