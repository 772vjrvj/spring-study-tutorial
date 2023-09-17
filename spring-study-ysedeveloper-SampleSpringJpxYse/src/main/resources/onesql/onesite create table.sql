CREATE TABLE `oneqsite` (
	`SiCode` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`SiName` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`SiSeq` INT(11) NULL DEFAULT NULL,
	`GuCode` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`GuName` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`GuSeq` INT(11) NULL DEFAULT NULL,
	`DongCode` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`DongName` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`DongSeq` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `oneqsite` (
  `SiCode` varchar(45) DEFAULT NULL,
  `SiName` varchar(45) DEFAULT NULL,
  `SiSeq` int(11) DEFAULT NULL,
  `GuCode` varchar(45) DEFAULT NULL,
  `GuName` varchar(45) DEFAULT NULL,
  `GuSeq` int(11) DEFAULT NULL,
  `DongCode` varchar(45) DEFAULT NULL,
  `DongName` varchar(45) DEFAULT NULL,
  `DongSeq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci