package egovframework.example.shopDt.web;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.shopDt.service.ShopDtService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ShopDtContoller {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopDtContoller.class);
	
	@Resource(name="ShopDtService")
	private ShopDtService shopDtService;

	@RequestMapping(value = "/shopDt.do")
	public String ShopDtMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		
		logger.debug("[dev] shotDt.do paramMap => {}", paramMap);
		
		// 상품 정보 조회
		EgovMap goods = shopDtService.selectGoods(paramMap);
		
		if (goods == null) {
			// 정보가 없다면 상품 목록 페이지로 이동
			return "redirect:/shop.do";
		}
		
		model.addAttribute("goods", goods);
		
		return "shopDt/shopDt.tiles";
	}
}
