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

-- 테이블 yoga.t_cmm_cd_grp 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_cmm_cd_grp` (
  `CMM_GRP_CD` char(5) NOT NULL COMMENT '공통그룹코드',
  `CMM_CD_GRP_NM` varchar(50) DEFAULT NULL COMMENT '공통코드그룹명',
  `DSC` varchar(100) DEFAULT NULL COMMENT '설명',
  `SORT_SEQ` int(11) DEFAULT NULL COMMENT '정렬순서',
  `USE_YN` char(1) DEFAULT NULL COMMENT '사용여부',
  `REGR` varchar(30) DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `UPDR` varchar(30) DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`CMM_GRP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공통코드 그룹';

-- 테이블 데이터 yoga.t_cmm_cd_grp:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_cmm_cd_grp` DISABLE KEYS */;
INSERT INTO `t_cmm_cd_grp` (`CMM_GRP_CD`, `CMM_CD_GRP_NM`, `DSC`, `SORT_SEQ`, `USE_YN`, `REGR`, `REG_DT`, `UPDR`, `UPD_DT`) VALUES
	('CM001', '약관유형', NULL, 3, 'Y', 'SYSTEM', '2018-10-09 08:35:51', 'SYSTEM', '2018-10-09 08:35:52'),
	('CM002', '이메일도메인', NULL, 4, 'Y', 'SYSTEM', '2018-10-09 08:36:08', 'SYSTEM', '2018-10-09 08:36:12'),
	('GD001', '상품상태코드', NULL, 4, 'Y', 'SYSTEM', '2018-10-09 08:36:28', 'SYSTEM', '2018-10-09 08:36:29'),
	('MB001', '회원상태코드', NULL, 1, 'Y', 'SYSTEM', '2018-10-09 08:36:45', 'SYSTEM', '2018-10-09 08:36:46'),
	('MB002', '회원등급코드', NULL, 2, 'Y', 'SYSTEM', '2018-10-09 08:36:59', 'SYSTEM', '2018-10-09 08:37:00'),
	('WT001', '회원탈퇴사유코드', NULL, 1, 'Y', 'SYSTEM', '2018-12-31 19:01:36', 'SYSTEM', '2018-12-31 19:01:39');
/*!40000 ALTER TABLE `t_cmm_cd_grp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
