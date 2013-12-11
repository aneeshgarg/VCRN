/*
SQLyog Ultimate v8.55 
MySQL - 5.5.15 : Database - vcrn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vcrn` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vcrn`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `acct_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`acct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`acct_id`,`status`,`role`,`doctor_id`,`username`,`password`) values (1,1,'patient',4,'julie','julie'),(2,1,'patient',4,'john','john'),(3,1,'patient',4,'tyler','tyler'),(4,1,'medicalprofessional',NULL,'sara','sara');

/*Table structure for table `diet_table` */

DROP TABLE IF EXISTS `diet_table`;

CREATE TABLE `diet_table` (
  `diet_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `calories` double DEFAULT NULL,
  `sodium` double DEFAULT NULL,
  `food_name` varchar(40) DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `cholestrol` double DEFAULT NULL,
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `diet_table` */

insert  into `diet_table`(`diet_id`,`log_id`,`calories`,`sodium`,`food_name`,`fat`,`cholestrol`) values (1,1,256,403,'oatmeal-3/4 cup',8,NULL),(2,1,500,300,'tuna salad sandwich ',7,NULL),(3,1,33,100,'bread,wheat-1/2 slice',2,NULL),(4,2,90,10,'iced green tea-16 fl oz ',3,NULL),(5,2,70,2,'apple ',0.3,NULL),(6,3,45,0,'orange ',0.1,NULL),(11,6,120,504,'Dal',3,25),(12,6,220,450,'Turkey',34,52),(13,7,120,504,'Dal',3,25),(14,7,220,450,'Turkey',34,52),(15,8,120,504,'Dal',3,25),(16,8,220,450,'Turkey',34,52),(17,9,1700,1500,'rice',1635,200);

/*Table structure for table `exercise` */

DROP TABLE IF EXISTS `exercise`;

CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `exercise_name` varchar(50) DEFAULT NULL,
  `time_to_spend` varchar(20) DEFAULT NULL,
  `repetitions` varchar(20) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `exercise` */

insert  into `exercise`(`exercise_id`,`plan_id`,`exercise_name`,`time_to_spend`,`repetitions`,`weight`) values (1,1,'walking ','30 min','2 times/d',210),(2,2,'walking ','1 h','2 times/d',250),(3,3,'walking ','30 min ','once/day ',170),(4,4,'UpdatedExercise','30 min','2 times/d',210),(5,5,'UpdatedExercise','30 min','2 times/d',210);

/*Table structure for table `medication` */

DROP TABLE IF EXISTS `medication`;

CREATE TABLE `medication` (
  `medication_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `time_to_take` varchar(20) DEFAULT NULL,
  `medicine_name` varchar(30) DEFAULT NULL,
  `dosage` varchar(11) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `medication` */

insert  into `medication`(`medication_id`,`plan_id`,`time_to_take`,`medicine_name`,`dosage`,`type`) values (1,1,'8 am ','atorvastatin ','10 mg ','antilipidemic'),(2,2,'7am,3pm, 11pm','propranolo','10mg ','antidysrhythmic '),(3,3,'8am ','enalapril ','5 mg ','antihypertensive'),(4,4,'Thrice in a day','atorvastatin ','10 mg ','antilipidemic'),(5,5,'Thrice in a day','atorvastatin ','10 mg ','antilipidemic');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `notification` */

insert  into `notification`(`notification_id`,`patient_id`,`doctor_id`,`message`,`subject`,`create_time`) values (1,1,4,'blood pressure is higher than acceptable level ','blood pressure ','2013-11-23 11:32:20'),(2,2,4,'The patient took more calories than planned ','diet ','2013-10-01 14:42:56'),(5,1,4,'Patient has abnormal pulse. Patient has abnormal blood pressure. ','Abnormal Pulse. Abnormal Blood Pressure. ','2013-11-26 11:56:30'),(6,1,4,'Patient has abnormal pulse. Patient has abnormal blood pressure. ','Abnormal Pulse. Abnormal Blood Pressure. ','2013-12-01 17:36:18'),(7,4,4,'Report cannot be generated for patient\'s log entry dated Sat Nov 30 19:00:00 EST 2013','Report generation failed.','2013-12-01 17:36:22'),(8,1,4,'Patient has abnormal pulse. Patient has abnormal blood pressure. ','Abnormal Pulse. Abnormal Blood Pressure. ','2013-12-01 17:41:17');

/*Table structure for table `patient_health_data` */

DROP TABLE IF EXISTS `patient_health_data`;

CREATE TABLE `patient_health_data` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_pressure` varchar(11) DEFAULT NULL,
  `pulse` int(11) DEFAULT NULL,
  `acct_id` int(11) NOT NULL,
  `calorie_index` double DEFAULT NULL,
  `sodium_consumption` double DEFAULT NULL,
  `bmi_index` double DEFAULT NULL,
  `cholestrol_index` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `patient_health_data` */

insert  into `patient_health_data`(`file_id`,`blood_pressure`,`pulse`,`acct_id`,`calorie_index`,`sodium_consumption`,`bmi_index`,`cholestrol_index`,`weight`,`height`) values (1,'140/85',85,1,NULL,1700,NULL,NULL,210,72),(2,'150/95',105,2,NULL,2500,NULL,NULL,250,75),(3,'110/70',65,3,NULL,1500,NULL,NULL,170,74);

/*Table structure for table `personal_info` */

DROP TABLE IF EXISTS `personal_info`;

CREATE TABLE `personal_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `acct_id` int(11) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `personal_info` */

insert  into `personal_info`(`info_id`,`email`,`gender`,`dob`,`acct_id`,`first_name`,`last_name`) values (1,'sa_g54@yahoo.com','female','1960-11-02',1,'Julie','Brown'),(2,'fg_6_hi@hotmail.com','male','1950-04-05',2,'John','Smith'),(3,'sd_89_er@gmail.com','male ','1955-03-02',3,'Tyler','Cameron'),(4,'tr_87@gmail.com','female','1970-04-06',4,'Sara','French');

/*Table structure for table `rehab_log` */

DROP TABLE IF EXISTS `rehab_log`;

CREATE TABLE `rehab_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `acct_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `pulse` int(5) DEFAULT NULL,
  `blood_pressure` varchar(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `medicine_taken` tinyint(4) DEFAULT NULL,
  `exercise_done` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `rehab_log` */

insert  into `rehab_log`(`log_id`,`acct_id`,`create_date`,`pulse`,`blood_pressure`,`weight`,`medicine_taken`,`exercise_done`) values (1,1,'2013-11-22 09:47:05',85,'140/85',210,1,0),(2,2,'2013-11-12 09:47:05',105,'150/95',250,0,1),(3,3,'2013-11-22 09:47:05',65,'110/70',170,1,1),(6,1,'2013-11-25 19:00:00',120,'150/120',134.5,0,0),(7,1,'2013-11-30 19:00:00',120,'150/120',134.5,0,0),(8,1,'2013-11-30 19:00:00',120,'150/120',134.5,0,0),(9,1,'2013-12-02 13:32:26',80,'120/70',220,0,1);

/*Table structure for table `rehab_plan` */

DROP TABLE IF EXISTS `rehab_plan`;

CREATE TABLE `rehab_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `sodium_goal` double DEFAULT NULL,
  `calorie_goal` double DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `lap` double DEFAULT NULL,
  `hap` double DEFAULT NULL,
  `cholestrol_goal` double DEFAULT NULL,
  `habp` varchar(11) DEFAULT NULL,
  `labp` varchar(11) DEFAULT NULL,
  `bmi_goal` double DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `template_foreign_key` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `rehab_plan` */

insert  into `rehab_plan`(`plan_id`,`sodium_goal`,`calorie_goal`,`create_date`,`update_date`,`lap`,`hap`,`cholestrol_goal`,`habp`,`labp`,`bmi_goal`,`template_id`,`patient_id`,`doctor_id`) values (1,1500,1700,'2013-11-05','2013-11-07',70,100,200,'150/90','100/70',22,1,NULL,NULL),(2,1000,1900,'2013-11-05','2013-11-08',70,100,200,'150/90','100/70',23,2,NULL,NULL),(3,1500,1800,'2013-11-06','2013-11-09',70,100,200,'150/90','100/70',22,3,NULL,NULL),(4,1500,1700,'2013-11-24','2013-11-30',70,100,200,'150/90','100/70',1635,1,1,4),(5,1500,1700,'2013-11-30','2013-12-01',70,100,200,'150/90','100/70',1635,1,2,4);

/*Table structure for table `rehabplantemplate` */

DROP TABLE IF EXISTS `rehabplantemplate`;

CREATE TABLE `rehabplantemplate` (
  `planname` varchar(20) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `rehabplantemplate` */

insert  into `rehabplantemplate`(`planname`,`plan_id`,`template_id`) values ('Baseline Plan',1,1),('Obese Patient Plan',2,2),('Elderly Patient Plan',3,3);

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `cholestrol` varchar(50) DEFAULT NULL,
  `fat` varchar(50) DEFAULT NULL,
  `exercise` varchar(50) DEFAULT NULL,
  `medication` varchar(50) DEFAULT NULL,
  `sodium` varchar(50) DEFAULT NULL,
  `calories` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `overall_score` double DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `report` */

insert  into `report`(`report_id`,`patient_id`,`cholestrol`,`fat`,`exercise`,`medication`,`sodium`,`calories`,`create_date`,`overall_score`) values (1,1,'Not Met','Met','Did not do exercise','Took medication ','Met','Not Met','2013-10-26 11:56:30',50),(2,2,'Not Met','Not Met','Did not do exercise ','Did not take medication ','Not Met','Not Met','2013-11-16 11:56:30',0),(3,3,'Met','Met','Did exercise ','Took medication ','Met','Met','2013-11-06 11:56:30',100),(5,1,'Met','Not Met','Did Not Exercise','Did Not Take Medication','Met','Met','2013-11-26 11:56:30',50),(6,1,'Met','Met','Did Not Exercise','Did Not Take Medication','Met','Met','2013-12-01 17:41:19',66.66666666666667),(7,1,'Met','Met','Did Exercise','Did Not Take Medication','Met','Met','2013-12-02 13:32:26',83.33333333333333);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
