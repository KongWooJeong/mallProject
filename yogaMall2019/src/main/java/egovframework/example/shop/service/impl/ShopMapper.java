package egovframework.example.shop.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("ShopMapper")
public interface ShopMapper {

	List<EgovMap> selectMenuList();
	
	List<EgovMap> selectRandomList();
	
	int selectGoodsCount(Map<String, Object> paramMap); 

	List<EgovMap> selectGoodsList(Map<String, Object> paramMap);

}
