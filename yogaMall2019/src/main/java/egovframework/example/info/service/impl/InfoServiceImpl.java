package egovframework.example.info.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.tags.ParamAware;

import egovframework.example.cmmn.EgovFileScrty;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.info.service.InfoService;
import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class InfoServiceImpl implements InfoService {

	@Resource
	private InfoMapper infoMapper;
	
	@Override
	public void updateMbrInfo(JoinVO joinVO) throws Exception {
		String encPwd = EgovFileScrty.encryptPassword(joinVO.getPwd(), joinVO.getLoginId());
		
		joinVO.setPwd(encPwd);
		
		infoMapper.updateMbrInfo(joinVO);
	}
	
	@Override
	public EgovMap checkPwd(Map<String, Object> reqParam) throws Exception {
		String 	id 			= (String) reqParam.get("loginId"),
				paramPwd 	= (String) reqParam.get("pwd"),
				encPwd 		= EgovFileScrty.encryptPassword(paramPwd, id);
		
		EgovMap checkPwdMap = new EgovMap();
		EgovMap resultMap 	= new EgovMap();
		
		checkPwdMap.put("id", id);
		checkPwdMap.put("encPwd", encPwd);
		
		int checkPwdCnt = infoMapper.checkPwdCnt(checkPwdMap);
		
		if (checkPwdCnt == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
	@Override
	public List<EgovMap> selectWthdRsnList() throws Exception {
		return infoMapper.selectWthdRsnList();
	}
	
	@Override
	public void withdraw(Map<String, Object> paramMap) throws Exception {
		String mbrNo = SessionUtil.getSessionData().getMbrNo();
		
		paramMap.put("mbrNo", mbrNo);
		
		int cart 		= infoMapper.cart(paramMap),			
			mbrDorm 	= infoMapper.mbrDorm(paramMap),
			ordHis 		= infoMapper.ordHis(paramMap),
			termsAgr 	= infoMapper.termsAgr(paramMap);
			
			if (cart > 0) {
				infoMapper.deleteCart(paramMap);
			}
			
			if (mbrDorm > 0) {
				infoMapper.deleteMbrDorm(paramMap);
			}
			
			if (ordHis > 0) {
				infoMapper.deleteOrdHis(paramMap);
			}
			
			if (termsAgr > 0) {
				infoMapper.deleteTermsAgr(paramMap);
			}
			
			infoMapper.updateMbrCnd(paramMap);
			infoMapper.createMbrWthd(paramMap);		
	}
}
