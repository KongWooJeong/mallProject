<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script type="text/javascript">	
	$(function() {
		wthd.setRadio();
	})

	var wthd = {
			
		wthdRsnCd : "",	
			
		init		: function() {
			
			if (!this.checkRadio()) {
				return;
			}
			
			$("#wthd-form").attr("action", "<c:url value='/withdraw.do'/>");
			$("#wthd-form").submit();
		},
		
		setRadio	: function() {
			
			$("input[type=text]").on("focus", function() {
				$(this).prev().find("input[type=radio]").prop("checked", true);
			})
		},
		
		checkRadio	: function() {
			var result 	= true,
				that	= this;
			
			$(".wthd-item").each(function() {
				var $this 				= $(this),
					radioLength 		= $this.find("input[type=radio]:checked").length,
					checkedRadio 		= $this.find("input[type=radio]:checked");
					
				that.wthdRsnCd = checkedRadio.data("code");
								
				if (result === true && radioLength === 0) {
					commAlertPop.popUp("탈퇴 사유", "탈퇴 사유를 선택해주세요.");
					
					result = false;
				}
				
				if (checkedRadio.data("code") === 50) {
					var $input			= $this.find("input[type=text]"),
						removeBlankData = $input.val().replace(/(\s*)/g, "");
					
					$input.val(removeBlankData);
					
					if ($input.val() === "") {
						commAlertPop.popUp("탈퇴 사유", "탈퇴 사유를 작성해주세요.");
						
						result = false;
					}
				}
			})	
			
			return result;
		}
	}
</script>
<!-- container -->

<div id="wrapper" class="member wthd">
	<form id="wthd-form" method="post" action="">
	<div id="info-container">
		<div class="wthd-center-wrap">
			<div class="tit">
				<h3>요가야 회원 탈퇴</h3>
				<p style="padding-left: 10px;">탈퇴 이유를 선택해주세요.</p>
			</div>
			<div class="wthd-group">
				<div class="wthd-row">
					<div class="wthd-item">
						<c:forEach items="${wthdRsnList}" var="list">
							<c:choose>
								<c:when test="${list.cmmCd eq '50' }">									
									<label><input type="radio" data-code="${list.cmmCd}" name="wthdRsnCd" value="${list.cmmCd }">${list.cmmCdNm }</label>									
									<input type="text" name="wthdRsn" class="ui-ipt">									
								</c:when>
								<c:otherwise>									
									<label><input type="radio" data-code="${list.cmmCd}" name="wthdRsnCd" value="${list.cmmCd}">${list.cmmCdNm }</label>																											
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</div>
				</div>
				
			</div>
		</div>
		<div class="number-ipt-wrap txt-center mgt-60">
			<div class="inner-wrap inline-block">
				<div class="relative" style="padding-left: 0px;">
					<button class="ui-btn-blue-md btn-certify" type="button" onclick="location.href ='<c:url value="/main.do"/>'" style="background-color:gray;">
						<span class="txt-medium">취소</span>
					</button>
					<button class="ui-btn-blue-md btn-certify" type="button" onclick="wthd.init()">
						<span class="txt-medium">확인</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>


<!--// container -->