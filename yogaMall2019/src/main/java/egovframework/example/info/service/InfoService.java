package egovframework.example.info.service;

import java.util.List;
import java.util.Map;

import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface InfoService {

	void updateMbrInfo(JoinVO joinVO) throws Exception;

	EgovMap checkPwd(Map<String, Object> reqParam) throws Exception;

	List<EgovMap> selectWthdRsnList() throws Exception;

	void withdraw(Map<String, Object> paramMap) throws Exception;

}
