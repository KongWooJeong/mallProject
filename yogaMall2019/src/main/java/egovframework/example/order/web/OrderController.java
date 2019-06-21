package egovframework.example.order.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping(value = "/order.do")
	public String orderMain() {
		return "order/order.tiles";
	}
}
