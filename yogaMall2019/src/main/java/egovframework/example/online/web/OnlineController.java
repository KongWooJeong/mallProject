package egovframework.example.online.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.utils.CmmnUtil;
import egovframework.example.online.service.OnlineService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class OnlineController {

	@Resource(name="onlineService")
	private OnlineService onlineService;
	
	@ModelAttribute("onlineRandomList")
	public List<EgovMap> onlineRandomList() throws Exception {
		return onlineService.selectOnlineRandomList();
	}
	
	@ModelAttribute("onlineCtgrList")
	public List<EgovMap> onlineCtgrList() throws Exception {
		return onlineService.selectOnlineCtgrList();
	}
	
	@RequestMapping(value = "/online.do")
	public String main() {
		return "online/online.tiles";
	}
	
	@RequestMapping(value = "/getList.do")
	public String onlineMain(@RequestBody Map<String, Object> paramMap, ModelMap model) throws Exception {
		int totalCount = onlineService.selectTotalCount(paramMap);
		
		paramMap.put("totalCount", totalCount);
		
		PaginationInfo pageInfo = CmmnUtil.getPageInfo(paramMap);
		
		List<EgovMap> vdoList = onlineService.selectVdoList(paramMap);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("vdoList", vdoList);
			
		return "online/onlineList";
	}
	
	
}
