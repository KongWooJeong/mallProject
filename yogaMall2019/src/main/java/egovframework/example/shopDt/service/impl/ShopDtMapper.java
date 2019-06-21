package egovframework.example.shopDt.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("ShopDtMapper")
public interface ShopDtMapper {

	EgovMap selectGoods(Map<String, Object> paramMap);
	
	List<EgovMap> selectGoodsImg(Map<String, Object> paramMap);
}
