package egovframework.example.join.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.example.cmmn.EgovFileScrty;
import egovframework.example.cmmn.service.MailService;
import egovframework.example.join.service.JoinService;
import egovframework.example.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("joinMemberService")
public class JoinServiceImpl implements JoinService {
	
	@Resource
	private JoinMapper joinMapper;
	
	@Resource
	private MailService mailService;
	
	@Override
	public List<EgovMap> selectTermsMngList(String[] tERMS_TY_CD) {
		List<EgovMap> termsMngList = new ArrayList<EgovMap>();
		
		for(int i=0; i < tERMS_TY_CD.length; i++){
			termsMngList.add(joinMapper.selectTermsMngList(tERMS_TY_CD[i]));
		}
		return termsMngList;
	}

	@Override
	public boolean selectTermsRequiredChk(String[] tERMS_TY_CD, String[] chkAgreeData) {
		int termsEssnAgrYnCnt 	= 0, //약관 관리 테이블의 필수 약관의 수
			chkAgreeDataCnt		= 0; //화면에서 올라온 필수 약관 체크 수
		
		for(int i = 0 ; i < tERMS_TY_CD.length ; i++) {
			EgovMap termsMngInfo = joinMapper.selectTermsMngList(tERMS_TY_CD[i]);
			
			String essnAgrYn	= (String) termsMngInfo.get("essnAgrYn");
			
			int termsMngNo 		= (int) termsMngInfo.get("termsMngNo");
			
			if("Y".equals(essnAgrYn)) {
				termsEssnAgrYnCnt++;
				
				for(int j = 0 ; j < chkAgreeData.length ; j++) {
					
					if(termsMngNo == Integer.parseInt(chkAgreeData[j])) {
						chkAgreeDataCnt++;
					}
				}
			}
			
		}
		
		if(termsEssnAgrYnCnt == chkAgreeDataCnt) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public int selectDuplicateIdCnt(String loginId) {
		return joinMapper.selectDuplicateIdCnt(loginId);
	}

	@Override
	public List<EgovMap> selectEmailDomainList(String eMAIL_DOMAIN) {
		return joinMapper.selectEmailDomainList(eMAIL_DOMAIN);
	}

	@Override
	public void saveJoinMbrTx(JoinVO joinVO) throws Exception {

		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		List<EgovMap> termsMngList = (List<EgovMap>) request.getAttribute("termsMngList");
		
		System.out.println("### termsMngList : " + termsMngList);
		
		//비밀번호 단방향 암호화
		String encPwd = EgovFileScrty.encryptPassword(joinVO.getPwd(), joinVO.getLoginId());
		
		System.out.println("### encPwd : " + encPwd);
		
		joinVO.setPwd(encPwd);
		
		joinMapper.insertJoinMbr(joinVO);
		
		String mbrNo = joinVO.getMbrNo();
		
		List<String> chkAgreement = joinVO.getChkAgreement();
		
		int termsMngListLength = termsMngList.size();
		
		for(int i = 0 ; i < termsMngListLength ; i++){
			Integer termsMngNo = (Integer) termsMngList.get(i).get("termsMngNo");
			String essnAgrYn = (String) termsMngList.get(i).get("essnAgrYn");
			
			EgovMap castMap = new EgovMap();
			
			castMap.put("mbrNo", mbrNo);
			castMap.put("termsMngNo", termsMngNo);
			castMap.put("essnAgrYn", essnAgrYn);
			
			if("N".equals(essnAgrYn)){
				
				for(int j = 0 ; j < chkAgreement.size() ; j++){
					String chkAgreementData = chkAgreement.get(j);
					
					if(chkAgreementData.equals(String.valueOf(termsMngNo))) {
						castMap.put("agrYn", "Y");
						
						if (chkAgreementData.equals("4")) {
							joinMapper.updateMrktAgr(mbrNo);
						}
					}
				}
			}
			
			joinMapper.insertTermsAgr(castMap);
		}

	}

	@Override
	public void mailSend(JoinVO joinVO) {
		String email = joinVO.getEmail();
		String title = "회원가입 완료 메일";
		String text = "<b>" + joinVO.getMbrNm() + "</b>님 요가야 쇼핑몰에 회원가입 해주셔서 감사합니다.";
		
		mailService.mailSendService(email, title, text);
	}

}
