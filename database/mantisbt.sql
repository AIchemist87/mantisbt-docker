/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.0.2-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: bugtracker
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `mantis_api_token_table`
--

DROP TABLE IF EXISTS `mantis_api_token_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_api_token_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  `hash` varchar(128) NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT 1,
  `date_used` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_api_token_table`
--

LOCK TABLES `mantis_api_token_table` WRITE;
/*!40000 ALTER TABLE `mantis_api_token_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_api_token_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_file_table`
--

DROP TABLE IF EXISTS `mantis_bug_file_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bugnote_id` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_file_table`
--

LOCK TABLES `mantis_bug_file_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_file_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bug_file_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_history_table`
--

DROP TABLE IF EXISTS `mantis_bug_history_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `date_modified` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`),
  KEY `idx_bug_history_date_modified` (`date_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=3050 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_history_table`
--

LOCK TABLES `mantis_bug_history_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_history_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_bug_history_table` VALUES
(2867,1,733,'','','',1,1761601656),
(2868,1,733,'handler_id','0','3',0,1761601656),
(2869,1,734,'','','',1,1761601658),
(2870,1,735,'','','',1,1761601685),
(2871,1,735,'handler_id','0','32',0,1761601685),
(2872,1,736,'','','',1,1761601686),
(2873,1,736,'handler_id','0','6',0,1761601686),
(2874,1,737,'','','',1,1761601699),
(2875,1,737,'handler_id','0','2',0,1761601699),
(2876,1,738,'','','',1,1761601707),
(2877,1,738,'handler_id','0','4',0,1761601707),
(2878,1,739,'','','',1,1761601710),
(2879,1,739,'handler_id','0','6',0,1761601710),
(2880,1,740,'','','',1,1761601721),
(2881,1,740,'handler_id','0','2',0,1761601721),
(2882,1,741,'','','',1,1761601746),
(2883,1,741,'handler_id','0','2',0,1761601746),
(2884,1,742,'','','',1,1761601765),
(2885,1,742,'handler_id','0','6',0,1761601765),
(2886,1,743,'','','',1,1761601779),
(2887,1,743,'handler_id','0','6',0,1761601779),
(2888,1,744,'','','',1,1761601780),
(2889,1,744,'handler_id','0','2',0,1761601780),
(2890,1,745,'','','',1,1761601784),
(2891,1,746,'','','',1,1761601791),
(2892,1,746,'handler_id','0','4',0,1761601791),
(2893,1,747,'','','',1,1761601799),
(2894,1,747,'handler_id','0','6',0,1761601799),
(2895,1,748,'','','',1,1761601843),
(2896,1,748,'handler_id','0','32',0,1761601843),
(2897,1,749,'','','',1,1761601845),
(2898,1,749,'handler_id','0','6',0,1761601845),
(2899,1,750,'','','',1,1761601847),
(2900,1,750,'handler_id','0','6',0,1761601847),
(2901,1,751,'','','',1,1761601852),
(2902,1,751,'handler_id','0','6',0,1761601852),
(2903,1,752,'','','',1,1761601900),
(2904,1,752,'handler_id','0','3',0,1761601900),
(2905,1,753,'','','',1,1761601918),
(2906,1,753,'handler_id','0','6',0,1761601918),
(2907,1,754,'','','',1,1761601929),
(2908,1,754,'handler_id','0','3',0,1761601929),
(2909,1,755,'','','',1,1761601959),
(2910,1,755,'handler_id','0','4',0,1761601959),
(2911,1,756,'','','',1,1761601974),
(2912,1,757,'','','',1,1761601975),
(2913,1,757,'handler_id','0','32',0,1761601975),
(2914,1,758,'','','',1,1761601986),
(2915,1,758,'handler_id','0','3',0,1761601986),
(2916,1,759,'','','',1,1761602019),
(2917,1,759,'handler_id','0','4',0,1761602019),
(2918,1,760,'','','',1,1761602022),
(2919,1,760,'handler_id','0','3',0,1761602022),
(2920,1,761,'','','',1,1761602030),
(2921,1,761,'handler_id','0','4',0,1761602030),
(2922,1,762,'','','',1,1761602036),
(2923,1,762,'handler_id','0','2',0,1761602036),
(2924,1,763,'','','',1,1761602047),
(2925,1,763,'handler_id','0','2',0,1761602047),
(2926,1,764,'','','',1,1761602048),
(2927,1,764,'handler_id','0','3',0,1761602048),
(2928,1,765,'','','',1,1761602060),
(2929,1,765,'handler_id','0','6',0,1761602060),
(2930,1,766,'','','',1,1761602093),
(2931,1,766,'handler_id','0','6',0,1761602093),
(2932,1,767,'','','',1,1761602105),
(2933,1,768,'','','',1,1761602107),
(2934,1,768,'handler_id','0','6',0,1761602107),
(2935,1,769,'','','',1,1761602124),
(2936,1,769,'handler_id','0','2',0,1761602124),
(2937,1,770,'','','',1,1761602141),
(2938,1,770,'handler_id','0','2',0,1761602141),
(2939,1,771,'','','',1,1761602145),
(2940,1,771,'handler_id','0','2',0,1761602145),
(2941,1,772,'','','',1,1761602147),
(2942,1,773,'','','',1,1761602149),
(2943,1,773,'handler_id','0','32',0,1761602149),
(2944,1,774,'','','',1,1761602155),
(2945,1,774,'handler_id','0','4',0,1761602155),
(2946,1,775,'','','',1,1761602162),
(2947,1,775,'handler_id','0','6',0,1761602162),
(2948,1,776,'','','',1,1761602194),
(2949,1,776,'handler_id','0','4',0,1761602194),
(2950,1,777,'','','',1,1761602202),
(2951,1,777,'handler_id','0','32',0,1761602202),
(2952,1,778,'','','',1,1761602209),
(2953,1,778,'handler_id','0','6',0,1761602209),
(2954,1,779,'','','',1,1761602238),
(2955,1,779,'handler_id','0','4',0,1761602238),
(2956,1,780,'','','',1,1761602242),
(2957,1,780,'handler_id','0','6',0,1761602242),
(2958,1,781,'','','',1,1761602260),
(2959,1,781,'handler_id','0','6',0,1761602260),
(2960,1,782,'','','',1,1761602270),
(2961,1,783,'','','',1,1761602285),
(2962,1,783,'handler_id','0','6',0,1761602285),
(2963,1,784,'','','',1,1761602298),
(2964,1,784,'handler_id','0','4',0,1761602298),
(2965,1,785,'','','',1,1761602313),
(2966,1,786,'','','',1,1761602323),
(2967,1,786,'handler_id','0','6',0,1761602323),
(2968,1,787,'','','',1,1761602327),
(2969,1,787,'handler_id','0','6',0,1761602327),
(2970,1,788,'','','',1,1761602335),
(2971,1,788,'handler_id','0','2',0,1761602335),
(2972,1,789,'','','',1,1761602345),
(2973,1,789,'handler_id','0','32',0,1761602345),
(2974,1,790,'','','',1,1761602352),
(2975,1,790,'handler_id','0','2',0,1761602352),
(2976,1,791,'','','',1,1761602368),
(2977,1,791,'handler_id','0','6',0,1761602368),
(2978,1,792,'','','',1,1761602369),
(2979,1,792,'handler_id','0','6',0,1761602369),
(2980,1,793,'','','',1,1761602374),
(2981,1,793,'handler_id','0','4',0,1761602374),
(2982,1,794,'','','',1,1761602390),
(2983,1,795,'','','',1,1761602391),
(2984,1,795,'handler_id','0','4',0,1761602391),
(2985,1,796,'','','',1,1761602395),
(2986,1,796,'handler_id','0','6',0,1761602395),
(2987,1,797,'','','',1,1761602405),
(2988,1,797,'handler_id','0','6',0,1761602405),
(2989,1,798,'','','',1,1761602408),
(2990,1,798,'handler_id','0','6',0,1761602408),
(2991,1,799,'','','',1,1761602428),
(2992,1,799,'handler_id','0','3',0,1761602428),
(2993,1,800,'','','',1,1761602439),
(2994,1,800,'handler_id','0','6',0,1761602439),
(2995,1,801,'','','',1,1761602454),
(2996,1,801,'handler_id','0','3',0,1761602454),
(2997,1,802,'','','',1,1761602458),
(2998,1,802,'handler_id','0','6',0,1761602458),
(2999,1,803,'','','',1,1761602461),
(3000,1,804,'','','',1,1761602486),
(3001,1,804,'handler_id','0','6',0,1761602486),
(3002,1,805,'','','',1,1761602512),
(3003,1,806,'','','',1,1761602523),
(3004,1,806,'handler_id','0','26',0,1761602523),
(3005,1,807,'','','',1,1761602550),
(3006,1,807,'handler_id','0','2',0,1761602550),
(3007,1,808,'','','',1,1761602554),
(3008,1,808,'handler_id','0','3',0,1761602554),
(3009,1,809,'','','',1,1761602558),
(3010,1,809,'handler_id','0','6',0,1761602558),
(3011,1,810,'','','',1,1761602595),
(3012,1,810,'handler_id','0','3',0,1761602595),
(3013,1,811,'','','',1,1761602608),
(3014,1,811,'handler_id','0','6',0,1761602608),
(3015,1,812,'','','',1,1761602609),
(3016,1,813,'','','',1,1761602610),
(3017,1,813,'handler_id','0','2',0,1761602610),
(3018,1,814,'','','',1,1761602613),
(3019,1,814,'handler_id','0','6',0,1761602613),
(3020,1,815,'','','',1,1761602629),
(3021,1,815,'handler_id','0','6',0,1761602629),
(3022,1,816,'','','',1,1761602632),
(3023,1,817,'','','',1,1761602667),
(3024,1,818,'','','',1,1761602680),
(3025,1,819,'','','',1,1761602688),
(3026,1,819,'handler_id','0','6',0,1761602688),
(3027,1,820,'','','',1,1761602729),
(3028,1,820,'handler_id','0','3',0,1761602729),
(3029,1,821,'','','',1,1761602737),
(3030,1,821,'handler_id','0','6',0,1761602737),
(3031,1,822,'','','',1,1761602739),
(3032,1,822,'handler_id','0','2',0,1761602739),
(3033,1,823,'','','',1,1761602757),
(3034,1,823,'handler_id','0','32',0,1761602757),
(3035,1,824,'','','',1,1761602760),
(3036,1,824,'handler_id','0','2',0,1761602760),
(3037,1,825,'','','',1,1761602762),
(3038,1,825,'handler_id','0','2',0,1761602762),
(3039,1,826,'','','',1,1761602786),
(3040,1,827,'','','',1,1761602791),
(3041,1,827,'handler_id','0','32',0,1761602791),
(3042,1,828,'','','',1,1761602796),
(3043,1,828,'handler_id','0','2',0,1761602796),
(3044,1,829,'','','',1,1761602797),
(3045,1,829,'handler_id','0','6',0,1761602797),
(3046,1,830,'','','',1,1761602825),
(3047,1,831,'','','',1,1761602845),
(3048,1,831,'handler_id','0','6',0,1761602845),
(3049,1,832,'','','',1,1761602871);
/*!40000 ALTER TABLE `mantis_bug_history_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_monitor_table`
--

DROP TABLE IF EXISTS `mantis_bug_monitor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`bug_id`),
  KEY `idx_bug_id` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_monitor_table`
--

LOCK TABLES `mantis_bug_monitor_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_monitor_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bug_monitor_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_relationship_table`
--

DROP TABLE IF EXISTS `mantis_bug_relationship_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `relationship_type` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_relationship_table`
--

LOCK TABLES `mantis_bug_relationship_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_relationship_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bug_relationship_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_revision_table`
--

DROP TABLE IF EXISTS `mantis_bug_revision_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_revision_table`
--

LOCK TABLES `mantis_bug_revision_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_revision_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bug_revision_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_table`
--

DROP TABLE IF EXISTS `mantis_bug_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0,
  `handler_id` int(10) unsigned NOT NULL DEFAULT 0,
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT 0,
  `priority` smallint(6) NOT NULL DEFAULT 30,
  `severity` smallint(6) NOT NULL DEFAULT 50,
  `reproducibility` smallint(6) NOT NULL DEFAULT 10,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `resolution` smallint(6) NOT NULL DEFAULT 10,
  `projection` smallint(6) NOT NULL DEFAULT 10,
  `eta` smallint(6) NOT NULL DEFAULT 10,
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT 0,
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT 0,
  `sticky` tinyint(4) NOT NULL DEFAULT 0,
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT 1,
  `date_submitted` int(10) unsigned NOT NULL DEFAULT 1,
  `due_date` int(10) unsigned NOT NULL DEFAULT 1,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_table`
--

LOCK TABLES `mantis_bug_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_bug_table` VALUES
(733,1,3,3,0,30,10,70,90,20,10,10,733,'','','','','','',0,10,'Redesign Dropzone file previews',0,0,'',1,1761601656,1,1761601656),
(734,1,3,0,0,30,60,70,10,10,10,10,734,'','','','','','',0,10,'Error with user_get_accessible_projects & private_project_threshold',0,0,'',1,1761601658,1,1761601658),
(735,1,32,32,0,30,50,70,90,40,10,10,735,'','','','','','',0,10,'NPE in MantisCache.registerAdditionalReporter',0,0,'',1,1761601685,1,1761601685),
(736,1,6,6,0,30,50,70,90,20,10,10,736,'','','','','','',0,10,'Data integrity: ensure users\' default_project preference is a valid project',0,0,'',1,1761601686,1,1761601686),
(737,1,2,2,0,30,50,70,90,20,10,10,737,'','','','','','',0,10,'Extra quotation mark in custom field checkboxes',0,0,'',1,1761601699,1,1761601699),
(738,1,10,4,0,30,60,10,90,60,10,10,738,'','','','','','',0,10,'Reporter list is loading way too long',0,0,'',1,1761601707,1,1761601707),
(739,1,6,6,0,30,30,10,90,20,10,10,739,'','','','','','',0,10,'In Workflow Transitions page, the Delete button\'s label is truncated at 1st word',0,0,'',1,1761601710,1,1761601710),
(740,1,2,2,0,30,50,70,50,10,10,10,740,'','','','','','',0,10,'mc_user_pref_get_pref() doesn\'t handle the case where project id doesn\'t exist',0,0,'',1,1761601721,1,1761601721),
(741,1,4,2,0,30,80,10,90,20,10,10,741,'','','','','','',0,10,'Login page broken',0,0,'',1,1761601746,1,1761601746),
(742,1,6,6,0,30,50,70,90,20,10,10,742,'','','','','','',0,10,'MantisGraph: redundant subtitle on Issue Trends page',0,0,'',1,1761601765,1,1761601765),
(743,1,6,6,0,30,50,10,90,20,10,10,743,'','','','','','',0,10,'CVE-2014-8986: adm_config_report.php filtering does not check config option is valid',0,0,'',1,1761601779,1,1761601779),
(744,1,2,2,0,30,10,100,50,10,10,10,744,'','','','','','',0,10,'Provide access details for attachments in REST API',0,0,'',1,1761601780,1,1761601780),
(745,1,4,0,0,30,50,10,10,10,10,10,745,'','','','','','',0,10,'Required standard fields are not marked as required when updating issues',0,0,'',1,1761601784,1,1761601784),
(746,1,4,4,0,30,50,100,90,20,10,10,746,'','','','','','',0,10,'Performance enhancements of string processing',0,0,'',1,1761601791,1,1761601791),
(747,1,34,6,0,40,60,10,90,70,10,10,747,'','','','','','',0,10,'Allowed memory size',0,0,'',1,1761601799,1,1761601799),
(748,1,32,32,0,30,10,70,90,20,10,10,748,'','','','','','',0,10,'Move forums to mantisbt.org',0,0,'',1,1761601843,1,1761601843),
(749,1,6,6,0,40,60,70,90,20,10,10,749,'','','','','','',0,10,'Update ADOdb to 5.20',0,0,'',1,1761601845,1,1761601845),
(750,1,6,6,0,30,50,30,90,20,10,10,750,'','','','','','',0,10,'TravisCI docbook broken',0,0,'',1,1761601847,1,1761601847),
(751,1,6,6,0,30,40,10,90,20,10,10,751,'','','','','','',0,10,'Admin page bracketed submenus should use existing CSS for display',0,0,'',1,1761601852,1,1761601852),
(752,1,4,3,0,30,50,10,90,20,10,10,752,'','','','','','',0,10,'Recently Modified box on View Issues page does not display closed issues',0,0,'',1,1761601900,1,1761601900),
(753,1,4,6,0,30,50,70,90,20,10,10,753,'','','','','','',0,10,'Double fetch of same database column',0,0,'',1,1761601918,1,1761601918),
(754,1,3,3,0,30,50,70,90,20,10,10,754,'','','','','','',0,10,'Error when limit_reporters and complex report_bug_threshold',0,0,'',1,1761601929,1,1761601929),
(755,1,26,4,0,30,50,100,90,70,10,10,755,'','','','','','',0,10,'Make functions in adm_config_set available to plugins',0,0,'',1,1761601959,1,1761601959),
(756,1,3,0,0,30,60,70,30,10,10,10,756,'','','','','','',0,10,'Some tables gets off screen and cant be scrolled conveniently',0,0,'',1,1761601974,1,1761601974),
(757,1,32,32,0,30,10,70,90,20,10,10,757,'','','','','','',0,10,'Related Tasks',0,0,'',1,1761601975,1,1761601975),
(758,1,2,3,0,30,50,70,90,20,10,10,758,'','','','','','',0,10,'Take care of released/obsolete flag when accessing version_cache_array_rows() cache',0,0,'',1,1761601986,1,1761601986),
(759,1,15,4,0,30,50,70,90,70,10,10,759,'','','','','','',0,10,'User hijacking my BT',0,0,'',1,1761602019,1,1761602019),
(760,1,3,3,0,30,50,70,90,20,10,10,760,'','','','','','',0,10,'Undefined offset warining in summary page',0,0,'',1,1761602022,1,1761602022),
(761,1,4,4,0,30,10,100,90,20,10,10,761,'','','','','','',0,10,'Add failed_login_count to user information',0,0,'',1,1761602030,1,1761602030),
(762,1,2,2,0,30,60,70,90,20,10,10,762,'','','','','','',0,10,'Anonymous access is broken',0,0,'',1,1761602036,1,1761602036),
(763,1,2,2,0,30,50,70,90,20,10,10,763,'','','','','','',0,10,'Added users should have valid email addresses, random password, and disabled',0,0,'',1,1761602047,1,1761602047),
(764,1,3,3,0,30,50,70,90,20,10,10,764,'','','','','','',0,10,'Related tags are not showed correctly',0,0,'',1,1761602048,1,1761602048),
(765,1,6,6,0,30,60,10,90,20,10,10,765,'','','','','','',0,10,'print_form_button() generates bad security token name for plugin action page',0,0,'',1,1761602060,1,1761602060),
(766,1,6,6,0,30,50,100,90,20,10,10,766,'','','','','','',0,10,'Update PHPMailer to 6.8.0',0,0,'',1,1761602093,1,1761602093),
(767,1,32,0,0,30,10,70,90,50,10,10,767,'','','','','','',0,10,'Several UI requests',0,0,'',1,1761602105,1,1761602105),
(768,1,6,6,0,20,40,10,50,10,10,10,768,'','','','','','',0,10,'Improve date filter fields display (label and \"no filter\" text)',0,0,'',1,1761602107,1,1761602107),
(769,1,2,2,0,30,10,100,90,20,10,10,769,'','','','','','',0,10,'Leverage `If-Match` when updating issues',0,0,'',1,1761602124,1,1761602124),
(770,1,4,2,0,40,60,10,90,20,10,10,770,'','','','','','',0,10,'Custom fields of type Email are not properly displayed',0,0,'',1,1761602141,1,1761602141),
(771,1,2,2,0,30,10,100,90,20,10,10,771,'','','','','','',0,10,'Support adding relationships via REST API',0,0,'',1,1761602145,1,1761602145),
(772,1,3,0,0,30,60,10,10,10,10,10,772,'','','','','','',0,10,'auth_reauthenticate() breaks form submission',0,0,'',1,1761602147,1,1761602147),
(773,1,32,32,0,30,10,100,90,20,10,10,773,'','','','','','',0,10,'Use the html composer for the description field',0,0,'',1,1761602149,1,1761602149),
(774,1,4,4,0,30,60,10,90,20,10,10,774,'','','','','','',0,10,'Parts of manage_user_page broken',0,0,'',1,1761602155,1,1761602155),
(775,1,6,6,0,30,50,70,90,20,10,10,775,'','','','','','',0,10,'E_USER_DEPRECATED is not detected if error_reporting=0',0,0,'',1,1761602162,1,1761602162),
(776,1,3,4,0,20,50,10,90,90,10,10,776,'','','','','','',0,10,'status legend does not reflect all bugs showed when including subprojects or all projects',0,0,'',1,1761602194,1,1761602194),
(777,1,32,32,0,30,50,10,90,40,10,10,777,'','','','','','',0,10,'Task Syncronization Failed - No Priority with id 0',0,0,'',1,1761602202,1,1761602202),
(778,1,6,6,0,20,40,100,90,20,10,10,778,'','','','','','',0,10,'Defining new constants to replace hardcoded strings',0,0,'',1,1761602209,1,1761602209),
(779,1,4,4,0,30,50,10,90,20,10,10,779,'','','','','','',0,10,'SQL syntax error on manage_user_page',0,0,'',1,1761602238,1,1761602238),
(780,1,6,6,0,30,50,100,90,20,10,10,780,'','','','','','',0,10,'Update PHPMailer to 6.3.0',0,0,'',1,1761602242,1,1761602242),
(781,1,6,6,0,30,50,10,90,20,10,10,781,'','','','','','',0,10,'Javascript error in View Issues page',0,0,'',1,1761602260,1,1761602260),
(782,1,10,0,0,30,50,10,10,10,10,10,782,'','','','','','',0,10,'Wrong attachments handling',0,0,'',1,1761602270,1,1761602270),
(783,1,6,6,0,30,10,100,90,20,10,10,783,'','','','','','',0,10,'New build script to download updated font files',0,0,'',1,1761602285,1,1761602285),
(784,1,4,4,0,30,50,70,90,20,10,10,784,'','','','','','',0,10,'Obsolete icon_path configuration',0,0,'',1,1761602298,1,1761602298),
(785,1,3,0,0,30,50,10,10,10,10,10,785,'','','','','','',0,10,'Attachment column doesnt show correctly for \"allow_view_own_attachments\"',0,0,'',1,1761602313,1,1761602313),
(786,1,6,6,0,30,50,10,90,20,10,10,786,'','','','','','',0,10,'When adding multiple relationships, ignore source issue and empty issue ids',0,0,'',1,1761602323,1,1761602323),
(787,1,3,6,0,50,80,70,90,20,10,10,787,'','','','','','',0,10,'Redefine plugin version requirements',0,0,'',1,1761602327,1,1761602327),
(788,1,4,2,0,30,50,10,90,90,10,10,788,'','','','','','',0,10,'\"Change Payment Status\" does not work',0,0,'',1,1761602335,1,1761602335),
(789,1,32,32,0,30,60,10,90,20,10,10,789,'','','','','','',0,10,'Task key no longer shown for Mylyn 3.21 or newer',0,0,'',1,1761602345,1,1761602345),
(790,1,2,2,0,30,50,100,90,20,10,10,790,'','','','','','',0,10,'Implement `IssueNoteDeleteCommand` for deleting notes',0,0,'',1,1761602352,1,1761602352),
(791,1,6,6,0,30,50,100,90,20,10,10,791,'','','','','','',0,10,'Add no-op upgrade step in plugin_upgrade()',0,0,'',1,1761602368,1,1761602368),
(792,1,6,6,0,30,50,70,90,20,10,10,792,'','','','','','',0,10,'Update ez/Zeta Components to latest version',0,0,'',1,1761602369,1,1761602369),
(793,1,4,4,0,30,50,70,90,20,10,10,793,'','','','','','',0,10,'Wrong documentation of bug_reopen_resolution and bug_duplicate_resolution in Admin Guide',0,0,'',1,1761602374,1,1761602374),
(794,1,6,0,0,30,60,100,10,10,10,10,794,'','','','','','',0,10,'Provide the full BugnoteData structure EVENT_BUGNOTE_DATA',0,0,'',1,1761602390,1,1761602390),
(795,1,32,4,0,30,50,70,90,60,10,10,795,'','','','','','',0,10,'Allow administrators to customize X-Frame-Options header',0,0,'',1,1761602391,1,1761602391),
(796,1,15,6,0,30,50,50,90,50,10,10,796,'','','','','','',0,10,'APPLICATION ERROR #2800',0,0,'',1,1761602395,1,1761602395),
(797,1,2,6,0,30,50,10,90,20,10,10,797,'','','','','','',0,10,'Issues with emoji\'s are truncated before getting saved',0,0,'',1,1761602405,1,1761602405),
(798,1,6,6,0,30,50,10,90,20,10,10,798,'','','','','','',0,10,'Error 1704 assigning a sponsored after sponsorship has been turned off',0,0,'',1,1761602408,1,1761602408),
(799,1,3,3,0,30,10,70,90,20,10,10,799,'','','','','','',0,10,'show caller trace in file log',0,0,'',1,1761602428,1,1761602428),
(800,1,10,6,0,30,50,10,50,10,10,10,800,'','','','','','',0,10,'Wrong anonymous rights application',0,0,'',1,1761602439,1,1761602439),
(801,1,3,3,0,30,50,70,90,20,10,10,801,'','','','','','',0,10,'buttons without separation',0,0,'',1,1761602454,1,1761602454),
(802,1,6,6,0,40,80,10,90,20,10,10,802,'','','','','','',0,10,'config_get_global() returns default value for global variables overriden in config_inc.php',0,0,'',1,1761602458,1,1761602458),
(803,1,3,0,0,30,10,100,10,10,10,10,803,'','','','','','',0,10,'Implement a formal page structure',0,0,'',1,1761602461,1,1761602461),
(804,1,2,6,0,40,60,10,50,30,10,10,804,'','','','','','',0,10,'Implement upgrade step to cleanup corrupt disk attachments after db->disk conversion',0,0,'',1,1761602486,1,1761602486),
(805,1,3,0,0,30,50,70,10,10,10,10,805,'','','','','','',0,10,'workflow threshold manage page, missing options',0,0,'',1,1761602512,1,1761602512),
(806,1,26,26,0,30,10,100,80,20,10,10,806,'','','','','','',0,10,'Ignoring out-of-office emails (or other useless emails)',0,0,'',1,1761602523,1,1761602523),
(807,1,2,2,0,30,10,100,90,20,10,10,807,'','','','','','',0,10,'Update disposable-email-checker to v3.0.1 using Composer',0,0,'',1,1761602550,1,1761602550),
(808,1,3,3,0,30,50,70,80,20,10,10,808,'','','','','','',0,10,'db query calls use deprecated db_query_bound',0,0,'',1,1761602554,1,1761602554),
(809,1,6,6,0,60,70,10,90,20,10,10,809,'','','','','','',0,10,'Broken installer following removal of legacy db_prepare_int calls',0,0,'',1,1761602558,1,1761602558),
(810,1,2,3,0,30,50,10,90,20,10,10,810,'','','','','','',0,10,'Regression in custom field sorting',0,0,'',1,1761602595,1,1761602595),
(811,1,4,6,0,30,50,10,90,20,10,10,811,'','','','','','',0,10,'Wrong label for update button on bug_update_page.php',0,0,'',1,1761602608,1,1761602608),
(812,1,2,0,0,30,50,70,10,10,10,10,812,'','','','','','',0,10,'Upgrade unattended should upgrade plugins as well',0,0,'',1,1761602609,1,1761602609),
(813,1,2,2,0,30,10,100,90,20,10,10,813,'','','','','','',0,10,'Add REST API to detach a tag',0,0,'',1,1761602610,1,1761602610),
(814,1,6,6,0,30,30,100,90,20,10,10,814,'','','','','','',0,10,'Update ERD diagram to reflect recent changes',0,0,'',1,1761602613,1,1761602613),
(815,1,6,6,0,60,60,70,90,20,10,10,815,'','','','','','',0,10,'CVE-2014-1608: soap:Envelope SQL injection attack',0,0,'',1,1761602629,1,1761602629),
(816,1,3,0,0,30,60,70,10,10,10,10,816,'','','','','','',0,10,'Forms and tables are not fitted to viewport sizes, eg: mobile browsers',0,0,'',1,1761602632,1,1761602632),
(817,1,2,0,0,30,50,10,10,10,10,10,817,'','','','','','',0,10,'Corrupt Excel file when `notes` field is included and is too long',0,0,'',1,1761602667,1,1761602667),
(818,1,3,0,0,20,50,70,30,10,10,10,818,'','','','','','',0,10,'user last name to be stored in user table field',0,0,'',1,1761602680,1,1761602680),
(819,1,6,6,0,60,80,10,90,20,10,10,819,'','','','','','',0,10,'CVE-2017-7615: Account verification page allows resetting any user\'s password',0,0,'',1,1761602688,1,1761602688),
(820,1,3,3,0,30,50,70,90,20,10,10,820,'','','','','','',0,10,'plugin filter fields dont work with dynamic input',0,0,'',1,1761602729,1,1761602729),
(821,1,6,6,0,30,50,70,90,20,10,10,821,'','','','','','',0,10,'Adding issue via REST API should fail if requested tags can\'t be attached',0,0,'',1,1761602737,1,1761602737),
(822,1,2,2,0,30,50,100,90,20,10,10,822,'','','','','','',0,10,'Update PhpUnit from 4.8.35 to 4.8.36',0,0,'',1,1761602739,1,1761602739),
(823,1,32,32,0,30,10,10,90,20,10,10,823,'','','','','','',0,10,'Enable new subtask action',0,0,'',1,1761602757,1,1761602757),
(824,1,2,2,0,30,50,10,90,70,10,10,824,'','','','','','',0,10,'Custom field names are case sensitive',0,0,'',1,1761602760,1,1761602760),
(825,1,2,2,0,30,50,70,90,20,10,10,825,'','','','','','',0,10,'Support notes as a column in View Issues, Print Issues, CSV and Excel',0,0,'',1,1761602762,1,1761602762),
(826,1,3,0,0,20,50,10,10,10,10,10,826,'','','','','','',0,10,'print_button with security token does not work for plugin pages',0,0,'',1,1761602786,1,1761602786),
(827,1,4,32,0,40,60,10,90,20,10,10,827,'','','','','','',0,10,'Date filters broken since 1.2.12',0,0,'',1,1761602791,1,1761602791),
(828,1,2,2,0,30,50,100,50,10,10,10,828,'','','','','','',0,10,'REST API documentation not discoverable via https://explore.postman.com/',0,0,'',1,1761602796,1,1761602796),
(829,1,4,6,0,30,50,70,90,20,10,10,829,'','','','','','',0,10,'Prevent loading of jQuery related plugins',0,0,'',1,1761602797,1,1761602797),
(830,1,3,0,0,30,50,10,10,10,10,10,830,'','','','','','',0,10,'Error setting user name the same as other user\'s real name',0,0,'',1,1761602825,1,1761602825),
(831,1,6,6,0,30,40,10,90,20,10,10,831,'','','','','','',0,10,'config_flush_cache() doesn\'t properly clean the cache',0,0,'',1,1761602845,1,1761602845),
(832,1,6,0,0,30,50,10,10,10,10,10,832,'','','','','','',0,10,'Custom status colors not working when displaying issues from another project',0,0,'',1,1761602871,1,1761602871);
/*!40000 ALTER TABLE `mantis_bug_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_tag_table`
--

DROP TABLE IF EXISTS `mantis_bug_tag_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_attached` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_tag_table`
--

LOCK TABLES `mantis_bug_tag_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_tag_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bug_tag_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bug_text_table`
--

DROP TABLE IF EXISTS `mantis_bug_text_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_text_table`
--

LOCK TABLES `mantis_bug_text_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_text_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_bug_text_table` VALUES
(733,'Previous design was not very functional:\r\n- Did not properly support image thumbnails.\r\n- Fixed width makes the filename to get truncated\r\n- A permanent grey square that serves no purpose\r\n\r\nRedefine some markup and options to improve some of those:\r\n- Set scaling as method for image thumbnail, instead of cropping.\r\n- Fix image rendering for thumbnails.\r\n- Allow flexible width and height of the preview container. This way\r\n  filenames are fully shown.','',''),
(734,'function \"user_get_accessible_projects\" seems to evaluate configuration option \"private_project_threshold\" only for current project.\r\n\r\nThis have some effects like, for example on the project selector option list:\r\nhaving, for all projects:\r\nprivate_project_threshold = 90\r\nand, for private project \"A\":\r\nprivate_project_threshold = array( 70 );\r\n\r\n1) Being a manager (70), in current project ALL_PROJECTS, the project list does not show project \"A\"\r\n\r\n2) Being an adminsitrator (90), in current project ALL_PROJECTS, the project list shows project A. If i enter in project A, the project list now only show public projects...\r\n\r\n\r\n\r\n','',''),
(735,'<pre>java.lang.NullPointerException\nat com.itsolut.mantis.core.MantisCache.registerAdditionalReporter(MantisCache.java:805)\nat com.itsolut.mantis.core.MantisClient.registerAdditionalReporters(MantisClient.java:118)\nat com.itsolut.mantis.core.MantisClient.getTicket(MantisClient.java:106)\nat com.itsolut.mantis.core.MantisTaskDataHandler.getTaskData(MantisTaskDataHandler.java:326)\nat com.itsolut.mantis.core.MantisRepositoryConnector.getTaskData(MantisRepositoryConnector.java:309)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeTasksJob.synchronizeTask(SynchronizeTasksJob.java:237)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeTasksJob.runInternal(SynchronizeTasksJob.java:210)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeTasksJob.run(SynchronizeTasksJob.java:152)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeTasksJob.run(SynchronizeTasksJob.java:134)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeQueriesJob.run(SynchronizeQueriesJob.java:225)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeRepositoriesJob.updateQueries(SynchronizeRepositoriesJob.java:179)\nat org.eclipse.mylyn.internal.tasks.core.sync.SynchronizeRepositoriesJob.run(SynchronizeRepositoriesJob.java:137)\nat org.eclipse.core.internal.jobs.Worker.run(Worker.java:55)\n</pre>','',''),
(736,'Currently, it is possible for a user\'s default project setting (user_pref_table.default_project) to contain an invalid project id. \r\n\r\nThis can happen when the user is removed from the list of allowed users on a private project, or when a project  becomes private or is deleted.\r\n\r\nWhile this does not have direct consequences in the MantisBT UI because it transparently copes with it, in terms of data integrity this should not happen.\r\n','',''),
(737,'The checkboxes have an extra quotation mark next to them.','',''),
(738,'Reporter list in filter is loading for a very long time if there are a lot of registered users.','',''),
(739,'The button reads \'Delete\' instead of \'Delete All Projects Settings\' or \'Delete Project Specific Settings\'\r\n\r\n','',''),
(740,'Inside MantisBT codebase we support a project_id in the user preferences table, enabling users to have a different preferences per project.  However, we seem to not use such feature of the database schema and store the preferences with project id = ALL_PROJECTS.\r\n\r\nHowever, the SOAP API enables clients to pass in a project id.  But once this project id is not 0 (ALL_PROJECTS), the row won\'t be found and a MantisBT error will be triggered.\r\n\r\nWe should ignore the incoming project_id for now and use ALL_PROJECTS within the API.  Or we should check for the row with the specified user id, preference, and project_id and if not found, fallback to user id, preference, and ALL_PROJECTS.  The former should do the trick until we start using this project_id field.','',''),
(741,'Regression in current master\r\n\r\nLogin page shows nothing more than the logo if $g_show_user_realname_threshold is set to any other value than the default NOBODY,\r\ne.g. `$g_show_user_realname_threshold = DEVELOPER;`\r\n\r\nFirst analysis: The problem happens if $g_admin_check = ON (default setting)\r\n','',''),
(742,'The Issue Trends page only displays a single graph, so adding a subtitle unnecessarily uses screen real-estate, especially considering that it is identical to the main div\'s title.','',''),
(743,'This is created to document a change that was implemented via pull requests\r\n\r\n- original by grangeway https://github.com/mantisbt/mantisbt/pull/224\r\n- follow-up by dregad https://github.com/mantisbt/mantisbt/pull/240\r\n','',''),
(744,'Provide information about whether user can download and delete the attachment.  At the moment, we typically have download access as implicit, but this may change.','',''),
(745,'The red asterisks for standard fields `Summary` and `Description` are not displayed when updating an issue.','',''),
(746,'Enhance performance of string processing by\r\n- removing unneeded assignments\r\n- removing unneeded string replacements','',''),
(747,'We have problem with memory size. Problem ariz since today (we haven\'t change anything).\r\nError text:\r\n\"Allowed memory size of 268435456 bytes exhausted (tried to allocate 1937194865 bytes)\"\r\nProblem  arising then i\'am trying to greate mantis api object\r\n\r\n// Create mantis issue.\r\ninclude(\"mantis_api.php\");	\r\n$mantis = new mantis();\r\n\r\n','',''),
(748,'Move forums to mantisbt.org','',''),
(749,'We are currently using a patched version of ADOdb 5.19.\r\n\r\nThe submodule must be updated to use an unpatched library prior to 1.3.0rc1. 5.20 should be released shortly.','',''),
(750,'When a commit includes docbook changes, the TravisCI build process errors out [1] with an error \r\n\r\n<pre>\r\n$ ./scripts/travis_script.sh\r\nBuilding DocBook...\r\nInstalling Publican...\r\nReading package lists... Done\r\nBuilding dependency tree       \r\nReading state information... Done\r\nE: Unable to locate package publican\r\n\r\nThe command \"./scripts/travis_script.sh\" exited with 100.\r\n</pre>\r\n\r\n[1] https://travis-ci.org/mantisbt/mantisbt/jobs/99832145','',''),
(751,'Currently the code in admin/index.php uses hardcoded brackets and paragraphs for display of menu items. This is not consistent with how bracketed submenus are handled elsewhere in the code.','',''),
(752,'The Recently Modified box did also display closed issues In earlier MantisBT versions.\r\n\r\nYou get also the closed issues in the list when clicking the \"View Issues\" button of the box (hide_status=none)\r\n','',''),
(753,'The column \"type\" is fetched two times in the following statement\r\n$t_query = \'SELECT f.name, f.type, f.access_level_r, f.default_value, f.type, s.value ....\r\nin function custom_field_get_all_linked_fields\r\n\r\nThe fix for it in Mantis is trivial.\r\n\r\nIt\'s worth to mention that there might be a bug in ADOdb that can cause issues in certain circumstances.\r\nMaybe there is a problem when counting fields if there is the same field name in a statement more than one time.\r\nError you get is: \r\n[mantisconnect.php] Error Type: SYSTEM NOTICE,\r\nError Description: Undefined offset: 5\r\nStack Trace:\r\nadodb.inc.php L1357 FetchField(<integer>5)\r\n...\r\n\r\nFor the whole story have a look at\r\nhttps://www.mantisbt.org/forums/viewtopic.php?f=4&t=21339\r\n','',''),
(754,'Fatal error happens when limit_reporters option is ON, and report_bug_threshold is set as an array.\r\n\r\n','',''),
(755,'Hi\r\n\r\nFor EmailReporting i need to process arrays represented as strings to actual arrays.\r\n\r\nI would like to use the function process_complex_value for this but this function is only available in adm_config_set.php which contains code outside of functions which makes it problematic for a plugin to include that file.\r\n\r\nIs it possible that some of the functions (or all of them) in adm_config_set.php are moved to a separate file so that plugins can use them as well?\r\n\r\nKind regards\r\n\r\nSL-Gundam','',''),
(756,'The same issue described by #21817 affects view_all_bug_page, where if a number of columns are selected to be shown, the content of the issues list is partly hidden and cant be scrolled conveniently.\r\nThe horizontal scroll is located at the bottom of the table container, so a user has to:\r\n- scroll down the page to the end of table\r\n- scroll the table contents horizontally\r\n- scroll up the page back to the original rows to see the contents.\r\n\r\n','',''),
(757,'The bugzilla connector allows grouping of dependencies or related tasks to\nshow in the Task List. Mantis has a Related Task section that handles the\nsame thing, however currently the connector does not include this grouping\nin the Task List.','',''),
(758,'It seems that an optimization was added to cache all versions before using them on pages like Changelog.  The cache includes all versions independent of flags like obsolete or released.  When accessing the cache, the code must filter as appropriate.  See #11604 for a bug that was introduced by this change.  We should make sure other bugs were not introduced because of that.','',''),
(759,'A simple reported logged onto my BT and has been able to create issue, using \"generate from issue ...\" duplicating from 1 project to another. Issue been marked as \"resolved\" on the other projects, with fuzzy version allocation.\r\n\r\nLooks like a security flaw ?','',''),
(760,'SYSTEM NOTICE: \'Undefined offset: 0\' in \'.../core/summary_api.php\' line 1125\r\n\r\nThis happens when a severity id is defined that does not exists in $g_severity_multipliers\r\n\r\n','',''),
(761,'Add failed_login_count to user information on pages manage_user_page and view_user_page','',''),
(762,'Just discovered this with the demo bug tracker.  When visiting the bug tracker while not already logged in, the code detects that the anonymous user has access to a single project.  It then attempts to set this on the user preference as the default project.  This has two issues:\r\n\r\n- It attempts to change preferences of a protected user, hence, causing an error.\r\n- It generates SQL updates even if the preference is already set, hence extra load.\r\n\r\nWe should fix both.\r\n\r\nI\'m not 100% sure this repros on 1.2.11, but it didn\'t in the demo instance and the latest code for master-1.2.x which we are basing 1.2.12 on.','',''),
(763,'It is important to not create non-secure user accounts as part of the csv import.  Before this change an account was created with empty email, and user name as the password.  The change sets the email to a valid address, sets a random password, and creates the account as disabled.  Administrators can then go an re-enable / reset password if needed.','',''),
(764,'\"Related tags\" in tag_view_page.php, is not showed consistently\r\nThis is reproducible in non-mysql databases, due to the query being incorrectly built.\r\n\r\nThis is the wrong query built in pgsql:\r\n\r\n<pre>\r\nSELECT * FROM mantis_bug_tag_table\r\nWHERE tag_id != $4 AND bug_id IN ( SELECT b.id FROM mantis_bug_table b\r\nLEFT JOIN mantis_project_user_list_table p\r\n        ON p.project_id=b.project_id AND p.user_id=$1 JOIN mantis_user_table u\r\n        ON u.id=$2 JOIN mantis_bug_tag_table t\r\n        ON t.bug_id=b.id\r\nWHERE ( p.access_level>b.view_state OR u.access_level>b.view_state )\r\n        AND t.tag_id=$3 )\r\n</pre>\r\n\r\nwith the parameters passed as:\r\n( $p_tag_id, $c_user_id, $c_user_id, $p_tag_id )\r\n\r\n','',''),
(765,'When print_form_button() is called with a plugin page (as generated by plugin_page() API) as action, the generated form security field is not valid.\r\n\r\nFor example:\r\n```\r\nprint_form_button( plugin_page( \'detach\' ), plugin_lang_get( \'detach\' ) );\r\n```\r\n\r\nThe security field looks like this:\r\n```\r\n<input type=\"hidden\" name=\"/mantis/plugin_token\" value=\"xxxx\">\r\n```\r\n\r\nIt should be\r\n```\r\n<input type=\"hidden\" name=\"plugin_Source_detach_token\" value=\"xxxx\">\r\n```','',''),
(766,'[PHPMailer 6.6.0](https://github.com/PHPMailer/PHPMailer/releases/tag/v6.6.0)  is a minor feature release.\r\n\r\nPR: https://github.com/mantisbt/mantisbt/pull/1798\r\n','',''),
(767,'I would like to see the name of the person who added the note to the bug.\n-Could you make the textareas for the description, additional information\nand steps to reproduce bigger? Ideally i can drag them to my desired hight\n(which will be remembered)\n-Allow assignment to another user.\n-Show synopsis (maybe first line) of description, additional information\nand steps to reproduce in the tab bar for those fields, making it instantly\nvisible if there is actually something in those fields. Like how you show\nthe number of comments.\n\nThanks and keep up the good work.\n\nMaurice','',''),
(768,'The Date Submitted / Last Updated and Due Date filters display *No* when no filter exists. This is not consistent with other filter fields, which display *any* in this case.\r\n\r\nAlso, their labels are prefixed with *Filter by*, making them longer than necessary, especially considering that the same text is repeated below as label for the enabled/disabled checkbox when the filter is expanded.\r\n','',''),
(769,'If etag is specified via `If-Match` and it doesn\'t match issue since it doesn\'t exist or it was updated since client retrieved the issue, then fail the update with `412 Precondition Failed`.','',''),
(770,'Regression in 2.4.1 since fix of #22428\r\n\r\nCustom fields of type Email are no longer displayed as mail-to links but as pure text.\r\n\r\nThis is also not fixed after applying the fix for #22926, but the behavior is a bit different.\r\nThe string displayed is `mailto:` if custom field is empty.','',''),
(771,'Add REST API to enable adding/updating relationships to an issue.','',''),
(772,'When submitting a form, eg: in manage pages, and the destination page requires reauthentication, after redirecting to the destination page the original POST request is lost\r\nThis usually generates `APPLICATION ERROR #2800 Invalid form security token`\r\n\r\n','',''),
(773,'Use the html composer for the description field','',''),
(774,'Clicking on a character to filter the user names throws SQL syntax error.\r\nDatabase query failed. Error received from database was # 1064: You have an error in your SQL syntax','',''),
(775,'Following introduction of DEPRECATED error type in #17837, it was omitted to add E_USER_DEPRECATED to the list of error types captured by default (following up on #10966).\r\n','',''),
(776,'The status legend shown at several pages, eg: view_all_bug_page\r\nshows a list of status and colors to provide with visual information to the user\r\n\r\nthis list is built based on curent filter and workflow settings (for current project). \r\nIf a current project has defined some status as unreachable in its workflow settings, those status are not shown in the status legend.\r\nHowever, there can exists bugs in the view list, which belong to subprojects, that has status allowed in that subproject, and are not informed in the status legend.\r\nSimilar case happens when current project is \"all projects\", and some projects defines a different set of workflow settings.\r\n\r\n','',''),
(777,'I can connect to my Mantis site fine and show and filter the tasks.  And I can bring up th web browser interface fine.  But whe I try to bring up th task edit for I get the following error.\n\nNo Priority with id 0\n\n\nMylyn Connector: Mantis	3.3.2.201103021850\nMantisBT 1.2.4','',''),
(778,'The following strings are used to define the $g_display_errors array.\r\n\r\nDISPLAY_ERROR_HALT   = \'halt\'\r\nDISPLAY_ERROR_INLINE = \'inline\'\r\nDISPLAY_ERROR_NONE   = \'none\'\r\n\r\nNow using constants for cleaner code.','',''),
(779,'If no search terms can be generated from the search string (e.g. a single quote) on manage_user_page,\r\npushing the `Apply Filter` button throws\r\n\r\n```\r\nAPPLICATION ERROR # 401\r\n\r\nDatabase query failed. Error received from database was # 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') AND enabled = \'1\'\' at line 1 for the query: SELECT count(*) as user_count FROM mantis_user_table WHERE (1 = 1) AND ( ) AND enabled = ?.\r\nPlease use the \"Back\" button in your web browser to return to the previous page. There you can correct whatever problems were identified in this error or select another action. You can also click an option from the menu bar to go directly to a new section.\r\n```\r\n','',''),
(780,'[PHPMailer 6.3.0](https://github.com/PHPMailer/PHPMailer/releases/tag/v6.3.0)  is a maintenance release\r\n\r\nPR: \r\n- https://github.com/mantisbt/mantisbt/pull/1684 (6.1.7)\r\n- https://github.com/mantisbt/mantisbt/pull/1706 (6.1.8 - not applied)\r\n- https://github.com/mantisbt/mantisbt/pull/1713 (6.2.0)\r\n- https://github.com/mantisbt/mantisbt/pull/1741 (6.3.0)\r\n','',''),
(781,'When there are no saved filters available to the user, the *source_query_id* select is not printed.\r\n\r\nAny event on the page, such as updating the current filter\'s criteria or ticking the checkboxes to select issues for group actions, triggers the following Javascript error\r\n\r\n```\r\nUncaught TypeError: selected_text is undefined\r\n    filter_named_filter_dirty http://localhost/mantis/js/bugFilter.js:103\r\n    filter_field_dirty http://localhost/mantis/js/bugFilter.js:114\r\n    filter_toggle_field_changed http://localhost/mantis/js/bugFilter.js:67\r\n    filter_highlight_changes http://localhost/mantis/js/bugFilter.js:75\r\n    <anonymous> http://localhost/mantis/js/bugFilter.js:51\r\n    jQuery 8\r\n    <anonymous> http://localhost/mantis/js/bootstrap-3.4.1.min.js:6\r\n    <anonymous> http://localhost/mantis/js/bootstrap-3.4.1.min.js:6\r\nbugFilter.js:103:6\r\n```\r\n','',''),
(782,'If a user had rights to report a bug \r\nAND he had no right to upload files\r\nAND he did not choose any (but there is upload section with buttons)\r\n he would get \'access denied\' message, but the bug would be correctly created.\r\n\r\n','',''),
(783,'The fonts we bundle with MantisBT for local use without a CDN are sometimes updated.\r\n\r\nSince downloading them for the various subsets is quite tedious, it would be useful to have an helper script to automate the process.','',''),
(784,'After using FontAwesome for icons there is some dead code in Mantis.\r\nAfter removing the dead code, there is no longer any access to setting\r\nicon_path.\r\n','',''),
(785,'In view_all_bug_page:\r\nThe attachments owned by the user are not counted when option \"allow_view_own_attachments\" is enabled and \"view_attachments_threshold\" is higher than current level access\r\n\r\n','',''),
(786,'When adding more than one relationship at a time, we should avoid triggering errors if possible, as it may be confusing for the user who will not know whether the whole operation failed, or some relationships were successfully added.\r\n\r\nUse case for ignoring source issue ids: if several issues need to be related to each other, admin can create a list of issues e.g. `111,222,333` and paste it as-is in each of them. Currently, Mantis throws an error when trying to relate an issue to itself.\r\n\r\nWhen the list contains an empty id (e.g. the list has a trailing `,` or one id was deleted in the middle but the extra delimiter remains like `111,,333`), we can just silently and without harm ignore the empty id instead of throwing an APPLICATION ERROR 200.\r\n','',''),
(787,'With the new version scheme of major.minor.patch,\r\nplugin requeriments on mantis core version needs to be redefined.\r\nCurrently, a plugin requiring 2.0 is only valid for <2.1\r\nShould be defined as valid for <3.0 (less than next major version)','',''),
(788,'Set $g_enable_sponsorship = ON;\r\nSponsor an issue and assign to yourself\r\nGoto page \"My Account\" > \"My Sponsorships\"\r\nSet Status to \"Paid\"\r\nClick \"Change Payment Status\"\r\nBug: The status is not changed to \"Paid\"','',''),
(789,'Following https://bugs.eclipse.org/bugs/show_bug.cgi?id=497412 the task id is no longer used by default as a key and the task list no longer prints out the task id in front of the tasks. We should explicitly set the task key to restore the functionality.','',''),
(790,'Implement the command and use it from web UI, REST API, and SOAP API.','',''),
(791,'The MantisBT installer allows no-op schema operations since 1.3.0-beta.1 (see :mantisbt:061e66b5cfbda95e2ecbe87803c3388b2642cead:)., but the change was never applied to plugin_upgrade().\r\n\r\nStandard and plugin schema upgrades should offer the same functionalities.\r\n','',''),
(792,'The \'ezComponents\' (ezc) library used by the MantisGraph plugin became \'Zeta Components\' in 2010.\r\n\r\nSince 2012, they are hosted on Github (http://github.com/zetacomponents) so it makes sense to include them as git submodules like we do for other libraries.\r\n','',''),
(793,'The descriptions of bug_reopen_resolution and bug_duplicate_resolution are swapped in Admin Guide','',''),
(794,'Currently, the event chain only processes the bugnote text. \r\n\r\nTo be consistent with the way EVENT_BUG_UPDATE_DATA works for Bugs, and to allow more control to plugins hooking this event, it would make sense to have the event signal send the whole BugnoteData structure as parameter.','',''),
(795,'Bug #11824 has introduced X-Frame-Options clickjacking protection. The value of the mentioned header is unconditionally set to \'Deny\'. In some cases users would like to tweak the value of this header, see for instance http://stackoverflow.com/questions/15813325/squash-tm-bugtracker-in-frame/15815825 .\r\n\r\nWe should allow for the value of the X-Frame-Options to be configurable.','',''),
(796,'I opened 2 issues from notification email.\r\nAnswers first\r\nWhen answering 2nd (add note) i get : \r\n\r\nAPPLICATION ERROR #2800\r\n\r\nInvalid form security token. This could be caused by a session timeout, or accidentally submitting the form twice.\r\nPlease use the \"Back\" button in your web browser to return to the previous page. There you can correct whatever problems were identified in this error or select another action. You can also click an option from the menu bar to go directly to a new section.\r\n\r\nThis is NOT the 1st time it happens to me...\r\nMaybe linked to issue #0023636 ?','',''),
(797,'The following line is expected to be truncated when saved to the database and email is sent on the emoji after Z3 but there is text after that which I pasted in.\r\n\r\nNot compatible with my Xperia Z3','',''),
(798,'It is not possible to assign a previously sponsored issue even when sponsorship has been switched off:\r\n\r\nAPPLICATION ERROR 1704\r\nAccess Denied: Assigning sponsored issues requires higher access level.\r\n','',''),
(799,'When log destination is \"file\", it is shown less information than setting the log destination to \"page\".\r\n\r\nThe trace of the caller (script, line and function) is useful for debugging, and should be available on file logging.\r\n','',''),
(800,'Anonymous users have different rights depending on the way they \'login\'','',''),
(801,'Buttons that are generated from print_form_button() don\'t show separation, while standard buttons included within the same form do show a spacing between them\r\nAttached are examples of standard buttons, with 1px margin, and \"print_form_button\" generated ones, stacked together\r\n\r\nExamples are from adm_config_report.php','',''),
(802,'While executing the admin checks I noticed a failure on existence of config_inc.php even though the file was present; displaying verbose errors showed a \r\n\r\nSYSTEM NOTICE: Undefined variable: t_field_comment\r\nRaised in file /home/dregad/dev/mantisbt/admin/check/check_database_inc.php on line 397\r\n\r\nI found that strange since this is mysql-only code and I was configured for postgres. \r\n\r\nTracing shows that config_get_global(db_type) call in db_is_mysql() returns \'mysqli\' despite the fact that $g_db_type == \'pgsql\' in my config_inc.php\r\n\r\ngit bisect says the problem is 4b173463c2715c7dfa12dc37b6663df19930e594 (#16850)\r\n','',''),
(803,'It seems a step forward for the current layout of pages is to define a formal site structure of pages. \r\nSome example issues with current system:\r\n- We have discussed how weak is the current manage menu, where we don\'t know for sure if any of the derived pages can actually be shown. Even if the check can be done, they are hardcoded, and also needs to account for plugin manage pages that are dynamically inserted.\r\n- Inability to tweak standard pages position, visibility, in menus\r\n- ...more?\r\n\r\nIf going for a more systematic structure, other goals could be progressively achieved:\r\n- Delegate the rendering of pages, clean up the base dir of mantis\r\n- Improve action pages that display forms, receive submissions, perform changes, for a better UX\r\n- ...etc?\r\n\r\nIt can be discussed if there is any ready-to-use framework, or if it\'s better to invest into a custom approach. I guess the latter would better fit to provide progressive changes and backwards compatibility in the process.\r\n','',''),
(804,'1. Set [ $g_file_upload_method   = DISK; ] and configure [ $g_absolute_path_default_upload_folder ] in config_inc.php\r\n2. Report an issue with attachment.\r\n3. Check the attachment in mantis_bug_file_table, the content is not null. However, the disk file is also existed in the folder.\r\n\r\n3a. If access /admin/move_attachments_page.php, the attachment count is not 0.\r\n3b. If administrator do \'move to disk\', the \'diskfile\' will be mapping to a new place which file size is 2 bytes. Thus no one can download correct file content.\r\n\r\n\r\n\r\nquery result the attachment:\r\n<pre>\r\n+----+--------+-------+-------------+----------------------------------+--------------+---------------------------------------+----------+-----------+---------+------------+---------+\r\n| id | bug_id | title | description | diskfile                         | filename     | folder                                | filesize | file_type | content | date_added | user_id |\r\n+----+--------+-------+-------------+----------------------------------+--------------+---------------------------------------+----------+-----------+---------+------------+---------+\r\n|  5 |      4 |       |             | b66c36fbdc246d15ca50cb51073b0aca | tempfile.PNG | /volume1/web/wnbu/mantis-attachments/ |    17893 | image/png | \'\'      | 1449109357 |       2 |\r\n+----+--------+-------+-------------+----------------------------------+--------------+---------------------------------------+----------+-----------+---------+------------+---------+\r\n</pre>','',''),
(805,'In workflow threshold manage page,\r\nthere is no configuration available for some options, eg:\r\n private_project_threshold\r\n upload_bug_file_threshold\r\n\r\nIt would be useful to have them there to correctly use any combination of configuration per project.\r\n\r\nProbably, there are more configurations missing\r\n','',''),
(806,'out of office emails should have specific headers.\r\n\r\nNot all mail programs/servers use this. Exchange for example does not give it\r\n','',''),
(807,'- Use Composer instead of git submodule.\r\n- Upgrade from 2.x to 3.0.1.\r\n\r\nThe 3.x release has a very big increase in # of disposable domains.','',''),
(808,'I\'ve noticed that there exists db calls using db_query_bound\r\n\r\nFrom v1.3, the queries should use db_query().\r\nAdditionally, if db_param() is used, db_param_push() is recommended if the code might be interleaved with other query building (relevant for api codes)\r\n\r\nNote that db_query_bound() was deprecated to be removed in 2.0\r\n','',''),
(809,'Commit a61aed3b0b1f89e7e978be486beeac97492a83c0 introduced a major regression, preventing installation and update of existing config keys.\r\n','',''),
(810,'Due some recent change, the custom field sorting doesn\'t work in some cases.  By doesn\'t work I mean that clicking on the custom field header on View Issues page has no effect.  This didn\'t always happen, but after some investigations, I figured out that this happens in the case where a custom field is name \"Some custom field\" but references in View Issues columns list (from manage columns) as \'some custom field\' (different case).  The logic that shows the field is case insensitive, but the logic for sorting by the field is case sensitive.\r\n\r\nIf the custom field name in the Manage Columns configure is changed to use the correct case, the sorting works again.\r\n\r\nCould this be introduced by #17367 ?','',''),
(811,'There is a wrong label for update button on bug_update_page.php if $g_action_button_position is set to POSITION_TOP or POSITION_BOTH\r\n\r\nCaused by missing PHP tags around lang_get( \'update_information_button\' )','',''),
(812,'Inspecting the code for upgrade unattended, it seems that it only upgrades the code schema, but doesn\'t trigger the plugins to do the same.','',''),
(813,'```\r\nDELETE {{url}}/api/rest/issues/:issue_id/tags/:tag_id\r\n```','',''),
(814,'The last published 1.3.x ERD is for schema version 189 and was last updated in 2013. \r\n\r\nPrior to releasing 1.3.0, the diagram should be updated to reflect latest schema changes.','',''),
(815,'The SOAP API can be used for SQL injection attacks.\r\n\r\nPasting relevant extracts of the original e-mail report below\r\n\r\n-----------------\r\n\r\nThe xml sent to the soap webservice is sometimes validated, sometimes not. This\r\nis independend from the php.ini and seems to be dependent on the php binary.\r\nThe php binaries on the different systems (I used the thoughtpolice images)\r\ndiffer in the libxml2 version. But I am not quite sure this is the reason.\r\n\r\nIt is definitely still an issue, but it\'s not 100% sure whether the\r\nresponsibility is 100% at mantisbt.org \r\n\r\nthe XML request cannot be issued without a user account. The request allows\r\nto read the contents of the entire mantis database no matter what the user\'s\r\naccess permissions are. Mantis often is used with many projects and has a\r\nfine-grain permission structure.\r\n','',''),
(816,'When using the site from a browser with small screen size, the presentation of tables overflows the available space in screen.\r\nThen tables have to be scrolled left and right to be able to use the content.\r\n\r\nThere are several issues with this:\r\n- Reading blocks of texts is annoying: eg. issue descriptions, notes, etc. as the text is wider than screen, noot dynamically adapted to viewport width. You have to constantly scroll sideways to read the text\r\n- Some tables may be acceptable (even preferable), due to the presentation of a lot of information, for example: view bugs list.\r\n  but other seems not to be a requeriment. For example: forms like bug report page. View bug page would benefit for a dynamic layout too\r\n\r\ni\'ve set this to major severity, becasue i have the concept that the new UI was targeted to be responsive and adapted to a wide sort of devices.\r\nIn my opinion, as described, the current layout is not still at that stage.\r\n\r\n','',''),
(817,'If you export all issues in MantisBT with notes field included, the Excel file will be corrupt due to issue #12830\r\n\r\nIt seems that there is a max length limit on cells in Excel that we are not enforcing.','',''),
(818,'Currently there exist an option to sort user name by their last name (\'sort_by_last_name\').\r\nThe user last name is calculated at runtime with a separation at first space character:\r\nexplode( \' \', utf8_strtolower( $t_user_name ), 2 );\r\n\r\nThis presents some problems:\r\n1) Code is not reused. At least a common helper function should be used\r\n2) The logic to extract the last name does not account for real life situations, which can be common outside the English context\r\n\r\nSome real life issues:\r\n- Compound names. In my language (spanish) there are names with a compound first name\r\nFor example: \"Miguel Angel Perez\" should be decomposed in:\r\nfirst name: \"Miguel Angel\"\r\nlast name: \"Perez\"\r\n- Localization contexts. I think that some countries/languages use a different position for main last name. For example, if i am not mistaken, portuguese names like: \"Joao Teixeira Almeida\" should be presented:\r\nfirst name: \"Joao\"\r\nlast name: \"Almeida\"\r\n\r\nFor these reasons, if an option to sort or show user by last name is provided, the proper way to handle is to let the user set the last/first name by himself.\r\nIn such case, new fields must be created in user table, and added inputs on user forms.\r\n\r\n\r\n\r\n\r\n','',''),
(819,'Clone of #22690 for tracking in the Changelog','',''),
(820,'Plugin filters in filter box don\'t work with the dynamic population of form inputs. Clicking on the header goes to view_filters_page\r\n\r\nAdditionally, header text style does not match other fields.','',''),
(821,'Currently, the IssueAddCommand first creates the issue, then processes the tags.\r\n\r\nIf one or more of these tags are invalid or can\'t be attached for any reason, the request fails (404) as it should, but the issue has been created anyway (so the return code should be 201). Since the request is in error, it is not possible to retrieve the created issue\'s details.\r\n\r\nThe API call should fail without creating the issue.','',''),
(822,'Use latest PhpUnit library.','',''),
(823,'It\'s grayed out at the moment in the task list and hidden the task header. Since we support sub-tasks for Mantis 1.2.x this should be enabled in this specific case.','',''),
(824,'The custom field names in REST API are case sensitive and they shouldn\'t.','',''),
(825,'Some users find it useful to include the notes in the CSV/Excel export.','',''),
(826,'When using the function print_button (print_api.php)\r\n<pre>\r\nfunction print_button( $p_action_page, $p_label, array $p_args_to_post = null, $p_security_token = null )\r\n</pre>\r\n\r\ninternally, it uses the form action page to print the token field:\r\n<pre>\r\n$t_form_name = explode( \'.php\', $p_action_page, 2 );\r\nform_security_field( $t_form_name[0], $p_security_token );\r\n</pre>\r\n\r\nwhen using plugin_page() to get an url, the base page is plugin.php, and plugin page is specified with GET parameter. \r\nThis messes with how the print_button creates the token field\r\n\r\n\r\n\r\n','',''),
(827,'Date filters are not working since version 1.2.12','',''),
(828,'Figure out how to make it discoverable via the Postman explore page.','',''),
(829,'1.3.x comes with bundled jQuery, jQuery-UI and jQuery Mobile.\r\n\r\nThere is no longer the need for plugins like\r\nhttps://github.com/mantisbt-plugins/jQuery-UI\r\nhttps://github.com/mantisbt-plugins/jquery\r\n\r\nI did not test until now, but having the embedded scripts in addition to the plugins might introduce unexpected behaviour.\r\n\r\nPossible solutions:\r\na) check when upgrading from 1.2. to 1.3, uninstall existing jQuery\r\nb) introduce a hardcoded \"do no load\" list\r\nc) ???\r\n\r\nI prefer a)','',''),
(830,'When creating a user, or changing user names, if the new \"user name\" exists as other user\'s real name, the system shows an error for duplicated user name.\r\n\r\nThis happens because the validation of user name uniqueness looks on both \"user name\" and \"realname\".','',''),
(831,'The config api uses several cache variables. Currently the config_flush_cache() function only clears $g_cache_config and $g_cache_config_access.\r\n\r\nIt should also clear $g_cache_config_eval.','',''),
(832,'The dynamic CSS script (status_config.php) does not define proper color classes when when displaying issues from a project other than then current one, if the other project has custom status or colors.\r\n\r\nA possible solution could be to build the CSS including all possible project-specific colors.','','');
/*!40000 ALTER TABLE `mantis_bug_text_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bugnote_table`
--

DROP TABLE IF EXISTS `mantis_bugnote_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `note_type` int(11) DEFAULT 0,
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT 0,
  `last_modified` int(10) unsigned NOT NULL DEFAULT 1,
  `date_submitted` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bugnote_table`
--

LOCK TABLES `mantis_bugnote_table` WRITE;
/*!40000 ALTER TABLE `mantis_bugnote_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bugnote_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_bugnote_text_table`
--

DROP TABLE IF EXISTS `mantis_bugnote_text_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bugnote_text_table`
--

LOCK TABLES `mantis_bugnote_text_table` WRITE;
/*!40000 ALTER TABLE `mantis_bugnote_text_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_bugnote_text_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_category_table`
--

DROP TABLE IF EXISTS `mantis_category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_category_table`
--

LOCK TABLES `mantis_category_table` WRITE;
/*!40000 ALTER TABLE `mantis_category_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_category_table` VALUES
(1,0,0,'General',1),
(2,0,0,'Test',1);
/*!40000 ALTER TABLE `mantis_category_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_config_table`
--

DROP TABLE IF EXISTS `mantis_config_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `access_reqd` int(11) DEFAULT 0,
  `type` int(11) DEFAULT 90,
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_config_table`
--

LOCK TABLES `mantis_config_table` WRITE;
/*!40000 ALTER TABLE `mantis_config_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_config_table` VALUES
('database_version',0,0,90,1,'213'),
('plugin_MantisSeeder_schema',0,0,90,1,'-1');
/*!40000 ALTER TABLE `mantis_config_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_custom_field_project_table`
--

DROP TABLE IF EXISTS `mantis_custom_field_project_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sequence` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_custom_field_project_table`
--

LOCK TABLES `mantis_custom_field_project_table` WRITE;
/*!40000 ALTER TABLE `mantis_custom_field_project_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_custom_field_project_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_custom_field_string_table`
--

DROP TABLE IF EXISTS `mantis_custom_field_string_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `bug_id` int(11) NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '',
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_custom_field_string_table`
--

LOCK TABLES `mantis_custom_field_string_table` WRITE;
/*!40000 ALTER TABLE `mantis_custom_field_string_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_custom_field_string_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_custom_field_table`
--

DROP TABLE IF EXISTS `mantis_custom_field_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` text NOT NULL,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT 0,
  `access_level_rw` smallint(6) NOT NULL DEFAULT 0,
  `length_min` int(11) NOT NULL DEFAULT 0,
  `length_max` int(11) NOT NULL DEFAULT 0,
  `require_report` tinyint(4) NOT NULL DEFAULT 0,
  `require_update` tinyint(4) NOT NULL DEFAULT 0,
  `display_report` tinyint(4) NOT NULL DEFAULT 0,
  `display_update` tinyint(4) NOT NULL DEFAULT 1,
  `require_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `display_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `display_closed` tinyint(4) NOT NULL DEFAULT 0,
  `require_closed` tinyint(4) NOT NULL DEFAULT 0,
  `filter_by` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_custom_field_table`
--

LOCK TABLES `mantis_custom_field_table` WRITE;
/*!40000 ALTER TABLE `mantis_custom_field_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_custom_field_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_email_table`
--

DROP TABLE IF EXISTS `mantis_email_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_email_table`
--

LOCK TABLES `mantis_email_table` WRITE;
/*!40000 ALTER TABLE `mantis_email_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_email_table` VALUES
(1,'cproensa@example.invalid','[Test 0000123]: In workflow config, better explain for status not used','a:5:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:14:\"[Test] General\";s:11:\"In-Reply-To\";s:32:\"1707425206ff7759a8ff59a391ad9c14\";}s:2:\"cc\";a:0:{}s:3:\"bcc\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following issue has been ASSIGNED. \n====================================================================== \nhttp://localhost:8989/view.php?id=123 \n====================================================================== \nReported By:                cproensa\nAssigned To:                administrator\n====================================================================== \nProject:                    Test\nIssue ID:                   123\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   text\nPriority:                   normal\nStatus:                     closed\nResolution:                 duplicate\nFixed in Version:           \n====================================================================== \nDate Submitted:             2025-10-26 22:30 IST\nLast Modified:              2025-10-27 22:19 IST\n====================================================================== \nSummary:                    In workflow config, better explain for status not used\nDescription: \nIn workflow configuration, if a status has not been configured to have any \"next status\", a text is showed: \"You cannot move an issue out of this status\"\r\n\r\nIt should also show the fact that this status will allow the transition to any other status, in the case that it happens.\r\nThis rule is counter-intuitive because the configuration screen is actually showing all \"next status\" unchecked, and the warning also implies the opposite.\r\n\r\nChange the warning for a better explanation. \n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2025-10-26 22:30 administrator  New Issue                                    \n2025-10-26 22:30 administrator  Assigned To               => cproensa        \n2025-10-27 22:19 administrator  Assigned To              cproensa => administrator\n======================================================================',1761596398);
/*!40000 ALTER TABLE `mantis_email_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_filters_table`
--

DROP TABLE IF EXISTS `mantis_filters_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_filters_table`
--

LOCK TABLES `mantis_filters_table` WRITE;
/*!40000 ALTER TABLE `mantis_filters_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_filters_table` VALUES
(1,1,0,0,'','v9#{\"_version\":\"v9\",\"_view_type\":\"simple\",\"category_id\":[\"0\"],\"severity\":[0],\"status\":[0],\"per_page\":50,\"highlight_changed\":6,\"reporter_id\":[0],\"handler_id\":[0],\"project_id\":[-3],\"projection\":[0],\"sort\":\"id,last_updated\",\"dir\":\"DESC,DESC\",\"filter_by_date\":false,\"start_month\":10,\"start_day\":1,\"start_year\":2025,\"end_month\":10,\"end_day\":27,\"end_year\":2025,\"filter_by_last_updated_date\":false,\"last_updated_start_month\":10,\"last_updated_start_day\":1,\"last_updated_start_year\":2025,\"last_updated_end_month\":10,\"last_updated_end_day\":27,\"last_updated_end_year\":2025,\"search\":\"\",\"hide_status\":[-2],\"resolution\":[0],\"build\":[\"0\"],\"version\":[\"0\"],\"fixed_in_version\":[\"0\"],\"target_version\":[\"0\"],\"priority\":[0],\"monitor_user_id\":[0],\"view_state\":0,\"custom_fields\":[],\"sticky\":true,\"relationship_type\":-1,\"relationship_bug\":0,\"profile_id\":[0],\"platform\":[\"0\"],\"os\":[\"0\"],\"os_build\":[\"0\"],\"tag_string\":\"\",\"tag_select\":0,\"note_user_id\":[0],\"match_type\":0,\"_source_query_id\":1}'),
(2,1,-1,0,'','v9#{\"_version\":\"v9\",\"_view_type\":\"simple\",\"category_id\":[\"0\"],\"severity\":[0],\"status\":[0],\"per_page\":50,\"highlight_changed\":6,\"reporter_id\":[0],\"handler_id\":[0],\"project_id\":[-3],\"projection\":[0],\"sort\":\"last_updated,summary\",\"dir\":\"DESC,ASC\",\"filter_by_date\":false,\"start_month\":10,\"start_day\":1,\"start_year\":2025,\"end_month\":10,\"end_day\":27,\"end_year\":2025,\"filter_by_last_updated_date\":false,\"last_updated_start_month\":10,\"last_updated_start_day\":1,\"last_updated_start_year\":2025,\"last_updated_end_month\":10,\"last_updated_end_day\":27,\"last_updated_end_year\":2025,\"search\":\"\",\"hide_status\":[-2],\"resolution\":[0],\"build\":[\"0\"],\"version\":[\"0\"],\"fixed_in_version\":[\"0\"],\"target_version\":[\"0\"],\"priority\":[0],\"monitor_user_id\":[0],\"view_state\":0,\"custom_fields\":[],\"sticky\":true,\"relationship_type\":-1,\"relationship_bug\":0,\"profile_id\":[0],\"platform\":[\"0\"],\"os\":[\"0\"],\"os_build\":[\"0\"],\"tag_string\":\"\",\"tag_select\":0,\"note_user_id\":[0],\"match_type\":0}');
/*!40000 ALTER TABLE `mantis_filters_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_news_table`
--

DROP TABLE IF EXISTS `mantis_news_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `poster_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `announcement` tinyint(4) NOT NULL DEFAULT 0,
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT 1,
  `date_posted` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_news_table`
--

LOCK TABLES `mantis_news_table` WRITE;
/*!40000 ALTER TABLE `mantis_news_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_news_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_plugin_table`
--

DROP TABLE IF EXISTS `mantis_plugin_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 3,
  PRIMARY KEY (`basename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_plugin_table`
--

LOCK TABLES `mantis_plugin_table` WRITE;
/*!40000 ALTER TABLE `mantis_plugin_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_plugin_table` VALUES
('MantisCoreFormatting',1,0,3),
('MantisSeeder',1,0,3);
/*!40000 ALTER TABLE `mantis_plugin_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_project_file_table`
--

DROP TABLE IF EXISTS `mantis_project_file_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_file_table`
--

LOCK TABLES `mantis_project_file_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_file_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_project_file_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_project_hierarchy_table`
--

DROP TABLE IF EXISTS `mantis_project_hierarchy_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_project_hierarchy` (`child_id`,`parent_id`),
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_hierarchy_table`
--

LOCK TABLES `mantis_project_hierarchy_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_hierarchy_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_project_hierarchy_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_project_table`
--

DROP TABLE IF EXISTS `mantis_project_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 10,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `access_min` smallint(6) NOT NULL DEFAULT 10,
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT 1,
  `inherit_global` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_table`
--

LOCK TABLES `mantis_project_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_project_table` VALUES
(1,'Test',10,1,10,10,'','',1,1),
(2,'General',10,1,10,10,'','General',1,1);
/*!40000 ALTER TABLE `mantis_project_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_project_user_list_table`
--

DROP TABLE IF EXISTS `mantis_project_user_list_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `access_level` smallint(6) NOT NULL DEFAULT 10,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_user_list_table`
--

LOCK TABLES `mantis_project_user_list_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_user_list_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_project_user_list_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_project_version_table`
--

DROP TABLE IF EXISTS `mantis_project_version_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT 1,
  `obsolete` tinyint(4) NOT NULL DEFAULT 0,
  `date_order` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_version_table`
--

LOCK TABLES `mantis_project_version_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_version_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_project_version_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_sponsorship_table`
--

DROP TABLE IF EXISTS `mantis_sponsorship_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `date_submitted` int(10) unsigned NOT NULL DEFAULT 1,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_sponsorship_table`
--

LOCK TABLES `mantis_sponsorship_table` WRITE;
/*!40000 ALTER TABLE `mantis_sponsorship_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_sponsorship_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_tag_table`
--

DROP TABLE IF EXISTS `mantis_tag_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT 1,
  `date_updated` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_tag_table`
--

LOCK TABLES `mantis_tag_table` WRITE;
/*!40000 ALTER TABLE `mantis_tag_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_tag_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_tokens_table`
--

DROP TABLE IF EXISTS `mantis_tokens_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 1,
  `expiry` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_tokens_table`
--

LOCK TABLES `mantis_tokens_table` WRITE;
/*!40000 ALTER TABLE `mantis_tokens_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_tokens_table` VALUES
(2,1,5,'{\"filter\":false,\"profile\":false}',1761256805,1792792805),
(8,1,3,'832,806,829,831,721',1761588896,1761765248);
/*!40000 ALTER TABLE `mantis_tokens_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_user_pref_table`
--

DROP TABLE IF EXISTS `mantis_user_pref_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `default_profile` int(10) unsigned NOT NULL DEFAULT 0,
  `default_project` int(10) unsigned NOT NULL DEFAULT 0,
  `refresh_delay` int(11) NOT NULL DEFAULT 0,
  `redirect_delay` int(11) NOT NULL DEFAULT 0,
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_closed` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_status` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_priority` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT 0,
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_pref_table`
--

LOCK TABLES `mantis_user_pref_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_pref_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_user_pref_table` VALUES
(1,1,0,0,0,30,2,'ASC',1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'english','Asia/Jerusalem');
/*!40000 ALTER TABLE `mantis_user_pref_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_user_print_pref_table`
--

DROP TABLE IF EXISTS `mantis_user_print_pref_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_print_pref_table`
--

LOCK TABLES `mantis_user_print_pref_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_print_pref_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_user_print_pref_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_user_profile_table`
--

DROP TABLE IF EXISTS `mantis_user_profile_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_profile_table`
--

LOCK TABLES `mantis_user_profile_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_profile_table` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mantis_user_profile_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mantis_user_table`
--

DROP TABLE IF EXISTS `mantis_user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL DEFAULT '',
  `realname` varchar(191) NOT NULL DEFAULT '',
  `email` varchar(191) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `access_level` smallint(6) NOT NULL DEFAULT 10,
  `login_count` int(11) NOT NULL DEFAULT 0,
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT 0,
  `failed_login_count` smallint(6) NOT NULL DEFAULT 0,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT 1,
  `date_created` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_table`
--

LOCK TABLES `mantis_user_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_table` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mantis_user_table` VALUES
(1,'administrator','Alexei','root@localhost','5549d885b79d8a7d348fc415da309bf9',1,0,90,14,0,0,'v3BhRvb7nDkEnuLNmghePOFmFflh6Hzf-k71xDKhb51iVEv4cbWvErxO21q504_E',1761679628,1761255493),
(2,'vboctor','','vboctor@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'whGU5027D1qYjaOgMLccTPWL1jZu4hyDbdyBFC8h-8bQfb1GrBGrePd5kJO2aw0p',1761510444,1761510444),
(3,'cproensa','','cproensa@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'7JTET8_hmCLz7kaUrsNICNjJF5gNhyaM1jy5DOIJOss7eDAPDc9Y7omOTHFKGPN2',1761510447,1761510447),
(4,'atrol','','atrol@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'UsYc_6HZa3BX6Pcj3KK6jS5qPXj0d4EkT5VXnOGHn60WORdR1IWkY4dKFuYmu2-1',1761510455,1761510455),
(5,'SSteve','','SSteve@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'8bOMLGsuI6_kTDQc4VhepbDgb3usJwikIga4Vbvd7yb1xU8-EvDIIO5G8Sxjh16q',1761510460,1761510460),
(6,'dregad','','dregad@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'DRIKM8qLV4MuPa5ukEf0W1hf2XeL0-jVLGdBiHahsMAdgs8UYEUnEcOXk-xMMvQB',1761510465,1761510465),
(7,'zhanghongquan','','zhanghongquan@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'mbvuvBbz2VewYbmiCF_UmVlfoKceD8i8ZcgUT5-fz_-eC3EJCLawLZcWGInNJgx_',1761510470,1761510470),
(8,'cdijoux','','cdijoux@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'dvA9MndmvUOhJRBlZ6ypWVcj4X9oSPy6SQOv7yTv74AKw3mQ9D9EIhGIUEbb0iFF',1761510473,1761510473),
(9,'m.junaid86@gmail.com','','m.junaid86@gmail.com@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'ICfmbwfVld4zakufgy7PcPIfEYTvVosEkX_BVj_wz4VkL3IT8Ci_C5rod7BT84p_',1761510476,1761510476),
(10,'badfiles','','badfiles@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'7sinpZO-GhkGZOpglqWfLV-4MMkW7XZImp6DbL-l7OWi3RSBuIPcXMrtC0rZuBLx',1761510479,1761510479),
(11,'greno2','','greno2@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'Yk8Vs936QBWWG9UoRXRk2FRfTVjZ1yAuXq1DlDzBfaXg45otnRiNgsee5N8UHuG3',1761510488,1761510488),
(12,'community','','community@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'La-7sP6c9-uHo87J7zkdVx9Dq8lYAhLwbZ72m1q-RKgLzzxuI3TkxlVGUYLz9jsF',1761510489,1761510489),
(13,'biju_ps','','biju_ps@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'ilEfQvsjQBELLxyv5NjA78BkAK9f-LDO0_gv8PgrDPI2tGGks4aCrYbKq2HvWcou',1761510510,1761510510),
(14,'q.joignaud','','q.joignaud@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'BQUQTyCsuEhfFOZbeZWJ-wb-Rk111z5ulXsV3sZT1Jjm35DcbUjUv6HtI3pnh36x',1761510514,1761510514),
(15,'Kyle_Katarn','','Kyle_Katarn@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'6OVUvAQJw9iII9i5hQMMgtt3A8ElB0sNlivfpNt6NxsHfC2RFIIG2oI7CGW-WOAl',1761510515,1761510515),
(16,'sunitha.kulkarni','','sunitha.kulkarni@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'pSL1yPi4qzcAl56BML9V8ryjW7d7lsk1oRvzv_7Npf7yOwgAmzLDJciydBhgKYbj',1761510519,1761510519),
(17,'kellyzhou','','kellyzhou@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'FltBSAuvhRkA01y-v81yOi5M7HZMpJFTQ2wTfvPv3dWafCsXmyhyWhbDuPK6fQ4K',1761510529,1761510529),
(18,'rkorebrits','','rkorebrits@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'HbJhlW57S7jDXR5ybPoXiFubC1WfcEYR3Mvw_MbXZQKUkfj6V4Nrn435GRmpyygv',1761510531,1761510531),
(19,'marcela vergara','','marcela_vergara@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'yZKl2_hg7e2kMwDEwe8MKs7Mq-w7mZKYfsYqfmww7IH8jczN0Kz3oqG99HSdZxMK',1761510532,1761510532),
(20,'akularam','','akularam@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'V74X-ZTLrwrAHxuSMXwCyGMfLGbRbEktws9ti7gQBkyLCHQiMkvU1xikfwo5QRVo',1761510542,1761510542),
(21,'les050964','','les050964@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'jgoVStBwDwgoWGTkL1hWQotdetH3BV5XRJr0W9lSYYlPiRuJhU-NJS0rDRwJYtQy',1761510543,1761510543),
(22,'tam','','tam@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'lDlvwY0Ci3LJl9dcZgyhdZXvemHhu8PHaz0tuL7TKDofDM5WqX5hxhdPIJZMz02T',1761510545,1761510545),
(23,'TomR','','TomR@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'lj0xs6YUn6LTWl6C8jTDchYAoTy0EA-GOUCn-MfkdyddPGNYJgVjMqHvwS-XZL3l',1761510550,1761510550),
(24,'lukas.hubner','','lukas.hubner@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'Pfff2pHyLG85uyD06m2JKgnt51BH7IS0TNOvUaR7WgdbgyJtgmsZpWnbuGPvwbKZ',1761510562,1761510562),
(25,'lhenao','','lhenao@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'BGYxJIySjxPwbiIMpyqZanTIDs2qPnWUn9H8cG7kAY7uAvTQ9GpaaUdIQ0jNLzOX',1761510566,1761510566),
(26,'SL-Gundam','','SL-Gundam@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'VJY724KwZQ_t0qTA8lnjlEtCJApGWlpVjnLuFJbe8pEYke3cBSXnP61CXP3f4EQi',1761510566,1761510566),
(27,'ouyangyy','','ouyangyy@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'VQAcG7aTfKrXuKY6LqfixelPEhjzwHejaex8eH50Y0hL8kmqhfqDXN76Dekq_SrK',1761510570,1761510570),
(28,'ovdijchuk','','ovdijchuk@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'jFRlbP75vop91fsWFCbx4S4nL2jOLl-3PUFUZlP7QU8kUjWeXFoY8NsGye-Dk5t0',1761510580,1761510580),
(29,'robert.lai','','robert.lai@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'GEq0nv6Vn6geLt41r7etXEg0-w_meBwyKJyVoYuXWJ6cn9G4jUgN5NtUWMvzabaw',1761510584,1761510584),
(30,'dbaguyo','','dbaguyo@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'15QlsFQRU7-owrzDqe2jhULEvZrRq8heFg79ZIzYjPPG-eyFgcWFpFc9H0-LxkBF',1761510598,1761510598),
(31,'gronhil','','gronhil@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'MkYXhK5GZARqGKvvtaHg6z8Su8laeuA_EDGi1j4TaJpg229ls10Zh2D0QatNFFvp',1761510611,1761510611),
(32,'rombert','','rombert@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'u8_n9MZYNHcqgHf21J5dbQym6h62CaGB29BYU4dMbekuh5X_1BOCXaOcUSMCTCsu',1761510611,1761510611),
(33,'juan.gomez','','juan.gomez@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'__zQQTgF9t74pjpZbueIr-5PwMpFKDUr8sTNG1BdHIYkoCTE1LZtCNk0ziWLhSlv',1761510619,1761510619),
(34,'soshnin','','soshnin@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'6owR7hkBMyBp3JpYPOXrPxoyRyCPZONp5YmLcNHqHhCNZG-2fsJ8wvpPuaT51Rwo',1761510620,1761510620),
(35,'plmaltais','','plmaltais@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'iiCDtiI0-QCE_TQNvB7zAx7manQWzj79ygf_xkXlqIXJzpGdh457wfPkiyv9Zvvo',1761510633,1761510633),
(36,'HelloWorld543','','HelloWorld543@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'yKDA0UYHBDw027_6r9ovgnNrMxP_TfpOJzuMRpoXfLiAtOoT3O5jrja54l3ubY7i',1761510634,1761510634),
(37,'jblood','','jblood@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'d4iOkX9rEuzUG-6MdHKJAurnpu58l8XXI5QYkTt1QNkZdOC9yQEjDvjUhiPHCFE-',1761510635,1761510635),
(38,'umar','','umar@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'yytgWvQ9XEVqLq5Pma30YpDdYIp2P5LQ-cTzG_EHdcj8EOwo2awNVcjfGaVulOcX',1761510648,1761510648),
(39,'SRXcraft','','SRXcraft@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'VeIfOcJxUmZ7uRCHZIu18PycAnTEgAjFZBH6rw28fiNTUmcrD1SbrANzxs2Wh_jA',1761510663,1761510663),
(40,'faizanjaved','','faizanjaved@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'L7iSDBup75LAPbOX2MloEVgntN6upomRnz2Dl9qjkN8kcF3mC9TFbz5avdvEPHOC',1761510665,1761510665),
(41,'avallejo','','avallejo@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'Pc7EkvwZqG15zwvVumM17bmMY_0wrOemnNGRUZMMKyc9nKrwP1kenxNUEffi-KFJ',1761510668,1761510668),
(42,'sancaka','','sancaka@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'5GRihF_dDM7OIF3NaEpC0FiGOfN7TTW2LRrBePeBK2OCDIUX16ugO-wSekALHHGb',1761510679,1761510679),
(43,'GeneticsBV','','GeneticsBV@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'FmwIcxxOShf8ZSiiS6iNbjafsHKo1UlFaZhZwWLteg6IbI4tYAD1X16GHVEQwpoZ',1761510680,1761510680),
(44,'kburkum','','kburkum@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'uCz1pSvi-nOpKg-tvrfoXpx2be_ahF4Q7zCXPFf26NMfqNSnPNpvHxIqW50WFoh_',1761510682,1761510682),
(45,'hnsz2002','','hnsz2002@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'27z2-ZVdZjh39AE2qloJy4fzCydRNTlBjKen2MGAEjNZRATnYrZcGadcGwzb_yPn',1761510683,1761510683),
(46,'Vigneshk','','Vigneshk@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'nvlSs7eHh_Wg2ayqe80ZynXqbgh1LctwvE9xwWbWFtoxjlb5VztAsmLiqSQ7hmTW',1761510740,1761510740),
(47,'mukeshchaubey','','mukeshchaubey@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'oYdYpH_dULqOJIMtHd1-Xv6_pKnJNFV8nSKIb1jxqSBarp_FHLiIS2B4qkcDT7bs',1761510747,1761510747),
(48,'purusoth','','purusoth@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'eTTcTv_QpCVcfFUsy5XWopkFTZ08WWZHL2dX_ZfEucvbpl4ulmQU-xRUNCCHMQbY',1761511809,1761511809),
(49,'Jo','','Jo@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'UVRbQ0BliTILUMEcmaX8wto7KDSo7biv2ToyaVNjW6MPamtlOsGcWHt3q880TAxO',1761511838,1761511838),
(50,'michael PAUL','','michael_PAUL@example.invalid','d41d8cd98f00b204e9800998ecf8427e',1,0,55,0,0,0,'lUyXNrOQ3QpshGSEJ5gv3A4_u1fTXR_EatFTsVVuFUWnEUq8bJDyQwMldLMzvRfA',1761511841,1761511841);
/*!40000 ALTER TABLE `mantis_user_table` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-28 19:31:00
