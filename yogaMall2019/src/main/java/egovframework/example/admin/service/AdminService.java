package egovframework.example.admin.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface AdminService {

	List<EgovMap> selectBnList(Map<String, Object> map);

	EgovMap saveBnnrData(Map<String, Object> map);

}
