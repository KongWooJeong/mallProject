package egovframework.example.classroom.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ClassroomService {

	List<EgovMap> selectClassList(String mbrNo) throws Exception;

}
