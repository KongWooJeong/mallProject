package egovframework.example.introduce.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroduceController {

	@RequestMapping(value = "/introduce.do")
	public String introduce() throws Exception {
		return "introduce/introduce.tiles";
		
	}
	
}
