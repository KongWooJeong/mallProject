package egovframework.example.payment.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface PaymentService {

	EgovMap selectUserList(String mbrNo);
	List<EgovMap> selectCartList(String mbrNo);
	void insertPaymentList(Map<String, Object> reqParam);
	String selectMbrNoList(String mbrNo);


}
