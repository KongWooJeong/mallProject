package egovframework.example.cmmn.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.example.login.service.SessionVO;

public class SessionUtil {
	
	private static String SESSION_DATA_KEY		= "sessionVO";
	private static HttpServletRequest REQUEST	= null;
	
	public static void setRequest() {
		REQUEST = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	// session에 key 이름으로 등록된 data 삭제
	public static void removeData(String key) {
		setRequest();
		
		REQUEST.getSession().removeAttribute(key);
	}
	
	// SessionData 삭제
	public static void removeSession() {
		setRequest();
		
		REQUEST.getSession().removeAttribute(SESSION_DATA_KEY);
	}

	// SessionData를 session에 저장
	public static void setSessionData(SessionVO sessionData) {	
		setRequest();
		
		setData(SESSION_DATA_KEY, sessionData);
	}
	
	// SessionData 가져오기
	public static SessionVO getSessionData() {
		setRequest();
		
		return (SessionVO) getData(SESSION_DATA_KEY);
	}
	
	// session에서 key 이름으로 저장된 data 가져오기
	public static Object getData(String key) {
		setRequest();
		
		return REQUEST.getSession().getAttribute(key);
	}
	
	// session에 key 이름으로 data 저장
	public static void setData(String key, Object data) {
		setRequest();
		
		if (key != null && data != null) {
			REQUEST.getSession().setAttribute(key, data);
		}
	}
}
