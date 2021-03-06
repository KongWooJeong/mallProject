-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.2.16-MariaDB - mariadb.org binary distribution
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

-- 테이블 데이터 yoga.t_vdo_prc:~102 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_vdo_prc` DISABLE KEYS */;
INSERT INTO `t_vdo_prc` (`VDO_CD`, `APPL_DT`, `VDO_PRC`, `REGR`, `REG_DT`, `UPDR`, `UPD_DT`) VALUES
	('1000000001', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000002', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000003', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000004', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000005', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000006', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000007', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000008', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000009', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000010', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000011', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000012', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000013', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000014', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000015', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000016', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000017', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000018', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000019', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000020', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000021', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000024', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000026', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000030', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000031', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000032', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000038', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000039', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000040', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000041', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000042', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000043', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000044', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000045', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000046', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000047', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000048', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000049', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000050', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000051', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000052', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000053', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000054', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000055', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000056', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000057', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000058', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000059', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000060', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000061', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000062', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000063', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000064', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000065', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000066', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000067', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000071', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000072', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000073', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000074', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000075', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000076', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000077', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000078', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000079', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000080', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000081', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000082', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000083', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000084', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000085', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000086', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000087', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000088', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000089', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000090', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000091', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000092', '2018-10-27 00:00:00', 200, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000093', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000094', '2018-10-27 00:00:00', 300, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000095', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000096', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000097', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000098', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000099', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000100', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000101', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000102', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000103', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000104', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000105', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37'),
	('1000000106', '2018-10-27 00:00:00', 100, 'SYSTEM', '2018-10-27 14:17:36', 'SYSTEM', '2018-10-27 14:17:37');
/*!40000 ALTER TABLE `t_vdo_prc` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
