-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.2.12-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- yoga 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `yoga` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yoga`;

-- 테이블 yoga.t_cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_cart` (
  `CART_NO` int(11) NOT NULL AUTO_INCREMENT COMMENT '장바구니번호',
  `GD_CD` char(10) DEFAULT NULL COMMENT '상품코드',
  `VDO_CD` char(10) DEFAULT NULL COMMENT '비디오코드',
  `LOGIN_ID` varchar(50) DEFAULT NULL COMMENT '사용자ID',
  `TYPE` char(1) DEFAULT NULL COMMENT '온라인(V), 요가제품(G)',
  `AMT` int(11) DEFAULT NULL COMMENT '수량',
  `TOT_PRC` decimal(10,0) DEFAULT NULL COMMENT '가격',
  PRIMARY KEY (`CART_NO`),
  KEY `FK_T_GD_TO_T_CART` (`GD_CD`),
  KEY `FK_T_VDO_TO_T_CART` (`VDO_CD`),
  CONSTRAINT `FK_T_GD_TO_T_CART` FOREIGN KEY (`GD_CD`) REFERENCES `t_gd` (`GD_CD`),
  CONSTRAINT `FK_T_VDO_TO_T_CART` FOREIGN KEY (`VDO_CD`) REFERENCES `t_vdo` (`VDO_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='장바구니';

-- 테이블 데이터 yoga.t_cart:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_cart` DISABLE KEYS */;
INSERT INTO `t_cart` (`CART_NO`, `GD_CD`, `VDO_CD`, `LOGIN_ID`, `TYPE`, `AMT`, `TOT_PRC`) VALUES
	(15, NULL, '1000000079', 'testtest44!', 'V', 1, NULL),
	(16, 'G000000482', NULL, 'testtest44!', 'G', 5, NULL),
	(17, 'G000000476', NULL, 'testtest44!', 'G', 3, NULL),
	(18, 'G000000485', NULL, 'test3333!', 'G', 1, NULL),
	(19, 'G000000481', NULL, 'test3333!', 'G', 3, NULL),
	(20, 'G000000201', NULL, 'test3333!', 'G', 3, 60000),
	(21, NULL, '1000000075', 'test5555!', 'V', 1, 300),
	(22, 'G000000207', NULL, 'test5555!', 'G', 3, 60000);
/*!40000 ALTER TABLE `t_cart` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
