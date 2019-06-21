package egovframework.example.cmmn.utils;

import java.util.Map;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class CmmnUtil {

	public static PaginationInfo getPageInfo(Map<String, Object> map) throws Exception {
		
		int pageNo = NumberUtil.parseInt(String.valueOf(map.get("pageNo")), 1);			// 페이지 번호
		int lineSize = NumberUtil.parseInt(String.valueOf(map.get("lineSize")), 18);	// 한 페이지 보여줄 목록 수
		int pageSize = NumberUtil.parseInt(String.valueOf(map.get("pageSize")), 10);	// 페이지 블록 수
		int totalCnt = NumberUtil.parseInt(String.valueOf(map.get("totalCount")), 0);	// 전체 목록 수

		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPageNo(pageNo);
		pageInfo.setRecordCountPerPage(lineSize);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalRecordCount(totalCnt);

		map.put("lineSize", pageInfo.getRecordCountPerPage());
		map.put("offset", pageInfo.getFirstRecordIndex());
		
		return pageInfo;
	}
}
