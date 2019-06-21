package egovframework.example.payment.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface PaymentMapper {

	EgovMap selectUserList(String mbrNo);

	List<EgovMap> selectCartList(String mbrNo);

	void insertPaymentList(Map<String, Object> reqParam);

	String selectMbrNoList(String mbrNo);


}
