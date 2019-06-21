package egovframework.example.login.service.impl;

import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface LoginMapper {

	int selectWthdMbrCnt(Map<String, Object> map) throws Exception;

	EgovMap selectDormInfo(Map<String, Object> map) throws Exception;

	EgovMap selectMbrInfo(Map<String, Object> map) throws Exception;

	void updateFailProc(Map<String, Object> map) throws Exception;

	void insertLoginHistory(Map<String, Object> map) throws Exception;

	String selectIdInfo(Map<String, Object> paramMap) throws Exception;
	
	int selectIdCnt(Map<String, Object> paramMap) throws Exception;
	
	void updateEncPwd(Map<String, Object> paramMap) throws Exception;
}
