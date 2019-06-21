package egovframework.example.onlineDt.service.impl;

import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface OnlineDtMapper {

	EgovMap selectVdoList(Map<String, Object> paramMap) throws Exception;

	int checkVideo(EgovMap infoMap) throws Exception;

}
