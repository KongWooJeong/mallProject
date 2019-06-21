package egovframework.example.online.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("onlineMapper")
public interface OnlineMapper {

	List<EgovMap> selectOnlineRandomList() throws Exception;

	int selectTotalCount(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectVdoList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectOnlineCtgrList() throws Exception;

}
