-- MySQL Script generated by MySQL Workbench
-- Vi 01 aug 2014 21:08:22 +0300
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(100) NOT NULL,
  `Last_Name` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(100) NOT NULL,
  `Added_time` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Modified_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Deleted_time` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Wallets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Wallets` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Wallets` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Added_time` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Modified_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Deleted_time` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Transactions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Transactions` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Time` TIME NULL,
  `Date` DATE NOT NULL,
  `User_ID` INT(11) NOT NULL,
  `Wallet_ID` INT(11) NOT NULL,
  `Ammount` DOUBLE NOT NULL,
  `Status` TINYINT(1) NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`ID`, `User_ID`, `Wallet_ID`),
  INDEX `User_ID` (`User_ID` ASC),
  INDEX `Wallet_ID` (`Wallet_ID` ASC),
  CONSTRAINT `Transactions_ibfk_1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `mydb`.`Users` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Transactions_ibfk_2`
    FOREIGN KEY (`Wallet_ID`)
    REFERENCES `mydb`.`Wallets` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Attachments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Attachments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Attachments` (
  `ID` INT NOT NULL,
  `Transactions_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`, `Transactions_ID`),
  INDEX `fk_Attachments_Transactions1_idx` (`Transactions_ID` ASC),
  CONSTRAINT `fk_Attachments_Transactions1`
    FOREIGN KEY (`Transactions_ID`)
    REFERENCES `mydb`.`Transactions` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`User_Wallet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User_Wallet` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User_Wallet` (
  `Users_ID` INT(11) NOT NULL,
  `Wallets_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Users_ID`, `Wallets_ID`),
  INDEX `fk_User_Wallet_relationship_Users1_idx` (`Users_ID` ASC),
  INDEX `fk_User_Wallet_relationship_Wallets1_idx` (`Wallets_ID` ASC),
  CONSTRAINT `fk_User_Wallet_relationship_Users1`
    FOREIGN KEY (`Users_ID`)
    REFERENCES `mydb`.`Users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Wallet_relationship_Wallets1`
    FOREIGN KEY (`Wallets_ID`)
    REFERENCES `mydb`.`Wallets` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Transaction_Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Transaction_Category` (
  `Transactions_ID` INT(11) NOT NULL,
  `Categories_ID` INT(11) NOT NULL,
  INDEX `fk_Transaction_Category_Transactions1_idx` (`Transactions_ID` ASC),
  INDEX `fk_Transaction_Category_Categories1_idx` (`Categories_ID` ASC),
  PRIMARY KEY (`Transactions_ID`, `Categories_ID`),
  CONSTRAINT `fk_Transaction_Category_Transactions1`
    FOREIGN KEY (`Transactions_ID`)
    REFERENCES `mydb`.`Transactions` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Category_Categories1`
    FOREIGN KEY (`Categories_ID`)
    REFERENCES `mydb`.`Categories` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Subcategories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Subcategories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Subcategories` (
  `ID` INT NOT NULL,
  `Categories_ID` INT(11) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Description` TEXT NULL,
  PRIMARY KEY (`ID`, `Categories_ID`),
  INDEX `fk_Subcategories_Categories1_idx` (`Categories_ID` ASC),
  CONSTRAINT `fk_Subcategories_Categories1`
    FOREIGN KEY (`Categories_ID`)
    REFERENCES `mydb`.`Categories` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;