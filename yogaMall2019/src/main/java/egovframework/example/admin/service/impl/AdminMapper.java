package egovframework.example.admin.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface AdminMapper {

	List<EgovMap> selectBnList(Map<String, Object> map);

	void insertBnnrMng(Map<String, Object> bnnrMngDataMap);

	void insertBnnrDtl(Map<String, Object> tempMap);

}
