CREATE TABLE `T_ADM_CAT` (
	`CAT_CD`      CHAR(10)     NOT NULL COMMENT '카테고리코드', -- 카테고리코드
	`CAT_NM`      VARCHAR(50)  NULL     COMMENT '카테고리명', -- 카테고리명
	`UPPR_CAT_CD` CHAR(10)     NULL     COMMENT '상위카테고리코드', -- 상위카테고리코드
	`CAT_LV`      INTEGER      NULL     COMMENT '카테고리레벨', -- 카테고리레벨
	`USE_YN`      CHAR(1)      NULL     COMMENT '사용여부', -- 사용여부
	`SORT_SEQ`    VARCHAR(10)  NULL     COMMENT '정렬순서', -- 정렬순서
	`CNNT_URL`    VARCHAR(255) NULL     COMMENT '연결URL', -- 연결URL
    `GRP_CAT_NM`    VARCHAR(50) NULL     COMMENT '그룹카테고리명', -- 그룹카테고리명
    `ICO_NM`    VARCHAR(50) NULL     COMMENT '아이콘명', -- 아이콘명
	`REGR`        VARCHAR(30)  NULL     COMMENT '등록자', -- 등록자
	`REG_DT`      DATETIME     NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시', -- 등록일시
	`UPDR`        VARCHAR(30)  NULL     COMMENT '수정자', -- 수정자
	`UPD_DT`      DATETIME     NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '수정일시' -- 수정일시
)
COMMENT '관리자 카테고리';
    
INSERT INTO t_adm_cat (CAT_CD, CAT_NM, UPPR_CAT_CD, CAT_LV, USE_YN, SORT_SEQ, CNNT_URL, GRP_CAT_NM, ICO_NM, REGR, REG_DT, UPDR, UPD_DT) VALUES
  ('C001000000', '회원관리', '', '1', 'Y', '1', '/member/member.do', '', '', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C001001000', '회원목록', 'C001000000', '2', 'Y', '1', '', '회원관리', 'icon-people', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C001001001', '정상회원', 'C001001000', '3', 'Y', '1', '/member/selectMember10.do', '', 'icon-user', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C001001002', '휴면회원', 'C001001000', '3', 'Y', '2', '/member/selectMember20.do', '', 'icon-user-follow', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C001001003', '탈퇴회원', 'C001001000', '3', 'Y', '3', '/member/selectMember30.do', '', 'icon-user-unfollow', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C001002000', '약관관리', 'C001000000', '2', 'Y', '2', '/member/selectTerms.do', '약관관리', 'icon-book-open', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C002000000', '상품관리', '', '1', 'Y', '2', '/goods/goods.do', '', '', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C002001000', '상품목록', 'C002000000', '2', 'Y', '1', '/goods/selectGoods.do', '상품관리', 'icon-present', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C003000000', '주문관리', '', '1', 'Y', '3', '/order/order.do', '', '', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C003001000', '주문목록', 'C003000000', '2', 'Y', '1', '/order/selectOrder.do', '주문관리', 'icon-basket', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C004000000', '코드관리', '', '1', 'Y', '4', '/code/code.do', '', '', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C004001000', '공통코드목록', 'C004000000', '2', 'Y', '1', '/code/selectCode.do', '코드관리', 'icon-screen-desktop', 'SYSTEM', '2018-09-26 01:45:13', 'SYSTEM', '2018-09-26 01:45:13'),
  ('C999000000', '환경설정', '', '1', 'Y', '5', '/setting/setting.do', '', '', 'SYSTEM', '2018-10-06 20:45:03', 'SYSTEM', '2018-10-06 20:45:03'),
  ('C999001000', '환경설정', 'C999000000', '2', 'Y', '1', '/setting/selectSetting.do', '환경설정', 'icon-settings', 'SYSTEM', '2018-12-05 11:36:25', 'SYSTEM', '2018-12-05 11:36:25'),
  ('C002002000', '카테고리목록', 'C002000000', '2', 'Y', '2', '/goods/selectGoodsCat.do', '카테고리관리', 'icon-screen-desktop', 'SYSTEM', '2018-12-05 12:50:52', 'SYSTEM', '2018-12-05 12:50:52');

    