package egovframework.example.join.web;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.join.service.JoinService;
import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class JoinController {
	
	@Resource(name="joinMemberService")
	private JoinService joinMemberService;
	
	@Resource
	private Validator validator;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		System.out.println("### 컨트롤러 전에 호출");
		
		dataBinder.setValidator(validator);
	}

	//회원 약관 동의 공통코드 번호 CM001 : 10 이용약관, 20 개인정보처리, 30 제 3자 동의, 40 마케팅 활용 동의
	private final String[] TERMS_TY_CD = {"10","20","30", "40"};
	
	//이메일 도메인 공통코드번호
	private final String EMAIL_DOMAIN = "CM002";
	
	@RequestMapping(value = "/agreeWith.do")
	public String joinInit(ModelMap model){
		List<EgovMap> termsMngList = joinMemberService.selectTermsMngList(TERMS_TY_CD);
		
		System.out.println(termsMngList);
		
		for (int i=0;i < termsMngList.size();i++) {
			String termsCd = (String) termsMngList.get(i).get("termsTyCd");
			
			model.addAttribute("termsMngList" + termsCd, termsMngList.get(i));
		}
		
		return "join/joinAgreeWrite.join";
	}
	
	
	@RequestMapping(value="/selectTermsRequiredDataChk.do")
	@ResponseBody
	public String selectTermsRequiredDataChk(@RequestParam(required = true) String[] chkAgreeData) {
		System.out.println("####chkAgreeData : " + Arrays.toString(chkAgreeData));
		
		boolean result = joinMemberService.selectTermsRequiredChk(TERMS_TY_CD, chkAgreeData);
	
		EgovMap resultMap = new EgovMap();
		
		if(result) {
			resultMap.put("result", "SUCCESS");
		}else {
			resultMap.put("result", "fail");
		}
		
		return JsonUtil.EgovMapToJson(resultMap);
	}
	
	@RequestMapping(value="/selectJoinInput.do")
	public String selectJoinView(@ModelAttribute JoinVO joinVO, ModelMap model) {
				
		List<EgovMap> emailDomainList = joinMemberService.selectEmailDomainList(EMAIL_DOMAIN);
		
		model.addAttribute("emailDomainList", emailDomainList);
		
		System.out.println("joinVO : " + joinVO);
		
		return "join/joinMbrInput.join";
	}
	
	@RequestMapping(value = "/selectDuplicateIdChk.do")
	@ResponseBody
	public String selectDuplicateIdChk(@RequestParam(required=true) String loginId){
		int duplicateIdCnt = joinMemberService.selectDuplicateIdCnt(loginId);
		
		return String.valueOf(duplicateIdCnt);
	}
	
	@RequestMapping(value = "/saveJoinMbr.do")
	public String saveJoinMbr(@Validated @ModelAttribute JoinVO joinVO, BindingResult bindingResult,  HttpServletRequest request, ModelMap model){
	
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("validResult","fail");
			
			return "join/joinMbrInput.join";
		}else {
			SessionUtil.setData("validSuccessYn", "Y");
			
			return "forward:/saveJoinMbrProc.do";
	
		}
	}
	
	@RequestMapping(value = "/saveJoinMbrProc.do")
	public String saveJoinMbrProc(@ModelAttribute JoinVO joinVO, HttpServletRequest request) throws Exception{		
		String validSuccessYn = (String) SessionUtil.getData("validSuccessYn");
		
		if("Y".equals(validSuccessYn)) {
			SessionUtil.removeData("validSuccessYn");
			
			List<EgovMap> termsMngList = joinMemberService.selectTermsMngList(TERMS_TY_CD);
			
			request.setAttribute("termsMngList", termsMngList);
			
			joinMemberService.saveJoinMbrTx(joinVO);
			
			// joinMemberService.mailSend(joinVO);
			
			return "redirect:/joinComplete.do";
		}else {
			return "redirect:/main.do";
		}
		
	}
	
	@RequestMapping(value="/joinComplete.do")
	public String joinComplete() {
		return "join/joinComplete.join";
	}
}
