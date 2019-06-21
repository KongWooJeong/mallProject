package egovframework.example.cart.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cart.service.CartService;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CartController {
	
	@Resource
	private CartService cartService;

	@RequestMapping(value = "/cart.do")
	public String cartInit(@RequestParam Map<String, Object> reqParam, ModelMap model) throws Exception {
		String mbrNo = SessionUtil.getSessionData().getMbrNo();		
		
		List<EgovMap> cartList = cartService.selectCartList(mbrNo);
		
		int sum = 0;
		
		// 총 합계
		for (int i = 0; i < cartList.size(); i++) {
			sum += (int) cartList.get(i).get("totPrc");
		}
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("sum", sum);
					
		return "cart/cart.tiles";
	}
	
	@RequestMapping(value = "/addCart.do")
	public String addCart(@RequestParam Map<String, Object> reqParam) throws Exception {
		String mbrNo = SessionUtil.getSessionData().getMbrNo();
		
		reqParam.put("mbrNo", mbrNo);
		
		int cnt = cartService.selectCntList(reqParam);
		
		if (cnt == 0) {
			cartService.insertCart(reqParam);
		} else {
			cartService.updateCart(reqParam);
		}
		
		return "redirect:/cart.do";
	}	
	
	@RequestMapping(value = "/delete.do")
	public String delete(@RequestParam(required = false) String vdoCd, @RequestParam(required = false) String gdCd) throws Exception {
		EgovMap info = new EgovMap();
		
		String mbrNo = SessionUtil.getSessionData().getMbrNo();
		
		info.put("mbrNo", mbrNo);
		info.put("vdoCd", vdoCd);
		info.put("gdCd", gdCd);
		
		cartService.deleteCart(info);
		
		return "redirect:/cart.do";
	}
	
	@RequestMapping(value = "/update.do")
	public String update(@RequestParam int[] amt, @RequestParam String[] gdCd) throws Exception {
		String mbrNo = SessionUtil.getSessionData().getMbrNo();		
		HashMap<String, Object> shop = new HashMap<>();
		HashMap<String, Object> info = new HashMap<>();		
		
		if (amt.length == gdCd.length) {
			
			for (int i = 0; i < amt.length; i++) {
				shop.put(gdCd[i], amt[i]);
			}
		}
		
		info.put("mbrNo", mbrNo);
		info.put("shop", shop);
		
		cartService.modify(info);	
		
		return "redirect:/cart.do";
	}
}
