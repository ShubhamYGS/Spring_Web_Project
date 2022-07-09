CREATE TABLE IF NOT EXISTS `CONTACT_MSG` (
  `CONTACT_ID` INT AUTO_INCREMENT  PRIMARY KEY,
  `NAME` VARCHAR(100) NOT NULL,
  `EMAIL` VARCHAR(100) NOT NULL,
  `SUBJECT` VARCHAR(100) NOT NULL,
  `MESSAGE` VARCHAR(500) NOT NULL,
  `STATUS` VARCHAR(10) NOT NULL,
  `CREATED_AT` TIMESTAMP NOT NULL,
  `CREATED_BY` VARCHAR(50) NOT NULL,
  `UPDATED_AT` TIMESTAMP DEFAULT NULL,
  `UPDATED_BY` VARCHAR(50) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `HOLIDAYS` (
  `DAY` VARCHAR(20) NOT NULL,
  `REASON` VARCHAR(100) NOT NULL,
  `TYPE` VARCHAR(20) NOT NULL,
  `CREATED_AT` TIMESTAMP NOT NULL,
  `CREATED_BY` VARCHAR(50) NOT NULL,
  `UPDATED_AT` TIMESTAMP DEFAULT NULL,
  `UPDATED_BY` VARCHAR(50) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`role_id`)
);


CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `mobile_number` varchar(15) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`address_id`)
);

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  `role_id` int NOT NULL,
  `address_id` int NULL,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`person_id`),
   FOREIGN KEY (role_id) REFERENCES roles(role_id),
   FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE IF NOT EXISTS `career` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` int NOT NULL,
  `yourself` varchar(500),
  `college` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `cgpa` varchar(20) NOT NULL,
  `job_title` varchar(100),
  `company` varchar(100),
  `working` varchar(10),
  `pdf` BLOB,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`job_id`)
};