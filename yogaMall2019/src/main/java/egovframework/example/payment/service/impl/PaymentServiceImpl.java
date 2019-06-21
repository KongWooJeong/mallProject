package egovframework.example.payment.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.payment.service.PaymentService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Resource
	private PaymentMapper paymentMapper;

	@Override
	public EgovMap selectUserList(String mbrNo) {
		// TODO Auto-generated method stub
		return paymentMapper.selectUserList(mbrNo);
	}

	@Override
	public List<EgovMap> selectCartList(String mbrNo) {
		// TODO Auto-generated method stub
		return paymentMapper.selectCartList(mbrNo);
	}

	@Override
	public void insertPaymentList(Map<String, Object> reqParam) {
		paymentMapper.insertPaymentList(reqParam);
		
	}

	@Override
	public String selectMbrNoList(String mbrNo) {
		// TODO Auto-generated method stub
		return paymentMapper.selectMbrNoList(mbrNo);
	}

	
	

}
