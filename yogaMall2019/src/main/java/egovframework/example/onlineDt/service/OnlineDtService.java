package egovframework.example.onlineDt.service;

import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface OnlineDtService {

	EgovMap selectVdoList(Map<String, Object> paramMap) throws Exception ;

	EgovMap checkVideo(Map<String, Object> paramMap) throws Exception ;

}
