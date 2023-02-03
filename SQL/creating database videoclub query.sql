-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8 ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`CATEGORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`CATEGORY` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`LANGUAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`LANGUAGE` (
  `language_id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(45) NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`FILM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`FILM` (
  `film_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(10000) NULL,
  `release_year` YEAR(4) NULL,
  `rental_duration` INT NULL,
  `rental_rate` INT NULL,
  `lenght` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(5) NULL,
  `special_features` VARCHAR(60) NULL,
  `CATEGORY_category_id` INT NOT NULL,
  `LANGUAGE_language_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `CATEGORY_category_id`, `LANGUAGE_language_id`),
  INDEX `fk_FILM_CATEGORY1_idx` (`CATEGORY_category_id` ASC) VISIBLE,
  INDEX `fk_FILM_LANGUAGE1_idx` (`LANGUAGE_language_id` ASC) VISIBLE,
  CONSTRAINT `fk_FILM_CATEGORY1`
    FOREIGN KEY (`CATEGORY_category_id`)
    REFERENCES `mydb`.`CATEGORY` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILM_LANGUAGE1`
    FOREIGN KEY (`LANGUAGE_language_id`)
    REFERENCES `mydb`.`LANGUAGE` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`ACTORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`ACTORS` (
  `actor_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`INVENTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`INVENTORY` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `store_id` INT NULL,
  `FILM_film_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `FILM_film_id`),
  INDEX `fk_INVENTORY_FILM1_idx` (`FILM_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_INVENTORY_FILM1`
    FOREIGN KEY (`FILM_film_id`)
    REFERENCES `mydb`.`FILM` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`RENTAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`RENTAL` (
  `rental_id` INT NOT NULL AUTO_INCREMENT,
  `rental_date` DATE NULL,
  `customer_id` INT NULL,
  `return_date` DATE NULL,
  `staff_id` INT NULL,
  `INVENTORY_inventory_id` INT NOT NULL,
  `INVENTORY_FILM_film_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `INVENTORY_inventory_id`, `INVENTORY_FILM_film_id`),
  INDEX `fk_RENTAL_INVENTORY1_idx` (`INVENTORY_inventory_id` ASC, `INVENTORY_FILM_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_RENTAL_INVENTORY1`
    FOREIGN KEY (`INVENTORY_inventory_id` , `INVENTORY_FILM_film_id`)
    REFERENCES `mydb`.`INVENTORY` (`inventory_id` , `FILM_film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`ACTORS_has_FILM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`ACTORS_has_FILM` (
  `ACTORS_actor_id` INT NOT NULL,
  `FILM_film_id` INT NOT NULL,
  PRIMARY KEY (`ACTORS_actor_id`, `FILM_film_id`),
  INDEX `fk_ACTORS_has_FILM_FILM1_idx` (`FILM_film_id` ASC) VISIBLE,
  INDEX `fk_ACTORS_has_FILM_ACTORS_idx` (`ACTORS_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_ACTORS_has_FILM_ACTORS`
    FOREIGN KEY (`ACTORS_actor_id`)
    REFERENCES `mydb`.`ACTORS` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACTORS_has_FILM_FILM1`
    FOREIGN KEY (`FILM_film_id`)
    REFERENCES `mydb`.`FILM` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
