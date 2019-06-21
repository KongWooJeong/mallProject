package egovframework.example.cart.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface CartMapper {

	List<EgovMap> selectCartList(String mbrNo) throws Exception;

	int cntCartList(Map<String, Object> reqParam) throws Exception;
	
	void insertCart(Map<String, Object> reqParam) throws Exception;
	
	void updateCart(Map<String, Object> reqParam) throws Exception;
	
	void deleteCart(EgovMap info) throws Exception;
	
	void modify(HashMap<String, Object> info) throws Exception;
}
