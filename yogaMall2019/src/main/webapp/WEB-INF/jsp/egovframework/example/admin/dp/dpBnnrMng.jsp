<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<style>
</style>
<script>

	var dpBnnrCls = {
		
		$jqGrid		: $,
		
		gridInit	: function() {
			this.$jqGrid = $("#jqGrid");
		},
		
		gridInitFn	: function() {
			this.$jqGrid.jqGrid({
				
				url			: "<c:url value='/dpBnnrList.do'/>",
				datatype	: "local",
				colModel	: [
					{label : "번호", 			name : "bnnrMngNo",		 width : 60,		align : "right", hidden : true},
					{label : "제목", 			name : "subj",			 width : 260,		align : "left"	},
					{label : "전시기간", 		name : "exposurePeriod", width : 260,		align : "center"},
					{label : "진행상태", 		name : "status",		 width : 90,		align : "center"},
					{label : "전시여부", 		name : "dpYn",			 width : 90,		align : "centet"},
					{label : "등록자", 		name : "regr",		  	 width : 90,		align : "center"},
					{label : "등록일", 		name : "regDt",			 width : 90,		align : "center"}
				],
				
				height		: "480",
				autowidth	: true,
				rownumbers	: true,
				caption		: "배너관리"
			})
		},
		
		goSearch	: function() {
			
			this.$jqGrid.setGridParam({
				
				datatype		: "json",
				mtype			: "GET",
				
				loadComplete	: function(data) {
					console.log("data : ", data);
				}
			}).trigger("reloadGrid");
		},
		
		pageMoveFn	: function() {
			location.href = "<c:url value = '/dpBnnrReg.do'/>";
		}
		
	}
	
	$(function() {
		dpBnnrCls.gridInit();
		dpBnnrCls.gridInitFn();
	})
</script>

<h2 class="tit">배너 관리</h2>
<div class="btn-wrap mgt-20">
	<div class="right text-right">
		<ul>
			<li><button type="button" class="btn-box-04" onclick="dpBnnrCls.goSearch()">검색</button></li>
		</ul>
	</div>
</div>
<table id="jqGrid"></table>
	<div class="btn-wrap mgt-20">
		<div class="right text-right">
			<ul>
				<li><button type="button" class="btn-box-06" onclick="dpBnnrCls.pageMoveFn()">등록</button></li>
			</ul>
		</div>
	</div>
