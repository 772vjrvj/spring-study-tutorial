CREATE TABLE `oneqcustomer` (
	`Id` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`parentId` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`SiCode` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`GuCode` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`DongCode` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`StoreName` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`StoreSeq` INT(11) NULL DEFAULT NULL,
	`Customer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`Price` DECIMAL(6,2) NULL DEFAULT NULL,
	`RegDate` TIMESTAMP NULL DEFAULT NULL,
	`FinDate` TIMESTAMP NULL DEFAULT NULL,
	`RegID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`FinID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`Desc` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`etc` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`Id`) USING BTREE
)
COMMENT='oneq product 삼성sds 샘플용'
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;
