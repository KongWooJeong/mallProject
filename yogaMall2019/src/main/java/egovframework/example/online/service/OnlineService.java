package egovframework.example.online.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface OnlineService {

	List<EgovMap> selectOnlineRandomList() throws Exception;

	int selectTotalCount(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectVdoList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectOnlineCtgrList() throws Exception;

}
