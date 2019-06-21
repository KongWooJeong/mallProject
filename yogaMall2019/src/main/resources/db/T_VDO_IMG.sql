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

-- 테이블 데이터 yoga.t_vdo_img:~102 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_vdo_img` DISABLE KEYS */;
INSERT INTO `t_vdo_img` (`VDO_IMG_CD`, `VDO_CD`, `VDO_IMG_URL`, `REGR`, `REG_DT`, `UPDR`, `UPD_DT`) VALUES
	('1000000001', '1000000001', 'https://img.youtube.com/vi/EF3ZUY387qY/0.jpg', 'SYSTEM', '2018-10-25 17:52:44', 'SYSTEM', '2018-10-25 17:52:46'),
	('1000000002', '1000000002', 'https://img.youtube.com/vi/OaTrP7NJ1g4/0.jpg', 'SYSTEM', '2018-10-25 17:54:20', 'SYSTEM', '2018-10-25 17:55:06'),
	('1000000003', '1000000003', 'https://img.youtube.com/vi/j1Or5-wJ3Ps/0.jpg', 'SYSTEM', '2018-10-25 17:54:21', 'SYSTEM', '2018-10-25 17:55:06'),
	('1000000004', '1000000004', 'https://img.youtube.com/vi/dl6mhepZ0SM/0.jpg', 'SYSTEM', '2018-10-25 17:54:21', 'SYSTEM', '2018-10-25 17:55:07'),
	('1000000005', '1000000005', 'https://img.youtube.com/vi/newmHqnNea4/0.jpg', 'SYSTEM', '2018-10-25 17:54:21', 'SYSTEM', '2018-10-25 17:55:07'),
	('1000000006', '1000000006', 'https://img.youtube.com/vi/BxPerqfxgHA/0.jpg', 'SYSTEM', '2018-10-25 17:54:22', 'SYSTEM', '2018-10-25 17:55:08'),
	('1000000007', '1000000007', 'https://img.youtube.com/vi/PFKeGl4PsqQ/0.jpg', 'SYSTEM', '2018-10-25 17:54:22', 'SYSTEM', '2018-10-25 17:55:08'),
	('1000000008', '1000000008', 'https://img.youtube.com/vi/R0dhh13qzgI/0.jpg', 'SYSTEM', '2018-10-25 17:54:24', 'SYSTEM', '2018-10-25 17:55:09'),
	('1000000009', '1000000009', 'https://img.youtube.com/vi/NU4MrfdMWGg/0.jpg', 'SYSTEM', '2018-10-25 17:54:25', 'SYSTEM', '2018-10-25 17:55:09'),
	('1000000010', '1000000010', 'https://img.youtube.com/vi/S4jbPOcR33g/0.jpg', 'SYSTEM', '2018-10-25 17:54:25', 'SYSTEM', '2018-10-25 17:55:10'),
	('1000000011', '1000000011', 'https://img.youtube.com/vi/I-bD6ey7S94/0.jpg', 'SYSTEM', '2018-10-25 17:54:25', 'SYSTEM', '2018-10-25 17:55:10'),
	('1000000012', '1000000012', 'https://img.youtube.com/vi/5dTfcUWluOY/0.jpg', 'SYSTEM', '2018-10-25 17:54:26', 'SYSTEM', '2018-10-25 17:55:11'),
	('1000000013', '1000000013', 'https://img.youtube.com/vi/BSG_ddmhxLw/0.jpg', 'SYSTEM', '2018-10-25 17:54:26', 'SYSTEM', '2018-10-25 17:55:11'),
	('1000000014', '1000000014', 'https://img.youtube.com/vi/O0yp0Oj8SMA/0.jpg', 'SYSTEM', '2018-10-25 17:54:27', 'SYSTEM', '2018-10-25 17:55:12'),
	('1000000015', '1000000015', 'https://img.youtube.com/vi/RkqefuOAXbU/0.jpg', 'SYSTEM', '2018-10-25 17:54:27', 'SYSTEM', '2018-10-25 17:55:12'),
	('1000000016', '1000000016', 'https://img.youtube.com/vi/Om3QSSw1Lxg/0.jpg', 'SYSTEM', '2018-10-25 17:54:28', 'SYSTEM', '2018-10-25 17:55:13'),
	('1000000017', '1000000017', 'https://img.youtube.com/vi/2bxjNErxo84/0.jpg', 'SYSTEM', '2018-10-25 17:54:28', 'SYSTEM', '2018-10-25 17:55:13'),
	('1000000018', '1000000018', 'https://img.youtube.com/vi/uNXa3Y-o778/0.jpg', 'SYSTEM', '2018-10-25 17:54:29', 'SYSTEM', '2018-10-25 17:55:14'),
	('1000000019', '1000000019', 'https://img.youtube.com/vi/XL-oDD9QE5E/0.jpg', 'SYSTEM', '2018-10-25 17:54:29', 'SYSTEM', '2018-10-25 17:55:14'),
	('1000000020', '1000000020', 'https://img.youtube.com/vi/9f_OrXs8Z1k/0.jpg', 'SYSTEM', '2018-10-25 17:54:29', 'SYSTEM', '2018-10-25 17:55:15'),
	('1000000021', '1000000021', 'https://img.youtube.com/vi/KDq3nMWAcTM/0.jpg', 'SYSTEM', '2018-10-25 17:54:30', 'SYSTEM', '2018-10-25 17:55:15'),
	('1000000024', '1000000024', 'https://img.youtube.com/vi/dW1wBJWPc50/0.jpg', 'SYSTEM', '2018-10-25 17:54:31', 'SYSTEM', '2018-10-25 17:55:16'),
	('1000000026', '1000000026', 'https://img.youtube.com/vi/gSAp2cs66rs/0.jpg', 'SYSTEM', '2018-10-25 17:54:32', 'SYSTEM', '2018-10-25 17:55:17'),
	('1000000030', '1000000030', 'https://img.youtube.com/vi/hUQT9xsfZc8/0.jpg', 'SYSTEM', '2018-10-25 17:54:36', 'SYSTEM', '2018-10-25 17:55:19'),
	('1000000031', '1000000031', 'https://img.youtube.com/vi/54-1SWq1BkM/0.jpg', 'SYSTEM', '2018-10-25 17:54:37', 'SYSTEM', '2018-10-25 17:55:20'),
	('1000000032', '1000000032', 'https://img.youtube.com/vi/JOcVhCwkEnc/0.jpg', 'SYSTEM', '2018-10-25 17:54:37', 'SYSTEM', '2018-10-25 17:55:24'),
	('1000000038', '1000000038', 'https://img.youtube.com/vi/NlMjP_uaIW8/0.jpg', 'SYSTEM', '2018-10-25 17:54:40', 'SYSTEM', '2018-10-25 17:55:27'),
	('1000000039', '1000000039', 'https://img.youtube.com/vi/pimwxjWwn_0/0.jpg', 'SYSTEM', '2018-10-25 17:54:40', 'SYSTEM', '2018-10-25 17:55:28'),
	('1000000040', '1000000040', 'https://img.youtube.com/vi/Yohn7gM5V3g/0.jpg', 'SYSTEM', '2018-10-25 17:54:41', 'SYSTEM', '2018-10-25 17:55:28'),
	('1000000041', '1000000041', 'https://img.youtube.com/vi/yOrYXSQ33y8/0.jpg', 'SYSTEM', '2018-10-25 17:54:41', 'SYSTEM', '2018-10-25 17:55:29'),
	('1000000042', '1000000042', 'https://img.youtube.com/vi/gVKZDsQTyt4/0.jpg', 'SYSTEM', '2018-10-25 17:54:42', 'SYSTEM', '2018-10-25 17:55:29'),
	('1000000043', '1000000043', 'https://img.youtube.com/vi/RyG_Ad-LscU/0.jpg', 'SYSTEM', '2018-10-25 17:54:42', 'SYSTEM', '2018-10-25 17:55:29'),
	('1000000044', '1000000044', 'https://img.youtube.com/vi/aZY1UZ_946k/0.jpg', 'SYSTEM', '2018-10-25 17:54:43', 'SYSTEM', '2018-10-25 17:55:30'),
	('1000000045', '1000000045', 'https://img.youtube.com/vi/K5gMsOgb_8M/0.jpg', 'SYSTEM', '2018-10-25 17:54:43', 'SYSTEM', '2018-10-25 17:55:31'),
	('1000000046', '1000000046', 'https://img.youtube.com/vi/5WmthsLEAXQ/0.jpg', 'SYSTEM', '2018-10-25 17:54:43', 'SYSTEM', '2018-10-25 17:55:32'),
	('1000000047', '1000000047', 'https://img.youtube.com/vi/s3gi_uWY_UM/0.jpg', 'SYSTEM', '2018-10-25 17:54:44', 'SYSTEM', '2018-10-25 17:55:33'),
	('1000000048', '1000000048', 'https://img.youtube.com/vi/f2QGhN1eL80/0.jpg', 'SYSTEM', '2018-10-25 17:54:44', 'SYSTEM', '2018-10-25 17:55:34'),
	('1000000049', '1000000049', 'https://img.youtube.com/vi/mshArT73Rs8/0.jpg', 'SYSTEM', '2018-10-25 17:59:39', 'SYSTEM', '2018-10-25 18:00:04'),
	('1000000050', '1000000050', 'https://img.youtube.com/vi/BK0sNDjzHMk/0.jpg', 'SYSTEM', '2018-10-25 19:46:40', 'SYSTEM', '2018-10-25 19:46:42'),
	('1000000051', '1000000051', 'https://img.youtube.com/vi/0UpBZUbv2ns/0.jpg', 'SYSTEM', '2018-10-25 19:46:48', 'SYSTEM', '2018-10-25 19:46:50'),
	('1000000052', '1000000052', 'https://img.youtube.com/vi/AagbMTOpExA/0.jpg', 'SYSTEM', '2018-10-25 19:46:55', 'SYSTEM', '2018-10-25 19:46:58'),
	('1000000053', '1000000053', 'https://img.youtube.com/vi/NNkKPmqWCG8/0.jpg', 'SYSTEM', '2018-10-25 19:47:01', 'SYSTEM', '2018-10-25 19:47:03'),
	('1000000054', '1000000054', 'https://img.youtube.com/vi/P44eOwUORnA/0.jpg', 'SYSTEM', '2018-10-25 19:47:11', 'SYSTEM', '2018-10-25 19:47:13'),
	('1000000055', '1000000055', 'https://img.youtube.com/vi/MKK0Mp_h70E/0.jpg', 'SYSTEM', '2018-10-25 19:47:20', 'SYSTEM', '2018-10-25 19:47:26'),
	('1000000056', '1000000056', 'https://img.youtube.com/vi/AFuojbzVNhg/0.jpg', 'SYSTEM', '2018-10-25 19:47:33', 'SYSTEM', '2018-10-25 19:47:36'),
	('1000000057', '1000000057', 'https://img.youtube.com/vi/gBNPJDfnX98/0.jpg', 'SYSTEM', '2018-10-25 19:47:39', 'SYSTEM', '2018-10-25 19:47:41'),
	('1000000058', '1000000058', 'https://img.youtube.com/vi/opU2FYW0TDM/0.jpg', 'SYSTEM', '2018-10-25 19:47:43', 'SYSTEM ', '2018-10-25 19:47:45'),
	('1000000059', '1000000059', 'https://img.youtube.com/vi/g1lX2GdPymg/0.jpg', 'SYSTEM', '2018-10-25 19:47:48', 'SYSTEM', '2018-10-25 19:47:50'),
	('1000000060', '1000000060', 'https://img.youtube.com/vi/fMQ9ytyiKGY/0.jpg', 'SYSTEM', '2018-10-25 19:47:53', 'SYSTEM', '2018-10-25 19:48:18'),
	('1000000061', '1000000061', 'https://img.youtube.com/vi/9_drH55G3aE/0.jpg', 'SYSTEM', '2018-10-25 19:48:22', 'SYSTEM', '2018-10-25 19:48:23'),
	('1000000062', '1000000062', 'https://img.youtube.com/vi/ApejzyX9MgA/0.jpg', 'SYSTEM', '2018-10-25 19:48:26', 'SYSTEM', '2018-10-25 19:48:28'),
	('1000000063', '1000000063', 'https://img.youtube.com/vi/Cs3vI6GNKew/0.jpg', 'SYSTEM', '2018-10-25 19:48:33', 'SYSTEM', '2018-10-25 19:48:35'),
	('1000000064', '1000000064', 'https://img.youtube.com/vi/VfgaSMLCie8/0.jpg', 'SYSTEM', '2018-10-25 19:48:39', 'SYSTEM', '2018-10-25 19:48:40'),
	('1000000065', '1000000065', 'https://img.youtube.com/vi/5qBqWHzc2Bk/0.jpg', 'SYSTEM', '2018-10-25 19:48:43', 'SYSTEM', '2018-10-25 19:48:44'),
	('1000000066', '1000000066', 'https://img.youtube.com/vi/WBQF3hQ5Nd8/0.jpg', 'SYSTEM', '2018-10-25 19:48:48', 'SYSTEM', '2018-10-25 19:48:49'),
	('1000000067', '1000000067', 'https://img.youtube.com/vi/XtTx5yPOjAE/0.jpg', 'SYSTEM', '2018-10-25 19:48:52', 'SYSTEM', '2018-10-25 19:48:53'),
	('1000000071', '1000000071', 'https://img.youtube.com/vi/52Vh4LNjorI/0.jpg', 'SYSTEM', '2018-10-25 19:48:56', 'SYSTEM', '2018-10-25 19:48:57'),
	('1000000072', '1000000072', 'https://img.youtube.com/vi/EZy4s7ln7UA/0.jpg', 'SYSTEM', '2018-10-25 19:49:00', 'SYSTEM', '2018-10-25 19:49:01'),
	('1000000073', '1000000073', 'https://img.youtube.com/vi/mCuUrLr6nUE/0.jpg', 'SYSTEM', '2018-10-25 19:49:04', 'SYSTEM', '2018-10-25 19:49:05'),
	('1000000074', '1000000074', 'https://img.youtube.com/vi/82FiMGQkJq4/0.jpg', 'SYSTEM', '2018-10-25 19:49:08', 'SYSTEM', '2018-10-25 19:49:10'),
	('1000000075', '1000000075', 'https://img.youtube.com/vi/8N5wFGSZwZc/0.jpg', 'SYSTEM', '2018-10-25 19:49:16', 'SYSTEM', '2018-10-25 19:49:17'),
	('1000000076', '1000000076', 'https://img.youtube.com/vi/sABfKSyFD58/0.jpg', 'SYSTEM', '2018-10-25 19:49:19', 'SYSTEM', '2018-10-25 19:49:20'),
	('1000000077', '1000000077', 'https://img.youtube.com/vi/GOky2dOpoBA/0.jpg', 'SYSTEM', '2018-10-25 19:49:23', 'SYSTEM', '2018-10-25 19:49:24'),
	('1000000078', '1000000078', 'https://img.youtube.com/vi/5_E38qJPpSo/0.jpg', 'SYSTEM', '2018-10-25 19:49:29', 'SYSTEM', '2018-10-25 19:49:30'),
	('1000000079', '1000000079', 'https://img.youtube.com/vi/yd5WUAzcaQI/0.jpg', 'SYSTEM', '2018-10-25 19:49:32', 'SYSTEM', '2018-10-25 19:49:33'),
	('1000000080', '1000000080', 'https://img.youtube.com/vi/U1HeYNC28O4/0.jpg', 'SYSTEM', '2018-10-25 19:49:44', 'SYSTEM', '2018-10-25 19:49:45'),
	('1000000081', '1000000081', 'https://img.youtube.com/vi/EGGe07oYRkU/0.jpg', 'SYSTEM', '2018-10-25 17:46:56', 'SYSTEM', '2018-10-25 17:46:57'),
	('1000000082', '1000000082', 'https://img.youtube.com/vi/pxe84igAXUk/0.jpg', 'SYSTEM', '2018-10-25 17:47:49', 'SYSTEM', '2018-10-25 17:47:51'),
	('1000000083', '1000000083', 'https://img.youtube.com/vi/TKYv3yfroLU/0.jpg', 'SYSTEM', '2018-10-25 17:48:25', 'SYSTEM', '2018-10-25 17:48:27'),
	('1000000084', '1000000084', 'https://img.youtube.com/vi/WVV0qtfcN4A/0.jpg', 'SYSTEM', '2018-10-25 17:48:51', 'SYSTEM', '2018-10-25 17:48:54'),
	('1000000085', '1000000085', 'https://img.youtube.com/vi/8lvmFgsQt8U/0.jpg', 'SYSTEM', '2018-10-25 17:49:23', 'SYSTEM', '2018-10-25 17:49:25'),
	('1000000086', '1000000086', 'https://img.youtube.com/vi/gS72BCnrcoc/0.jpg', 'SYSTEM', '2018-10-25 17:49:51', 'SYSTEM', '2018-10-25 17:49:54'),
	('1000000087', '1000000087', 'https://img.youtube.com/vi/gHcpJv9E0x4/0.jpg', 'SYSTEM', '2018-10-25 17:50:23', 'SYSTEM', '2018-10-25 17:50:25'),
	('1000000088', '1000000088', 'https://img.youtube.com/vi/pe2VFy552FI/0.jpg', 'SYSTEM', '2018-10-25 17:50:55', 'SYSTEM', '2018-10-25 17:50:57'),
	('1000000089', '1000000089', 'https://img.youtube.com/vi/zOmdmTGxnoM/0.jpg', 'SYSTEM', '2018-10-25 17:51:33', 'SYSTEM', '2018-10-25 17:51:35'),
	('1000000090', '1000000090', 'https://img.youtube.com/vi/QHcDhBEXPbU/0.jpg', 'SYSTEM', '2018-10-25 17:52:16', 'SYSTEM', '2018-10-25 17:52:18'),
	('1000000091', '1000000091', 'https://img.youtube.com/vi/noes5mBtRTI/0.jpg', 'SYSTEM', '2018-10-25 17:53:25', 'SYSTEM', '2018-10-25 17:53:27'),
	('1000000092', '1000000092', 'https://img.youtube.com/vi/R6kTRuLKNJ0/0.jpg', 'SYSTEM', '2018-10-25 17:55:51', 'SYSTEM', '2018-10-25 17:55:54'),
	('1000000093', '1000000093', 'https://img.youtube.com/vi/A0XKl5GisEo/0.jpg', 'SYSTEM', '2018-10-25 18:00:52', 'SYSTEM', '2018-10-25 18:00:54'),
	('1000000094', '1000000094', 'https://img.youtube.com/vi/LCN4rFjjKzA/0.jpg', 'SYSTEM', '2018-10-25 18:00:58', 'SYSTEM', '2018-10-25 18:01:00'),
	('1000000095', '1000000095', 'https://img.youtube.com/vi/yZ0dzzk9Gc8/0.jpg', 'SYSTEM', '2018-10-25 18:01:04', 'SYSTEM', '2018-10-25 18:01:05'),
	('1000000096', '1000000096', 'https://img.youtube.com/vi/H06zAcHqjYU/0.jpg', 'SYSTEM', '2018-10-25 17:55:45', 'SYSTEM', '2018-10-25 17:55:47'),
	('1000000097', '1000000097', 'https://img.youtube.com/vi/krQPM7NF2Vk/0.jpg', 'SYSTEM', '2018-10-25 18:01:09', 'SYSTEM', '2018-10-25 18:01:11'),
	('1000000098', '1000000098', 'https://img.youtube.com/vi/HJCAn9WjxJU/0.jpg', 'SYSTEM', '2018-10-25 18:01:14', 'SYSTEM', '2018-10-25 18:01:16'),
	('1000000099', '1000000099', 'https://img.youtube.com/vi/SkyqcpE6g0U/0.jpg', 'SYSTEM', '2018-10-25 18:01:20', 'SYSTEM', '2018-10-25 18:01:22'),
	('1000000100', '1000000100', 'https://img.youtube.com/vi/wYYbk6vb7ZY/0.jpg', 'SYSTEM', '2018-10-25 18:01:26', 'SYSTEM', '2018-10-25 18:01:28'),
	('1000000101', '1000000101', 'https://img.youtube.com/vi/CS2ydvQncts/0.jpg', 'SYSTEM', '2018-10-25 18:01:32', 'SYSTEM', '2018-10-25 18:01:34'),
	('1000000102', '1000000102', 'https://img.youtube.com/vi/ZwXHyfv4Z1M/0.jpg', 'SYSTEM', '2018-10-25 18:01:37', 'SYSTEM', '2018-10-25 18:01:39'),
	('1000000103', '1000000103', 'https://img.youtube.com/vi/E0KY1BuTFlM/0.jpg', 'SYSTEM', '2018-10-25 18:01:43', 'SYSTEM', '2018-10-25 18:01:44'),
	('1000000104', '1000000104', 'https://img.youtube.com/vi/YK6XL6w_rlo/0.jpg', 'SYSTEM', '2018-10-25 18:01:48', 'SYSTEM', '2018-10-25 18:01:50'),
	('1000000105', '1000000105', 'https://img.youtube.com/vi/TFqPjuzjjVg/0.jpg', 'SYSTEM', '2018-10-25 18:01:57', 'SYSTEM', '2018-10-25 18:01:59'),
	('1000000106', '1000000106', 'https://img.youtube.com/vi/6knHMg8JQGk/0.jpg', 'SYSTEM', '2018-10-25 18:02:06', 'SYSTEM', '2018-10-25 18:02:07');
/*!40000 ALTER TABLE `t_vdo_img` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
