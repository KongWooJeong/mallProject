package egovframework.example.shop.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.utils.CmmnUtil;
import egovframework.example.shop.service.ShopService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ShopController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Resource(name = "ShopService")
	private ShopService shopService;
	
	@ModelAttribute("menuList")
	public List<EgovMap> menuList() throws Exception {
		return shopService.selectMenuList();
	}
	
	@ModelAttribute("randomList")
	public List<EgovMap> randomList() throws Exception {
		return shopService.selectRandomList();
	}
	
	@RequestMapping(value = "/shop.do")
	public String shopMain(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		return "shop/shop.tiles";
	}
	
	@RequestMapping(value = "/shop/selectGoodsList.do")
	public String selectGoodsList(@RequestBody Map<String, Object> paramMap, ModelMap model) throws Exception {
		System.out.println(" ## paramMap : " + paramMap);
		logger.debug("[dev] selectGoodsList.do paramMap => {}", paramMap);
		
		// 상품 전체 수 조회
		int totalCount = shopService.selectGoodsCount(paramMap);
		paramMap.put("totalCount", totalCount);
		
		// 페이징 정보 처리
		PaginationInfo pageInfo = CmmnUtil.getPageInfo(paramMap);
		
		// 상품 목록 조회
		List<EgovMap> goodsList = shopService.selectGoodsList(paramMap);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("goodsList", goodsList);
		
		return "shop/shopList";
	}
	
	
}
