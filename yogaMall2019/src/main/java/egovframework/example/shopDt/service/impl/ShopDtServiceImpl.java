package egovframework.example.shopDt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.shopDt.service.ShopDtService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("ShopDtService")
public class ShopDtServiceImpl implements ShopDtService {
	
	@Resource(name="ShopDtMapper")
	private ShopDtMapper shopDtMapper;

	@Override
	public EgovMap selectGoods(Map<String, Object> paramMap) throws Exception {
		
		// 상품 정보 조회
		EgovMap goods = shopDtMapper.selectGoods(paramMap);
		
		if (goods != null) {
			// 정보가 있다면 상품 이미지 조회
			List<EgovMap> imgList = shopDtMapper.selectGoodsImg(paramMap);
			goods.put("imgList", imgList);
		}
		
		return goods;
	}
}
