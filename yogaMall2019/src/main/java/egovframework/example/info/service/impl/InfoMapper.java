package egovframework.example.info.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface InfoMapper {

	void updateMbrInfo(JoinVO joinVO) throws Exception;

	int cart(Map<String, Object> paramMap) throws Exception;

	int mbrDorm(Map<String, Object> paramMap) throws Exception;

	int termsAgr(Map<String, Object> paramMap) throws Exception;

	int ordHis(Map<String, Object> paramMap) throws Exception;

	void deleteCart(Map<String, Object> paramMap) throws Exception;

	void deleteMbrDorm(Map<String, Object> paramMap) throws Exception;

	void deleteOrdHis(Map<String, Object> paramMap) throws Exception;

	void deleteTermsAgr(Map<String, Object> paramMap) throws Exception;

	void createMbrWthd(Map<String, Object> paramMap) throws Exception;

	void updateMbrCnd(Map<String, Object> paramMap) throws Exception;

	int checkPwdCnt(EgovMap checkPwdMap) throws Exception;

	List<EgovMap> selectWthdRsnList() throws Exception;
}
