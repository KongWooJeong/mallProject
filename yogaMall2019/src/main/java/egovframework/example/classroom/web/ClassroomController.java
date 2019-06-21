package egovframework.example.classroom.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.classroom.service.ClassroomService;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ClassroomController {
	
	@Resource
	private ClassroomService classroomService;

	@RequestMapping(value = "/classroom.do")
	public String classroomMain(ModelMap model) throws Exception{
		String mbrNo = SessionUtil.getSessionData().getMbrNo();
		
		List<EgovMap> classList = classroomService.selectClassList(mbrNo);
				
		model.addAttribute("classList", classList);
		
		return "classroom/classroom.tiles";
	}
}
