package egovframework.example.onlineDt.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.onlineDt.service.OnlineDtService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class OnlineDtServiceImpl implements OnlineDtService {
	
	@Resource
	private OnlineDtMapper onlineDtMapper;

	@Override
	public EgovMap selectVdoList(Map<String, Object> paramMap) throws Exception {
		return onlineDtMapper.selectVdoList(paramMap);
	}
	
	@Override
	public EgovMap checkVideo(Map<String, Object> paramMap) throws Exception {
		String 	mbrNo = SessionUtil.getSessionData().getMbrNo(),
				vdoCd = (String) paramMap.get("vdoCd");
		
		EgovMap infoMap = new EgovMap();
		
		
		// infoMap에 로그인 정보와 vdoCd 담아서 강의 구매 유무 확인
		infoMap.put("mbrNo", mbrNo);
		infoMap.put("vdoCd", vdoCd);
		
		
		// result 값이 1이 나올 경우 구매한 강의
		int result = onlineDtMapper.checkVideo(infoMap);
		
		EgovMap resMap = new EgovMap();
		
		if (result == 1) {
			resMap.put("result", "success");
		} else {
			resMap.put("result", "fail");
		}
				
		return resMap;
	}

}
