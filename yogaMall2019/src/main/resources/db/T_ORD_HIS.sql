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

-- 테이블 yoga.t_ord_his 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_ord_his` (
  `MBR_NO` char(10) NOT NULL COMMENT '회원번호',
  `MBR_NM` varchar(50) DEFAULT NULL COMMENT '회원명',
  `CP_NO` varchar(40) DEFAULT NULL COMMENT '전화번호',
  `ZIPCODE` char(5) DEFAULT NULL COMMENT '우편번호',
  `ADDR` varchar(100) DEFAULT NULL COMMENT '도로명주소',
  `REQ` varchar(50) DEFAULT NULL COMMENT '요청사항',
  `ORD_DT` date DEFAULT NULL COMMENT '주문/결제 날짜',
  `TOTAL_PRC` int(11) DEFAULT NULL COMMENT '총 결제 금액',
  `GD_CD` char(10) DEFAULT NULL COMMENT '상품 코드',
  `VDO_CD` char(10) DEFAULT NULL COMMENT '동영상 코드',
  PRIMARY KEY (`MBR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문/결제테이블\r\n';

-- 테이블 데이터 yoga.t_ord_his:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_ord_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ord_his` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
