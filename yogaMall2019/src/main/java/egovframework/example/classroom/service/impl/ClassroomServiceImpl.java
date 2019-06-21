package egovframework.example.classroom.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.classroom.service.ClassroomService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class ClassroomServiceImpl implements ClassroomService {

	@Resource
	private ClassroomMapper classroomMapper;
	
	@Override
	public List<EgovMap> selectClassList(String mbrNo) throws Exception {
		return classroomMapper.selectClassList(mbrNo);
	}

}
