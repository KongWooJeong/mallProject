package egovframework.example.join.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface JoinService {

	List<EgovMap> selectTermsMngList(String[] tERMS_TY_CD);

	boolean selectTermsRequiredChk(String[] tERMS_TY_CD, String[] chkAgreeData);

	int selectDuplicateIdCnt(String loginId);

	List<EgovMap> selectEmailDomainList(String eMAIL_DOMAIN);

	void saveJoinMbrTx(JoinVO joinVO) throws Exception;

	void mailSend(JoinVO joinVO);

}
