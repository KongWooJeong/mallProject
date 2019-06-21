package egovframework.example.join.service.impl;

import java.util.List;

import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface JoinMapper {

	EgovMap selectTermsMngList(String string);

	int selectDuplicateIdCnt(String loginId);

	List<EgovMap> selectEmailDomainList(String eMAIL_DOMAIN);

	void insertJoinMbr(JoinVO joinVO);

	void insertTermsAgr(EgovMap castMap);

	void updateMrktAgr(String mbrNo);


}
