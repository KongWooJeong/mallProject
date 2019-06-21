package egovframework.example.shop.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ShopService {

	List<EgovMap> selectMenuList() throws Exception;
	
	List<EgovMap> selectRandomList() throws Exception;

	int selectGoodsCount(Map<String, Object> paramMap) throws Exception; 
	
	List<EgovMap> selectGoodsList(Map<String, Object> paramMap) throws Exception;
	
}
