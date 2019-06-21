package egovframework.example.online.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.online.service.OnlineService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("onlineService")
public class OnlineServiceImpl implements OnlineService {

	@Resource(name="onlineMapper")
	private OnlineMapper onlineMapper;
	
	@Override
	public List<EgovMap> selectOnlineRandomList() throws Exception {
		return onlineMapper.selectOnlineRandomList();
	}

	@Override
	public int selectTotalCount(Map<String, Object> paramMap) throws Exception {
		return onlineMapper.selectTotalCount(paramMap);
	}

	@Override
	public List<EgovMap> selectVdoList(Map<String, Object> paramMap) throws Exception {
		return onlineMapper.selectVdoList(paramMap);
	}

	@Override
	public List<EgovMap> selectOnlineCtgrList() throws Exception {
		return onlineMapper.selectOnlineCtgrList();
	}
}
