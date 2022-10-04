CREATE SCHEMA `bdermaplus` ;

CREATE TABLE `bdermaplus`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `ramq_number` VARCHAR(14) NULL,
  `age` INT NULL,
  `gender` VARCHAR(10) NULL,
  `telephone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NULL,
  `status` VARCHAR(10) NOT NULL,
  `photo` VARCHAR(200) NULL,
  `is_vip` TINYINT(0) NULL,
  `is_deleted` TINYINT(0) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE,
  UNIQUE INDEX `ramq_number_UNIQUE` (`ramq_number` ASC) VISIBLE);


  CREATE TABLE `bdermaplus`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


  CREATE TABLE `bdermaplus`.`service` (
  `service_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `product_id` INT NULL,
  `name` VARCHAR(20) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `is_favorite` TINYINT(0) NULL,
  `service_price` DECIMAL NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE INDEX `service_id_UNIQUE` (`service_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `bdermaplus`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `category_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `bdermaplus`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `bdermaplus`.`appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `service_id` INT NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `is_confirmed` TINYINT(0) NOT NULL,
  `appointmentc_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `bdermaplus`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `service_id` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `is_favorite` TINYINT(0) NOT NULL,
  `product_price` DECIMAL NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `service_id_idx` (`service_id` ASC) VISIBLE,
  CONSTRAINT `service_id`
    FOREIGN KEY (`service_id`)
    REFERENCES `bdermaplus`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `bdermaplus`.`invoice` (
  `invoice_number` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `service_id` INT NULL,
  `product_id` INT NULL,
  `invoice_date` DATE NOT NULL,
  `description` LONGTEXT NULL,
  `total` DECIMAL NOT NULL,
  PRIMARY KEY (`invoice_number`));

ALTER TABLE `bdermaplus`.`appointment` 
ADD CONSTRAINT `app_serviceid`
  FOREIGN KEY (`service_id`)
  REFERENCES `bdermaplus`.`service` (`service_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `app_customerid`
  FOREIGN KEY (`customer_id`)
  REFERENCES `bdermaplus`.`customer` (`customer_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bdermaplus`.`invoice` 
ADD INDEX `inv_customerid_idx` (`customer_id` ASC) VISIBLE,
ADD INDEX `inv_serviceid_idx` (`service_id` ASC) VISIBLE,
ADD INDEX `inv_productid_idx` (`product_id` ASC) VISIBLE;
;
ALTER TABLE `bdermaplus`.`invoice` 
ADD CONSTRAINT `inv_customerid`
  FOREIGN KEY (`customer_id`)
  REFERENCES `bdermaplus`.`customer` (`customer_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `inv_serviceid`
  FOREIGN KEY (`service_id`)
  REFERENCES `bdermaplus`.`service` (`service_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `inv_productid`
  FOREIGN KEY (`product_id`)
  REFERENCES `bdermaplus`.`product` (`product_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--