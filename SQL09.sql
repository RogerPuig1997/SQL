DROP SCHEMA IF EXISTS SQL09;
CREATE SCHEMA IF NOT EXISTS SQL09;
USE SQL09;

CREATE TABLE `country` (
	`country_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(50),
    `last_update` TIMESTAMP,
    PRIMARY KEY (`country_id`)
);

CREATE TABLE `city` (
	`city_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `city` VARCHAR(50),
    `fk_country_id` SMALLINT UNSIGNED,    
    `last_update` TIMESTAMP,
    PRIMARY KEY (`city_id`),
    FOREIGN KEY (`fk_country_id`)
		REFERENCES SQL09.country(`country_id`)
);

CREATE TABLE `address` (
	`address_id` SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `address` VARCHAR(50),
    `address2` VARCHAR(50),
    `district` VARCHAR(20),
    `fk_city_id` SMALLINT UNSIGNED,
    `postal_code` VARCHAR(10),
    `phone` VARCHAR(20),
    `location` VARCHAR(20),
    `last_update` TIMESTAMP,
    FOREIGN KEY (fk_city_id)
		REFERENCES SQL09.city(city_id)
);

INSERT INTO country VALUES
	(NULL, 'Spain', '20221110135000'),
    (NULL, 'Italy', '20221110135000'),
    (NULL, 'Portugal', '20221110135000'),
    (NULL, 'Germany', '20221110135000'),
    (NULL, 'UK', '20221110135000')
;
-- SELECT * FROM country;

INSERT INTO city VALUES
	(NULL, 'Barcelona', 1, '20221110135000'),
    (NULL, 'Rome', 2, '20221110135000'),
    (NULL, 'Porto', 3, '20221110135000'),
    (NULL, 'Berlin', 4, '20221110135000'),
    (NULL, 'London', 5, '20221110135000')
;
-- SELECT * FROM city;

INSERT INTO address VALUES
	(NULL, 'Pl. Catalunya', '', 'centre', 1, '08001', '+34 930000000', 'Europe', '20221110135000'),
    (NULL, 'Colisseum', '', 'hist. zone', 2, '00144', '+39 060000000', 'Europe', '20221110135000'),
    (NULL, 'Harbour', '', 'com. zone', 3, '4000', '+35 1220000000', 'Europe', '20221110135000'),
    (NULL, 'Olympic St.', '', 'olympic', 4, '06023', '+49 300000000', 'Europe', '20221110135000'),
    (NULL, 'Big ben', '', 'river', 5, 'WC2', '+44 200000000', 'Europe', '20221110135000')
;
-- SELECT * FROM address;

SELECT * FROM country
	INNER JOIN city
    ON country.country_id = city.fk_country_id;
SELECT * FROM city
	INNER JOIN address
    ON city.city_id = address.fk_city_id;
