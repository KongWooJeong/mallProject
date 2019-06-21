package egovframework.example.onlineDt.web;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.example.onlineDt.service.OnlineDtService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class OnlineDtController {

	private static final Logger logger = LoggerFactory.getLogger(OnlineDtController.class); 
	
	@Resource
	private OnlineDtService onlineDtService;
	
	@RequestMapping(value="/onlineDt.do")
	public String onlineDtInit(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		
		logger.debug(" onlineDt.do paramMap => {} ", paramMap);
		
		EgovMap vdo = onlineDtService.selectVdoList(paramMap);
		
		if (vdo == null) {
			return "redirect:/online.do";
		}
		
		model.addAttribute("vdo", vdo);
		
		return "onlineDt/onlineDt.tiles";
	}
	
	@RequestMapping(value = "/checkVideo.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String checkVideo(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		// paramMap에 vdoCd 담아서 구매 유무 확인
		EgovMap resMap = onlineDtService.checkVideo(paramMap);
		
		return JsonUtil.EgovMapToJson(resMap);
	}
}
