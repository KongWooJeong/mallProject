package egovframework.example.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.admin.service.AdminService;
import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping(value = "/admin.do")
	public String adminInit() {
		System.out.println("여기는 관리자 컨트롤러");
		return "admin/dp/dpBnnrMng.admin";
	}
	
	@RequestMapping(value = "/dpBnnrList.do")
	@ResponseBody
	public String dpBnnrList(@RequestParam Map<String, Object> map) {
		List<EgovMap> bnList = adminService.selectBnList(map);
		
		System.out.println("##bnList" + bnList);
		
		Map<String, Object> resMap = new HashMap<>();
		
		resMap.put("rows", bnList);
		
		return JsonUtil.MapToJson(resMap);
	}
	
	@RequestMapping(value = "/dpBnnrReg.do")
	public String dpBnnrReg() {
		
		return "admin/dp/dpBnnrReg.admin";
	}
	
	@RequestMapping(value = "/saveBnnrData.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String saveBnnrData(@RequestParam Map<String, Object> map) {
		EgovMap result = adminService.saveBnnrData(map);
		
		return JsonUtil.EgovMapToJson(result);
	}
}
