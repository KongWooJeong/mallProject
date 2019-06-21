package egovframework.example.payment.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.payment.service.PaymentService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class PaymentController {
	
	@Resource
	private PaymentService paymentService;

	@RequestMapping(value = "/payment.do")
	public String paymentInit(ModelMap model) {
		
		try {
			String mbrNo = SessionUtil.getSessionData().getMbrNo();
			
			// 로그인유저 정보 가져오기
			EgovMap userList = paymentService.selectUserList(mbrNo);
			
			// 장바구니 정보 가져오기
			List<EgovMap> cartList = paymentService.selectCartList(mbrNo);
			
			int totalPrc = 0;
			
			for (int i = 0; i < cartList.size(); i++) {
				totalPrc += (int) cartList.get(i).get("totPrc");
			}
			
			userList.put("totalPrc", totalPrc);
			
			System.out.println(cartList);
			System.out.println(userList);
			
			model.addAttribute("userList", userList);
			model.addAttribute("cartList", cartList);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		
		return "payment/payment.tiles";
	}
	
	@RequestMapping(value = "/paymentCash.do")
	public String paymentCashInit(@RequestParam Map<String, Object> reqParam, ModelMap model) {
		
		String mbrNo = (String) reqParam.get("mbrNo");
		String confirm = paymentService.selectMbrNoList(mbrNo);
		System.out.println(confirm);
		
		// 중복 주문시 걸러내기 위해 근데 아직 더 생각하는중... 그냥 일단 막아놓았음.....  
		if(confirm == null) {
			paymentService.insertPaymentList(reqParam);
		}
		
		model.addAttribute("reqParam", reqParam);
		return "payment/paymentCpt.tiles";
	}
	
	@RequestMapping(value = "/paymentCard.do")
	public String paymentCardInit(@RequestParam Map<String, Object> reqParam
			, ModelMap model) {
		System.out.println("여기는 카드" + reqParam);
		
		
		return "payment/paymentCpt.tiles";
	}
}
