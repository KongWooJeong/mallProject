<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<script>
	var dpBnnrDtlCls = {
			
			$bnnrDtlGrid	: $,
			
			gridInit		: function() {
				this.$bnnrDtlGrid = $("#dpBnnrDtl");
			},
			
			gridInitFn		: function() {
				this.$bnnrDtlGrid.jqGrid({
					
					colModel	: [
						{label : "배너내용", 		name : "bnnrConts",		width : 150,		align : "right"},
						{label : "배너이미지", 	name : "imgAttFile",	width : 200,		align : "left"},
						{label : "URL", 		name : "bnnrUrl",		width : 150,		align : "center"},
						{label : "노출순서", 		name : "sortSeq",		width : 50,			align : "center"},
						{label : "구분", 			name : "btn",			width : 50,			align : "center", 
							formatter : gridActionCls.gubunBtn}
					],
					autowidth 	: true,
					cellEdit	: true,
					cellsubmit	: "clientArray"
				})
			}
			
	}
	
	var validChkCls = {
			
		gridValidChkFn	: function() {
			var $bnnrDtlGrid 	= $("#dpBnnrDtl");
			var dataList		= $bnnrDtlGrid.getRowData(),
				colModelArr		= $bnnrDtlGrid.getGridParam("colModel"),
				eachEmptyChk	= 0,
				eachNumChk		= 0;
			
			// console.log("dataList : ", dataList);
			
			for (var i = 0, length = dataList.length; i < length; i++) {
				
				for (var j = 0, cmLength = colModelArr.length - 1; j < cmLength; j++) {
					var data 	= dataList[i][colModelArr[j]["name"]];
					var val 	= CmmnJsUtil.isEmpty(data);
					
					if (val) {
						eachEmptyChk++;
					}
					
					if (colModelArr[j]["name"] === "sortSeq" && !(CmmnJsUtil.isNumeric(data))) {
						eachNumChk++;
					}
				}
			}
			
			if (eachEmptyChk > 0) {
				alert("빈 값이 존재합니다.");
				
				return false;
			}
			
			if (eachNumChk > 0) {
				alert("노출 순서는 숫자만 입력가능합니다.");
				
				return false;
			}
			
			return true;
			
		},
		
		emptyChkFn		: function() {
			var bool = true;
			
			$(".empty").each(function() {
				var $this = $(this);
				var removeBlankData = $this.val().replace(/(\s*)/g, "");
				
				$this.val(removeBlankData);
				
				if (bool === true && $this.val() === "") {
					alert($this.data("name") + "은/는 필수 입력 값입니다");
					
					bool = false;
				}				
			})
			
			return bool;
			
		},
		
		radioChkFn		: function() {
			var bool = true;
			
			$(".radioOnly").each(function() {
				var $this = $(this);
				var radioChkedLength = $this.find("input[type='radio']:checked").length;
				
				if (bool === true && radioChkedLength < 1) {
					alert($this.data("name") + "은/는 필수 입력 값입니다");
					
					bool = false;
				}				
			});
			
			return bool;
		}
	}
	
	var gridActionCls = {
		
		validChkCallFn	: function() {
			
			if(!validChkCls.gridValidChkFn()) {
				return false;
			}
			
			if(!validChkCls.emptyChkFn()) {
				return false;
			}
			
			if(!validChkCls.radioChkFn()) {
				return false;
			}
			
			return true;
		},
			
		insertFn		: function() {
			$("#dpBnnrDtl").editCell(0, 0, false);
			
			if(!this.validChkCallFn()) {
				return;
			}
			
			// 배너관리데이터
			var bnnrMngData = {
				
				subj		: $("input[name='subj']").val(),
				dpStrtDt	: $("input[name='dpStrtDt']").val(),
				dpEndDt		: $("input[name='dpEndDt']").val(),
				dpYn		: $("input[name='dpYn']:checked").val()
			}
			
			var gridRowData = $("#dpBnnrDtl").getRowData();
			
			
			$.ajax({
				
				url		: "<c:url value='/saveBnnrData.do'/>",
				type	: "POST",
				data	: {	"bnnrMngData" : JSON.stringify(bnnrMngData),
							"gridRowData" : JSON.stringify(gridRowData)},
							
				success : function(data) {
					
					if(data.result === "success") {
						alert("저장에 성공 하셨습니다");
						
						location.href = "<c:url value='/admin.do'/>";
					} else if (data.result === "fail") {
						alert("저장에 실패하셨습니다");
					}
				}
			})
		},
			
		delRowFn		: function(rowId) {
			$bnnrDtlGrid = $("#dpBnnrDtl");
			
			$bnnrDtlGrid.delRowData(rowId);
		},
		
		gubunBtn		: function(cellValue, options, rowObject) {
			console.log("cellValue : ", cellValue);
			console.log("options : ", options);
			console.log("rowObject : ", rowObject);
			
			var data = "<a href='#' onclick='gridActionCls.delRowFn(" + 
					options.rowId + ")'>행삭제</a>";
			
			return data;
		},
		
		addRowFn		: function() {
			var $bnnrDtlGrid	= $("#dpBnnrDtl");
			var addData			= {},
				totalRecord		= 0,
				colModelArr		= $bnnrDtlGrid.getGridParam("colModel"),
				idsArr			= $bnnrDtlGrid.jqGrid("getDataIDs");
			
			console.log("idsArr : " , idsArr);
			console.log("colModelArr : ", colModelArr);
			// console.log("totalReocord : ", totalRecord);
			
			console.log("Max value : ", Math.max.apply(null, idsArr));
			
			if (idsArr.length !== 0) {
				totalRecord = Math.max.apply(null, idsArr);
			}
			
			for(var i = 0, length = colModelArr.length; i < length; i++) {
				addData[colModelArr[i].name] = "";
				
				if(colModelArr[i].name === "btn") {
					$bnnrDtlGrid.setColProp(colModelArr[i].name, {editable : false});
				} else {
					$bnnrDtlGrid.setColProp(colModelArr[i].name, {editable : true});	
				}
				
			}
			
			$bnnrDtlGrid.addRowData(totalRecord + 1, addData);			
		}
	}
	
	var CmmnJsUtil = {

		    isEmpty : function(val) {
		    val = val + "";
		    
		    // 공백제거
		     val = val.replace(/(\s*)/g, "");
		    
		        if (null == val || "" == val ||
		        val == undefined || typeof(val) == undefined ||
		        "undefined" == val || "NaN" == val) {
		            return true;
		        } else {
		            return false;
		        }
		    },
		    
		    isNumeric : function(val) {

		    if (/^[0-9]*$/.test(val)) {
		            return true;
		        } else {
		            return false;
		        }
		    }
	}
		
	$(function() {
		dpBnnrDtlCls.gridInit();
		dpBnnrDtlCls.gridInitFn();
	})
