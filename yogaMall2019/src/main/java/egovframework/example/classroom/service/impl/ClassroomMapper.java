package egovframework.example.classroom.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface ClassroomMapper {

	List<EgovMap> selectClassList(String mbrNo) throws Exception;

}
