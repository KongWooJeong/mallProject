package egovframework.example.login.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.login.service.LoginService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class LoginController {
	
	@Resource
	private LoginService loginService;

	@RequestMapping(value = "/login.do")
	public String login() throws Exception {
		return "login/login.tiles";
	}
	
	@RequestMapping(value = "/loginProc.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String loginProc(@RequestParam String id, @RequestParam String pwd, @RequestParam Map map) throws Exception {
		
		// 아이디 값 확인
		if (StringUtils.isEmpty(id) || StringUtils.isBlank(id)) {
			return "fail";
		}
		
		// 비밀번호 값 확인
		if (StringUtils.isEmpty(pwd) || StringUtils.isBlank(pwd)) {
			return "fail";
		}
		
		// 로그인 정보 DB 확인
		EgovMap resultLogin = loginService.loginProc(map);
		
		return JsonUtil.EgovMapToJson(resultLogin).toString();
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout() {
		SessionUtil.removeSession();
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "/idInfo.do")
	public String idInfo() {
		return "login/idInfo.tiles";
	}
	
	@RequestMapping(value = "/pwdInfo.do")
	public String pwdInfo() {
		return "login/pwdInfo.tiles";
	}
	
	@RequestMapping(value = "/checkId.do", produces = "application/text; charset=utf8" )
	@ResponseBody
	public String checkId(@RequestParam Map<String, Object> paramMap) throws Exception {	
		EgovMap idInfo = loginService.selectIdInfo(paramMap);
				
		return JsonUtil.EgovMapToJson(idInfo); 
	}
	
	@RequestMapping(value = "/checkPwd.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkPwd(@RequestParam Map<String, Object> paramMap) throws Exception  {
		EgovMap pwdInfo = loginService.selecPwdInfo(paramMap);		
		
		return JsonUtil.EgovMapToJson(pwdInfo);
	}
}
