CREATE TABLE IF NOT EXISTS `login` (
    `employee_id` INT NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `created_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`employee_id`)
);
CREATE TABLE IF NOT EXISTS `leave_rules` (
    `leave_id` INT NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `number_of_leaves` FLOAT NOT NULL,
    `rule_expression` VARCHAR (2000),     
    PRIMARY KEY(`leave_id`)
);
CREATE TABLE IF NOT EXISTS `leave_stats`(
	`employee_id` INT NOT NULL,
	`leave_id` INT NOT NULL,
	`number_of_leaves` FLOAT NOT NULL,
	PRIMARY KEY (`employee_id`,`leave_id`),
	FOREIGN KEY (`leave_id`) REFERENCES leave_rules(`leave_id`)
);
CREATE TABLE IF NOT EXISTS `substitution` (
	`substitute_id` INT NOT NULL,
	`leave_id` INT NOT NULL,
	`date_of_approval` DATE NOT NULL,
	PRIMARY KEY (`substitute_id`,`leave_id`)
	FOREIGN KEY (`leave_id`) REFERENCES leave_rules(`leave_id`)
);
