package egovframework.example.login.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.example.cmmn.EgovFileScrty;
import egovframework.example.cmmn.utils.GenerateCertPwd;
import egovframework.example.cmmn.utils.IPTraceUtils;
import egovframework.example.cmmn.utils.SessionUtil;
import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.SessionVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper loginMapper;

	// map : 로그인 정보(id, pwd)
	@Override
	public EgovMap loginProc(Map<String, Object> map) throws Exception {
		EgovMap resultMap = new EgovMap();

		resultMap.put("result", "fail");
		resultMap.put("msg", "로그인 정보를 확인해 주시기 바랍니다.");

		try {

			// 탈퇴 테이블 확인
			int wthdCnt = loginMapper.selectWthdMbrCnt(map);

			if (wthdCnt > 0) { // 로그인 정보 탈퇴 테이블에 있을 경우
				System.out.println("탈퇴 테이블 확인");
				resultMap.put("msg", "탈퇴회원입니다.");
				return resultMap;
			}

			// 휴면 테이블 확인
			EgovMap dormInfo = loginMapper.selectDormInfo(map);

			if (dormInfo != null) {
				String pwd = (String) map.get("pwd"), // 로그인한 비밀번호
						id = (String) map.get("id"), // 로그인한 아이디
						infoPwd = (String) dormInfo.get("pwd"); // 휴면회원 테이블 비밀번호

				String encPwd = EgovFileScrty.encryptPassword(pwd, id);

				if (encPwd.equals(infoPwd)) { // 로그인 정보가 휴면 테이블에 있을 경우
					resultMap.put("result", "dormSuccess");
					resultMap.put("mbrNo", dormInfo.get("mbrNo"));
					resultMap.put("id", map.get("id"));
					resultMap.put("msg", "휴면회원입니다.");
					System.out.println("휴면");
					return resultMap;
				} else {
					System.out.println("휴면 실패");
					return resultMap;
				}
			} else {

				// 정상 회원 테이블 확인
				EgovMap mbrInfo = loginMapper.selectMbrInfo(map);

				if (mbrInfo != null) {
					int loginFailCnt = (Integer) mbrInfo.get("loginFailCnt");	// 로그인 실패 횟수

					if (loginFailCnt >= 5) {
						String isLoginPossible = (String) mbrInfo.get("isLoginPossible"); // 로그인 가능 여부

						if ("Y".equals(isLoginPossible)) {
							System.out.println("실패 횟수 5이상 로그인 가능");
							
							map.put("mbrNo", mbrInfo.get("mbrNo"));
							
							loginMapper.updateFailProc(map);
						} else {
							resultMap.put("msg", "로그인 실패가 5번이 넘어 로그인이 불가합니다. 잠시 후 다시 시도해주시기 바랍니다.");
							System.out.println("실패 횟수 5이상 로그인 불가");
							return resultMap;
						}
					} 
					
					String 	id 		= (String) map.get("id"),
							pwd		= (String) map.get("pwd");
					
					String encPwd	= EgovFileScrty.encryptPassword(pwd, id);
					
					map.put("encPwd", encPwd);
					
					EgovMap idPwdMbrInfo = loginMapper.selectMbrInfo(map);
					
					if (idPwdMbrInfo != null) {
						System.out.println("아이디 비번 일치");
						
						String tempPwdUseYn = (String) idPwdMbrInfo.get("tempPwdUseYn");
						
						if ("Y".equals(tempPwdUseYn)) {
							map.put("loginSuccess", "success");
							
							map.put("mbrNo", idPwdMbrInfo.get("mbrNo"));
							
							loginMapper.updateFailProc(map);
							
							HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
							
							map.put("sessionId", request.getSession().getId());
							
							map.put("ip", IPTraceUtils.getRemoteAddr(request));
							
							map.put("id", id);
							
							loginMapper.insertLoginHistory(map);
							
							SessionVO sessionVO = new SessionVO();
							
							sessionVO.setLoginId(id);
							sessionVO.setPwd(pwd);
							sessionVO.setMbrNo((String) idPwdMbrInfo.get("mbrNo"));
							sessionVO.setMbrNm((String) idPwdMbrInfo.get("mbrNm"));
							sessionVO.setMbrGrdCd((String) idPwdMbrInfo.get("mbrGrdCd"));
							sessionVO.setCpNo((String) idPwdMbrInfo.get("cpNo"));
							sessionVO.setEmail((String) idPwdMbrInfo.get("email"));
							sessionVO.setRoadNmBscAddr((String) idPwdMbrInfo.get("roadNmBscAddr"));
							sessionVO.setRoadNmDtlAddr((String) idPwdMbrInfo.get("roadNmDtlAddr"));
							sessionVO.setZipCode((String) idPwdMbrInfo.get("zipcode"));
							
							SessionUtil.setSessionData(sessionVO);
							
							resultMap.put("result", "success");
							resultMap.put("msg", "로그인에 성공했습니다.");
							
						} else {
							resultMap.put("msg", "비밀번호 재발급 후 다시 로그인하여 주시기 바랍니다.");
							
							return resultMap;
						}
					} else {
						System.out.println("아이디 비밀번호 불일치");
						
						map.put("mbrNo", mbrInfo.get("mbrNo"));
						
						map.put("prc", "failCntInc");
						
						loginMapper.updateFailProc(map);
						
						return resultMap;
					}
					
				} else {

					return resultMap;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	@Override
	public EgovMap selectIdInfo(Map<String, Object> paramMap) throws Exception {
		EgovMap resultMap = new EgovMap();
				
		// 회원이름, 핸드폰 번호로 ID 존재 여부 확인
		String id = loginMapper.selectIdInfo(paramMap);
		
		if (id == null) {
			resultMap.put("msg", "아이디가 존재하지 않습니다. 다시 시도하여주시기 바랍니다.");
		} else {
			resultMap.put("msg", "아이디는 " + id + "입니다.");
		}
			
		return resultMap;
	}
	
	@Override
	public EgovMap selecPwdInfo(Map<String, Object> paramMap) throws Exception {
		EgovMap resultMap = new EgovMap();		
		
		// paramMap 정보 회원 테이블에서 확인
		int result = loginMapper.selectIdCnt(paramMap);
				
		if (result == 0) {
			resultMap.put("msg", "회원정보를 다시 입력해주세요.");
		} else if (result == 1) {						
			String 	id		= (String) paramMap.get("loginId"),
					newPwd 	= GenerateCertPwd.excuteGenerate(),				// 랜덤으로 임시비밀번호 생성(숫자, 특수문자 조합 8자)
					encPwd 	= EgovFileScrty.encryptPassword(newPwd, id);	// 새로 생성한 비밀번호 암호화
			
			paramMap.put("encPwd", encPwd);
			
			// 임시비밀번호로 회원정보 변경
			loginMapper.updateEncPwd(paramMap);
			
			resultMap.put("msg", "임시비밀번호는 " + newPwd + "입니다.");
		}
		
		return resultMap;
	}
}