</script>



<div style="position:relative;margin-top:20px;">
    <div class="page-nav-wrap" style="top: 10px;right: 0;">
        <span class="ico-home-01"></span>
        <span class="ico-arr-right-02"></span>
        <a href="#">메뉴 1</a>
        <span class="ico-arr-right-02"></span>
        <a href="#">메뉴 2</a>
        <span class="ico-arr-right-02"></span>
        <a href="#">메뉴 3</a>
    </div>
</div>

<h2 class="tit">배너 등록</h2>

<div class="table-wrap type2 mgt-20">
	<legend>배너 등록</legend>
	<table cellspacing="0" border="1" class="tbl-type type1">
       	<caption>배너 등록</caption>
       	<colgroup>
           	<col style="width:13%;"/>
           	<col style="width:37%;"/>
           	<col style="width:13%;"/>
           	<col style="width:37%;"/>
       	</colgroup>
       	<tbody>
           	<tr>
               	<th scope="row">제목</th>
               	<td scope="row" colspan="3">
                   	<input type="text" name="subj" class="ui-ipt empty" data-name="제목" style="width:100%" maxlength="50" >
               	</td>
           	</tr>
           	<tr>
               	<th scope="row">전시 기간</th>
               	<td scope="row" colspan="3">
               		<div class="cal-wrap">
               			<input type="text" name="dpStrtDt" class="ui-ipt empty" data-name="전시시작일자" data-data="start"
               				value="<c:out value='${bnnrMngInfo.dpStrtDe }'/>" readonly>
               			<button type="button" class="btn-cal"><span class="ico-cal-01"></span></button>
               		</div>
               		<div class="cal-wrap">
               			<input type="text" name="dpEndDt" class="ui-ipt empty" data-name="전시종료일자" data-data="start"
               				value="<c:out value='${bnnrMngInfo.dpEndDe}'/>" readonly>
               			<button type="button" class="btn-cal"><span class="ico-cal-01"></span></button>
               		</div>
               	</td>
           	</tr>
           	<tr>
				<th scope="row">공개 여부</th>
               	<td scope="row" colspan="3">
               		<div class="radioOnly" data-name="전시여부">
               			<ul class="ui-radio">
	                    	<li>
	                        	<input type="radio" id="rdo1" name="dpYn" value="Y" 
	                        		<c:if test='${bnnrMngInfo.dpYn eq "Y"}'> checked="checked" </c:if> />
	                        	<label for="rdo1"><span>Y</span></label>
	                      	</li>
	                      	<li>
	                           	<input type="radio" id="rdo2" name="dpYn" value="N"
	                           		<c:if test='${bnnrMngInfo.dpYn eq "N"}'> checked="checked" </c:if> />
	                           	<label for="rdo2"><span>N</span></label>
	                      	</li>
                   		</ul>
               		</div>
               	</td>
           	</tr>
       	</tbody>
   	</table>
</div>

<div class="pd-table mgt-20">
	<div class="btn-wrap mgt-10">
		<div class="right text-right">
			<ul>
				<li><button type="button" class="btn-box-17" onclick="gridActionCls.removeRowFn()">삭제</button></li>
				<li><button type="button" class="btn-box-16" onclick="gridActionCls.addRowFn();">추가</button></li>
			</ul>
		</div>
	</div>
	<table id="dpBnnrDtl"></table>
</div>

<div class="btn-wrap mgt-20">
  	<div class="center">
    	<ul>
      		<li><button type="button" class="btn-box-06" onclick="gridActionCls.insertFn();">등록</button></li>
      		<li><button type="button" class="btn-box-07">취소</button></li>
    	</ul>
  	</div>
</div>