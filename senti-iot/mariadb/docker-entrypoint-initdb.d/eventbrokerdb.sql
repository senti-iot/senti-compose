# ************************************************************
# Sequel Ace SQL dump
# Version 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: rey.webhouse.net (MySQL 8.0.34-0ubuntu0.20.04.1)
# Database: sentievent
# Generation Time: 2023-10-17 11:18:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS sentievent DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci;

# Dump of table event
# ------------------------------------------------------------

CREATE TABLE `event` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `ruleUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `deviceUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '1',
  `state` tinyint NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '1999-12-31 23:59:59',
  `modified` datetime DEFAULT NULL,
  `lastAction` datetime DEFAULT NULL,
  `nextAction` datetime DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '1999-12-31 23:59:59',
  PRIMARY KEY (`id`),
  KEY `ruleDeviceStateIndex` (`ruleUUID`,`deviceUUID`,`state`),
  KEY `uuidIndex` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;



# Dump of table eventAction
# ------------------------------------------------------------

CREATE TABLE `eventAction` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `ruleUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `type` int unsigned NOT NULL,
  `config` json DEFAULT NULL,
  `state` tinyint NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuidIndex` (`uuid`),
  KEY `ruleIndex` (`ruleUUID`,`state`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;



# Dump of table eventNotification
# ------------------------------------------------------------

CREATE TABLE `eventNotification` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL DEFAULT '',
  `userUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL DEFAULT '',
  `deviceUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL DEFAULT '',
  `eventUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `dataTime` datetime NOT NULL,
  `message` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`),
  KEY `userUUID` (`userUUID`),
  KEY `deviceUUID` (`deviceUUID`),
  KEY `dataTime` (`dataTime`),
  KEY `userTime` (`userUUID`,`dataTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;



# Dump of table eventRule
# ------------------------------------------------------------

CREATE TABLE `eventRule` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `parentUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `condition` json DEFAULT NULL,
  `cloudFunction` int unsigned DEFAULT NULL COMMENT 'Change to UUID later',
  `config` json DEFAULT NULL,
  `deviceTypeUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `registryUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `deviceUUID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `deleted` tinyint unsigned NOT NULL DEFAULT '0',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuidIndex` (`uuid`),
  KEY `deviceTypeIndex` (`deviceTypeUUID`,`deleted`),
  KEY `registryIndex` (`registryUUID`,`deleted`),
  KEY `deviceIndex` (`deviceUUID`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;



# Dump of table smsGatewaySetting
# ------------------------------------------------------------

CREATE TABLE `smsGatewaySetting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `deleted` tinyint DEFAULT '0',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `config` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
