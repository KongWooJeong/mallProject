package egovframework.example.login.service;

import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LoginService {

	EgovMap loginProc(Map<String, Object> map) throws Exception;

	EgovMap selectIdInfo(Map<String, Object> paramMap) throws Exception;

	EgovMap selecPwdInfo(Map<String, Object> paramMap) throws Exception;
}


