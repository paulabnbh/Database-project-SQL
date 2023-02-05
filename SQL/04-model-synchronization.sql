-- MySQL Workbench Synchronization
-- Generated: 2023-02-05 13:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: paula

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `videoclub`.`actors` 
CHANGE COLUMN `actor_id` `actor_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `first_name` `first_name` VARCHAR(200) NOT NULL ,
CHANGE COLUMN `last_name` `last_name` VARCHAR(200) NOT NULL ,
CHANGE COLUMN `full_name` `full_name` VARCHAR(200) NOT NULL ,
ADD PRIMARY KEY (`actor_id`);
;

ALTER TABLE `videoclub`.`category` 
CHANGE COLUMN `category_id` `category_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `category` `category` VARCHAR(200) NOT NULL ,
ADD PRIMARY KEY (`category_id`);
;

ALTER TABLE `videoclub`.`film` 
CHANGE COLUMN `title` `title` VARCHAR(200) NOT NULL FIRST,
CHANGE COLUMN `release_year_x` `release_year_x` YEAR NOT NULL AFTER `title`,
CHANGE COLUMN `category_id` `category_id` BIGINT(20) NOT NULL AFTER `release_year_x`,
CHANGE COLUMN `film_id` `film_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `description` `description` VARCHAR(2000) NOT NULL ,
CHANGE COLUMN `language_id` `language_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `rental_duration` `rental_duration` BIGINT(20) NOT NULL ,
CHANGE COLUMN `rental_rate` `rental_rate` INT(11) NOT NULL ,
CHANGE COLUMN `length` `length` FLOAT(11) NOT NULL ,
CHANGE COLUMN `replacement_cost` `replacement_cost` FLOAT(11) NOT NULL ,
CHANGE COLUMN `rating` `rating` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `special_features` `special_features` VARCHAR(200) NOT NULL ,
ADD INDEX `fk_film_category1_idx` (`category_id` ASC) VISIBLE,
ADD INDEX `fk_film_language1_idx` (`language_id` ASC) VISIBLE,
ADD PRIMARY KEY (`film_id`);
;

ALTER TABLE `videoclub`.`film_actor` 
ADD INDEX `fk_film_actor_actors1_idx` (`actor_id` ASC) VISIBLE,
ADD INDEX `fk_film_actor_film1_idx` (`film_id` ASC) VISIBLE;
;

ALTER TABLE `videoclub`.`inventory` 
CHANGE COLUMN `inventory_id` `inventory_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `film_id` `film_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `store_id` `store_id` BIGINT(20) NOT NULL ,
ADD INDEX `fk_inventory_film1_idx` (`film_id` ASC) VISIBLE,
ADD PRIMARY KEY (`inventory_id`);
;

ALTER TABLE `videoclub`.`language` 
CHANGE COLUMN `language_id` `language_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `language` `language` VARCHAR(200) NOT NULL ,
ADD PRIMARY KEY (`language_id`);
;

ALTER TABLE `videoclub`.`rental` 
CHANGE COLUMN `rental_id` `rental_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `rental_date` `rental_date` DATE NOT NULL ,
CHANGE COLUMN `inventory_id` `inventory_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `customer_id` `customer_id` BIGINT(20) NOT NULL ,
CHANGE COLUMN `return_date` `return_date` DATE NOT NULL ,
CHANGE COLUMN `staff_id` `staff_id` BIGINT(20) NOT NULL ,
ADD INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE,
ADD PRIMARY KEY (`rental_id`);
;

ALTER TABLE `videoclub`.`film` 
ADD CONSTRAINT `fk_film_category1`
  FOREIGN KEY (`category_id`)
  REFERENCES `videoclub`.`category` (`category_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_film_language1`
  FOREIGN KEY (`language_id`)
  REFERENCES `videoclub`.`language` (`language_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `videoclub`.`film_actor` 
ADD CONSTRAINT `fk_film_actor_actors1`
  FOREIGN KEY (`actor_id`)
  REFERENCES `videoclub`.`actors` (`actor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_film_actor_film1`
  FOREIGN KEY (`film_id`)
  REFERENCES `videoclub`.`film` (`film_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `videoclub`.`inventory` 
ADD CONSTRAINT `fk_inventory_film1`
  FOREIGN KEY (`film_id`)
  REFERENCES `videoclub`.`film` (`film_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `videoclub`.`rental` 
ADD CONSTRAINT `fk_rental_inventory1`
  FOREIGN KEY (`inventory_id`)
  REFERENCES `videoclub`.`inventory` (`inventory_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
