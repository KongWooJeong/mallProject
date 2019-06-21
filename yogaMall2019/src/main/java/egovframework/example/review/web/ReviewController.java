package egovframework.example.review.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping(value = "/review.do")
	public String reviewMain() throws Exception {
		return "review/review.tiles";
	}
}
