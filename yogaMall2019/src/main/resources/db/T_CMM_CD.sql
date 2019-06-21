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

-- 테이블 yoga.t_cmm_cd 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_cmm_cd` (
  `CMM_GRP_CD` char(5) NOT NULL COMMENT '공통그룹코드',
  `CMM_CD` char(10) NOT NULL COMMENT '공통코드',
  `CMM_CD_NM` varchar(50) DEFAULT NULL COMMENT '공통코드명',
  `DSC` varchar(100) DEFAULT NULL COMMENT '설명',
  `SORT_SEQ` int(11) DEFAULT NULL COMMENT '정렬순서',
  `USE_YN` char(1) DEFAULT NULL COMMENT '사용여부',
  `REGR` varchar(30) DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `UPDR` varchar(30) DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`CMM_GRP_CD`,`CMM_CD`),
  CONSTRAINT `FK_T_CMM_CD_GRP_TO_T_CMM_CD` FOREIGN KEY (`CMM_GRP_CD`) REFERENCES `t_cmm_cd_grp` (`CMM_GRP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공통코드';

-- 테이블 데이터 yoga.t_cmm_cd:~29 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_cmm_cd` DISABLE KEYS */;
INSERT INTO `t_cmm_cd` (`CMM_GRP_CD`, `CMM_CD`, `CMM_CD_NM`, `DSC`, `SORT_SEQ`, `USE_YN`, `REGR`, `REG_DT`, `UPDR`, `UPD_DT`) VALUES
	('CM001', '10', '서비스 이용약관', NULL, 1, 'Y', 'SYSTEM', '2018-10-09 08:38:25', 'SYSTEM', '2018-10-09 08:38:26'),
	('CM001', '20', '개인정보 취급방침', NULL, 2, 'Y', 'SYSTEM', '2018-10-09 08:38:53', 'SYSTEM', '2018-10-09 08:38:54'),
	('CM001', '30', '개인정보 수집 및 이용안내에 대한 동의', NULL, 3, 'Y', 'SYSTEM', '2018-10-09 08:39:15', 'SYSTEM', '2018-10-09 08:40:09'),
	('CM001', '40', '마케팅 활용을 위한 개인정보 제 3자 제공 동의', NULL, 4, 'Y', 'SYSTEM', '2018-10-09 08:40:03', 'SYSTEM', '2018-10-09 08:40:04'),
	('CM002', '11', 'naver.com', 'naver.com', 1, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '12', 'daum.net', 'daum.net', 2, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '13', 'nate.com', 'nate.com', 3, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '14', 'gmail.com', 'gmail.com', 4, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '15', 'yahoo.com', 'yahoo.com', 5, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '16', 'hotmail.com', 'hotmail.com', 6, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '17', 'dreamwiz.com', 'dreamwiz.com', 7, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '18', 'korea.com', 'korea.com', 8, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('CM002', '19', 'netian.com', 'netian.com', 9, 'Y', 'SYSTEM', '2018-08-14 17:53:59', 'SYSTEM', '2018-08-14 17:53:59'),
	('GD001', '10', '등록', NULL, 1, 'Y', 'SYSTEM', '2018-10-09 08:41:29', 'SYSTEM', '2018-10-09 08:41:30'),
	('GD001', '20', '승인요청', NULL, 2, 'Y', 'SYSTEM', '2018-10-09 08:41:49', 'SYSTEM', '2018-10-09 08:41:50'),
	('GD001', '30', '승인완료', NULL, 3, 'Y', 'SYSTEM', '2018-10-09 08:42:10', 'SYSTEM', '2018-10-09 08:42:11'),
	('GD001', '40', '판매중', NULL, 4, 'Y', 'SYSTEM', '2018-10-09 08:42:26', 'SYSTEM', '2018-10-09 08:42:28'),
	('GD001', '50', '일시품절', NULL, 5, 'Y', 'SYSTEM', '2018-10-09 08:42:56', 'SYSTEM', '2018-10-09 08:42:57'),
	('GD001', '60', '품절', NULL, 6, 'Y', 'SYSTEM', '2018-10-09 08:43:21', 'SYSTEM', '2018-10-09 08:43:22'),
	('MB001', '10', '정상', NULL, 1, 'Y', 'SYSTEM', '2018-10-09 08:43:53', 'SYSTEM', '2018-10-09 08:43:54'),
	('MB001', '20', '휴면', NULL, 2, 'Y', 'SYSTEM', '2018-10-09 08:43:57', 'SYSTEM', '2018-10-09 08:43:56'),
	('MB001', '30', '탈퇴', NULL, 3, 'Y', 'SYSTEM', '2018-10-09 08:44:16', 'SYSTEM', '2018-10-09 08:44:30'),
	('MB002', 'GOLD', '골드', NULL, 2, 'Y', 'SYSTEM', '2018-10-09 08:44:55', 'SYSTEM', '2018-10-09 08:44:56'),
	('MB002', 'SILVER', '실버', NULL, 1, 'Y', 'SYSTEM', '2018-12-29 16:12:47', 'SYSTEM', '2018-12-29 16:12:54'),
	('MB002', 'VIP', 'VIP', NULL, 3, 'Y', 'SYSTEM', '2018-10-09 08:44:59', 'SYSTEM', '2018-10-09 08:44:59'),
	('WT001', '10', '온라인 강의 부족', NULL, 1, 'Y', 'SYSTEM', '2018-12-31 19:02:14', 'SYSTEM', '2018-12-31 19:02:16'),
	('WT001', '20', '온라인 강의 불만족', NULL, 2, 'Y', 'SYSTEM', '2018-12-31 19:03:40', 'SYSTEM', '2018-12-31 19:03:41'),
	('WT001', '30', '타 사이트 이용', NULL, 3, 'Y', 'SYSTEM', '2018-12-31 19:04:52', 'SYSTEM', '2018-12-31 19:04:53'),
	('WT001', '40', '사이트 이용 불편', NULL, 4, 'Y', 'SYSTEM', '2018-12-31 19:33:14', 'SYSTEM', '2018-12-31 19:33:15'),
	('WT001', '50', '기타', NULL, 5, 'Y', 'SYSTEM', '2018-12-31 19:42:42', 'SYSTEM', '2018-12-31 19:42:43');
/*!40000 ALTER TABLE `t_cmm_cd` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
