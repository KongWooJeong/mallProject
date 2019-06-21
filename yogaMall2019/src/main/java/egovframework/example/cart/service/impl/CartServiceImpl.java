package egovframework.example.cart.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cart.service.CartService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class CartServiceImpl implements CartService {

	@Resource
	private CartMapper cartMapper;

	@Override
	public List<EgovMap> selectCartList(String mbrNo) throws Exception {
		return cartMapper.selectCartList(mbrNo);
	}

	@Override
	public int selectCntList(Map<String, Object> reqParam) throws Exception {
		return cartMapper.cntCartList(reqParam);	
		
	}	
	
	@Override
	public void insertCart(Map<String, Object> reqParam) throws Exception {
		cartMapper.insertCart(reqParam); 
	}

	@Override
	public void updateCart(Map<String, Object> reqParam) throws Exception {
		cartMapper.updateCart(reqParam);		
	}
	
	@Override
	public void deleteCart(EgovMap info) throws Exception {
		cartMapper.deleteCart(info);
	}

	@Override
	public void modify(HashMap<String, Object> info) throws Exception {
		cartMapper.modify(info);
	}
}
