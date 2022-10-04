
INSERT INTO `bdermaplus`.`customer` (`first_name`, `last_name`, `ramq_number`, `age`, `gender`, `telephone`, `email`, `address`, `status`, `is_vip`, `is_deleted`) VALUES ('soheyl', 'rahgozar', 'rahs81092220', '39', 'male', '5144520521', 'soheyl.rahgozar@mail.mcgill.ca', '', 'active', '1', '0');
INSERT INTO `bdermaplus`.`customer` (`first_name`, `last_name`, `ramq_number`, `age`, `gender`, `telephone`, `email`, `status`, `is_vip`, `is_deleted`) VALUES ('constantine', 'stamov', 'sta81091254', '39', 'male', '5144698512', 'konstantine.stamov@mail.mcgill.ca', 'active', '1', '0');
INSERT INTO `bdermaplus`.`customer` (`first_name`, `last_name`, `ramq_number`, `age`, `gender`, `telephone`, `email`, `status`, `is_vip`, `is_deleted`) VALUES ('akram', 'moussa', 'mou83641216', '37', 'male', '5144521875', 'akram.mousa@yahoo.com', 'inactive', '0', '1');
INSERT INTO `bdermaplus`.`customer` (`first_name`, `last_name`, `ramq_number`, `age`, `gender`, `telephone`, `email`, `status`, `is_vip`, `is_deleted`) VALUES ('mer', 'mercy', 'mer86451265', '34', 'female', '4386541298', 'mercy@gmail.com', 'pending', '0', '0');
INSERT INTO `bdermaplus`.`customer` (`first_name`, `last_name`, `ramq_number`, `age`, `gender`, `telephone`, `email`, `status`, `is_vip`, `is_deleted`) VALUES ('claudia', 'gonzales', 'gon86245126', '34', 'female', '514351247', 'clausi@yahoo.com', 'active', '1', '0');
INSERT INTO `bdermaplus`.`customer` (`first_name`, `last_name`, `ramq_number`, `age`, `gender`, `telephone`, `email`, `status`, `is_vip`, `is_deleted`) VALUES ('elisa', 'prof', 'prof6584512', '32', 'female', '438541265', 'elisa@mcgill.ca', 'active', '1', '0');

UPDATE `bdermaplus`.`customer` SET `address` = 'montreal' WHERE (`customer_id` = '1');
UPDATE `bdermaplus`.`customer` SET `address` = 'laval' WHERE (`customer_id` = '2');
UPDATE `bdermaplus`.`customer` SET `address` = 'montreal' WHERE (`customer_id` = '3');
UPDATE `bdermaplus`.`customer` SET `address` = 'toronto' WHERE (`customer_id` = '4');
UPDATE `bdermaplus`.`customer` SET `address` = 'toronto' WHERE (`customer_id` = '5');
UPDATE `bdermaplus`.`customer` SET `address` = 'vancouver' WHERE (`customer_id` = '6');

INSERT INTO `bdermaplus`.`category` (`name`, `description`) VALUES ('filler', 'nstantly smooth away wrinkles and folds');
INSERT INTO `bdermaplus`.`category` (`name`, `description`) VALUES ('skin resurfacing', 'resulting in younger-looking skin');
INSERT INTO `bdermaplus`.`category` (`name`, `description`) VALUES ('lip injection', 'Filler in the lower and upper part of the lip');
INSERT INTO `bdermaplus`.`category` (`name`, `description`) VALUES ('icon laser', 'erase all imperfections');

INSERT INTO `bdermaplus`.`service` (`customer_id`, `category_id`, `product_id`, `name`, `description`, `is_favorite`, `service_price`) VALUES ('2', '1', NULL, 'filler', 'Instantly smooth away wrinkles and folds', '0', '452.00');
INSERT INTO `bdermaplus`.`service` (`customer_id`, `category_id`, `product_id`, `name`, `description`, `is_favorite`, `service_price`) VALUES ('1', '2', NULL, 'advance ipl', 'resurfacing happened', '1', '175.00');
INSERT INTO `bdermaplus`.`service` (`customer_id`, `category_id`, `product_id`, `name`, `description`, `is_favorite`, `service_price`) VALUES ('2', '3', NULL, 'lip injection', 'upper lip injected', '1', '180.00');
INSERT INTO `bdermaplus`.`service` (`customer_id`, `category_id`, `product_id`, `name`, `description`, `is_favorite`, `service_price`) VALUES ('3', '1', NULL, 'filler', 'Instantly smooth away wrinkles and folds.', '0', '452.00');

UPDATE `bdermaplus`.`service` SET `product_id` = '1' WHERE (`service_id` = '3');
UPDATE `bdermaplus`.`service` SET `product_id` = '2' WHERE (`service_id` = '6');

INSERT INTO `bdermaplus`.`product` (`name`, `description`, `is_favorite`, `product_price`) VALUES ('cream', 'softer', '1', '249.99');
INSERT INTO `bdermaplus`.`product` (`name`, `description`, `is_favorite`, `product_price`) VALUES ('zink', 'anti scar', '0', '150.00');

INSERT INTO `bdermaplus`.`invoice` (`customer_id`, `service_id`, `product_id`, `invoice_date`, `total`) VALUES ('3', NULL, NULL, '2022-06-12', '1200.50');
INSERT INTO `bdermaplus`.`invoice` (`customer_id`, `service_id`, `product_id`, `invoice_date`, `description`, `total`) VALUES ('2', '3', '1', '2022-06-13', 'customer has an insurance and needs to have all the informatsion', '875.00');
INSERT INTO `bdermaplus`.`invoice` (`customer_id`, `service_id`, `invoice_date`, `total`) VALUES ('5', '4', '2022-06-15', '640.00');

INSERT INTO `bdermaplus`.`appointment` (`customer_id`, `service_id`, `status`, `is_confirmed`, `appointmentc_date`) VALUES ('1', '1', 'available', '1', '2023-01-18 15:10:10');
