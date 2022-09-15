-- --------------------------------------------------------
-- 호스트:                          localhost
-- 서버 버전:                        8.0.29 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 ict.basket 구조 내보내기
DROP TABLE IF EXISTS `basket`;
CREATE TABLE IF NOT EXISTS `basket` (
  `basket_no` int NOT NULL AUTO_INCREMENT,
  `mno` int NOT NULL,
  `prdt_no` int NOT NULL,
  `buy_qty` int NOT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`basket_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.ckboard 구조 내보내기
DROP TABLE IF EXISTS `ckboard`;
CREATE TABLE IF NOT EXISTS `ckboard` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `mno` int NOT NULL,
  `contents` varchar(1500) NOT NULL,
  `view_cnt` int DEFAULT '0',
  `write_date` datetime NOT NULL,
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.code_dong 구조 내보내기
DROP TABLE IF EXISTS `code_dong`;
CREATE TABLE IF NOT EXISTS `code_dong` (
  `dong_code` varchar(10) NOT NULL,
  `dong_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dong_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.code_gugun 구조 내보내기
DROP TABLE IF EXISTS `code_gugun`;
CREATE TABLE IF NOT EXISTS `code_gugun` (
  `gugun_code` varchar(10) NOT NULL,
  `gugun_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`gugun_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.code_sido 구조 내보내기
DROP TABLE IF EXISTS `code_sido`;
CREATE TABLE IF NOT EXISTS `code_sido` (
  `sido_code` varchar(10) NOT NULL,
  `sido_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sido_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.common_code 구조 내보내기
DROP TABLE IF EXISTS `common_code`;
CREATE TABLE IF NOT EXISTS `common_code` (
  `code_no` int NOT NULL,
  `code_class` varchar(30) NOT NULL,
  `code_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.credit_card 구조 내보내기
DROP TABLE IF EXISTS `credit_card`;
CREATE TABLE IF NOT EXISTS `credit_card` (
  `card_no` int NOT NULL AUTO_INCREMENT,
  `card_name` varchar(60) NOT NULL,
  `mno` int NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `expiry_date_month` varchar(2) NOT NULL,
  `expiry_date_year` varchar(4) NOT NULL,
  `cvc_code` varchar(3) NOT NULL,
  `pwd` varchar(2) NOT NULL,
  `used_date` datetime NOT NULL,
  `reg_date` datetime NOT NULL,
  `del_yn` int DEFAULT '0',
  `del_date` datetime DEFAULT NULL,
  PRIMARY KEY (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.delivery_address 구조 내보내기
DROP TABLE IF EXISTS `delivery_address`;
CREATE TABLE IF NOT EXISTS `delivery_address` (
  `addr_no` int NOT NULL AUTO_INCREMENT,
  `addr_name` varchar(60) NOT NULL,
  `mno` int NOT NULL,
  `recipient_name` varchar(60) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `addr1` varchar(150) NOT NULL,
  `addr2` varchar(150) NOT NULL,
  `used_date` datetime NOT NULL,
  `del_yn` int DEFAULT '0',
  PRIMARY KEY (`addr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.freeboard 구조 내보내기
DROP TABLE IF EXISTS `freeboard`;
CREATE TABLE IF NOT EXISTS `freeboard` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `writer` varchar(60) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `contents` varchar(1500) NOT NULL,
  `write_date` datetime NOT NULL,
  `view_cnt` int DEFAULT '0',
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.member 구조 내보내기
DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `mpwd` varchar(20) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mdate` datetime NOT NULL,
  `service_agree` varchar(5) NOT NULL DEFAULT 'true',
  `info_agree` varchar(5) NOT NULL DEFAULT 'true',
  `sms_agree` varchar(5) NOT NULL DEFAULT 'false',
  `email_agree` varchar(5) NOT NULL DEFAULT 'false',
  `post_code` varchar(10) DEFAULT NULL,
  `addr1` varchar(150) DEFAULT NULL,
  `addr2` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.memberboard 구조 내보내기
DROP TABLE IF EXISTS `memberboard`;
CREATE TABLE IF NOT EXISTS `memberboard` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `mno` int NOT NULL,
  `contents` varchar(1500) NOT NULL,
  `view_cnt` int DEFAULT '0',
  `write_date` datetime NOT NULL,
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.order_detail 구조 내보내기
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `detail_no` int NOT NULL AUTO_INCREMENT,
  `order_no` int NOT NULL,
  `prdt_no` int NOT NULL,
  `detail_qty` int NOT NULL,
  `detail_price` int NOT NULL,
  `detail_amt` int NOT NULL,
  `detail_discount` int DEFAULT NULL,
  `detail_discount_amt` int NOT NULL,
  `detail_pay_amt` int NOT NULL,
  `order_status` int DEFAULT '3',
  `invoice_company` varchar(45) DEFAULT NULL,
  `invoice_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`detail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.order_main 구조 내보내기
DROP TABLE IF EXISTS `order_main`;
CREATE TABLE IF NOT EXISTS `order_main` (
  `order_no` int NOT NULL AUTO_INCREMENT,
  `mno` int NOT NULL,
  `card_no` int NOT NULL,
  `addr_no` int NOT NULL,
  `order_product_cnt` int NOT NULL,
  `order_amt` int NOT NULL,
  `discount_amt` int DEFAULT NULL,
  `pay_amt` int NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` int DEFAULT '3',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.product 구조 내보내기
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prdt_no` int NOT NULL AUTO_INCREMENT,
  `prdt_name` varchar(60) NOT NULL,
  `mno` int NOT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `discount` double NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `view_cnt` int DEFAULT '0',
  `reg_date` datetime DEFAULT NULL,
  `del_yn` int DEFAULT '0',
  `del_date` datetime DEFAULT NULL,
  `thumbnail_name` varchar(100) NOT NULL,
  `thumbnail_path` varchar(100) NOT NULL,
  `prdt_img_name` varchar(100) DEFAULT NULL,
  `prdt_img_path` varchar(100) DEFAULT NULL,
  `desc_img_name` varchar(100) DEFAULT NULL,
  `desc_img_path` varchar(100) DEFAULT NULL,
  `add_file_name` varchar(100) DEFAULT NULL,
  `add_file_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`prdt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ict.product_reply 구조 내보내기
DROP TABLE IF EXISTS `product_reply`;
CREATE TABLE IF NOT EXISTS `product_reply` (
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `prdt_no` int NOT NULL,
  `mno` int NOT NULL,
  `reply_class` int NOT NULL,
  `contents` varchar(1500) NOT NULL,
  `reply_date` datetime NOT NULL,
  PRIMARY KEY (`reply_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
