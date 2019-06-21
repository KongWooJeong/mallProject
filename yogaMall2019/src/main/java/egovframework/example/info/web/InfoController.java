package egovframework.example.info.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.info.service.InfoService;
import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class InfoController {
	
	@Resource
	private Validator validator;
	
	@Resource
	private InfoService infoService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {	
		
		// 회원 정보 유효성 검사
		dataBinder.setValidator(validator);
	}

	@RequestMapping(value = "/info.do")
	public String infoMain(@ModelAttribute JoinVO joinVO) {
		return "info/info.tiles";
	}
	
	@RequestMapping(value = "/updateMbrInfo.do")
	public String updateInfo(@Validated @ModelAttribute JoinVO joinVO, BindingResult bindingResult){
		
		/*
		 * 유효성 에러 여부
		 * true : 유효성 결과 실패 -> 나의 정보 
		 * false : 유효성 결과 성공 -> 회원 정보 DB update
		*/
		if (bindingResult.hasErrors()) {			
			return "info/info.tiles";
		} else {
			SessionUtil.setData("updateValidSuccessYn", "Y");
			
			return "forward:/updateMbrInfoProc.do";	
		}
	}
	
	@RequestMapping(value = "/updateMbrInfoProc.do")
	public String updateInfoProc(@ModelAttribute JoinVO joinVO) throws Exception {
		String updateValidSuccessYn = (String) SessionUtil.getData("updateValidSuccessYn");
		
		if("Y".equals(updateValidSuccessYn)) {
			
			// 유효성 에러 없을 경우
			SessionUtil.removeData("updateValidSuccessYn");	
			
			infoService.updateMbrInfo(joinVO);		// 입력 정보 DB update
						
			return "redirect:/main.do";
		} else {
			return "redirect:/info.do";
		}
		
	}
	
	@RequestMapping(value = "/confirmPwd.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkPwd(@RequestParam Map<String, Object> reqParam) throws Exception {
		EgovMap resultMap = infoService.checkPwd(reqParam);
						
		return JsonUtil.EgovMapToJson(resultMap);
	}
		
	@RequestMapping(value = "/wthdInfo.do")
	public String wthdInfo(ModelMap model) throws Exception {
		List<EgovMap> wthdRsnList = infoService.selectWthdRsnList();
		
		model.addAttribute("wthdRsnList", wthdRsnList);
		
		return "info/wthdInfo.tiles";
	}
	
	@RequestMapping(value = "/withdraw.do")
	public String withdraw(@RequestParam Map<String, Object> paramMap) throws Exception {			
		infoService.withdraw(paramMap);
		
		SessionUtil.removeSession();
		
		return "info/wthdComplete.tiles";
	}
}
