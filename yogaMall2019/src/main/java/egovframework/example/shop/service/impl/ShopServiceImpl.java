package egovframework.example.shop.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.shop.service.ShopService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("ShopService")
public class ShopServiceImpl implements ShopService {

	@Resource(name="ShopMapper")
	private ShopMapper shopMapper;
	
	@Override
	public List<EgovMap> selectMenuList() throws Exception {
		return shopMapper.selectMenuList();
	}
	
	@Override
	public List<EgovMap> selectRandomList() throws Exception {
		return shopMapper.selectRandomList();
	}
	
	@Override
	public int selectGoodsCount(Map<String, Object> paramMap) throws Exception {
		return shopMapper.selectGoodsCount(paramMap);
	}
	
	@Override
	public List<EgovMap> selectGoodsList(Map<String, Object> paramMap) throws Exception {
		return shopMapper.selectGoodsList(paramMap);
	}

}
