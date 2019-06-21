package egovframework.example.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.admin.service.AdminService;
import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private AdminMapper adminMapper;

	@Override
	public List<EgovMap> selectBnList(Map<String, Object> map) {
		return adminMapper.selectBnList(map);
	}

	@Override
	public EgovMap saveBnnrData(Map<String, Object> map) {
		EgovMap result = new EgovMap();
		
		try {
			String 	bnnrMngData	= (String) map.get("bnnrMngData"),
					gridRowData	= (String) map.get("gridRowData");
				
			Map<String, Object> 		bnnrMngDataMap = JsonUtil.JsonToMap(bnnrMngData);
			
			List<Map<String, Object>> 	gridRowDataList = JsonUtil.JsonToList(gridRowData);
			
			adminMapper.insertBnnrMng(bnnrMngDataMap);
			
			for(int i = 0; i < gridRowDataList.size(); i++) {
				Map<String, Object> tempMap = gridRowDataList.get(i);
				
				tempMap.put("bnnrMngNo", bnnrMngDataMap.get("bnnrMngNo"));
				
				adminMapper.insertBnnrDtl(tempMap);
			}
			
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			
			e.printStackTrace();
		}
		
		return result;
	}

}
