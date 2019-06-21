package egovframework.example.shopDt.service;

import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ShopDtService {

	EgovMap selectGoods(Map<String, Object> paramMap) throws Exception;
}
