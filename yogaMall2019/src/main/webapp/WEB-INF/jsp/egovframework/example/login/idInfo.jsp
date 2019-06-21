<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script type="text/javascript">
	var loginMbrInfo = {

		init : function() {
			var that = this, $num = $(".num");

			// 숫자 확인
			$num.numeric("positiveInteger");

			// 숫자 4자리 초과 확인
			$num.keyup(function() {
				var $this = $(this);

				if ($this.val().length > 4) {
					$this.val($this.val().substring(0, 4));
				}
			});
		},

		submitFn : function() {
			
			this.mergeProcFn(); // 휴대폰 값 합치기

		    if (!this.emptyChkFn()) { // 빈 칸 확인
				return;
			}
			
			if (!this.phoneChkFn()) { // 휴대폰 유효성 확인
				return;
			} 
			
			param = {
				"mbrNm"	: $("#mbrNm").val(),
				"cpNo"	: $("#cpNo").val()
					
			}
			
			$.ajax({
				type	: "post",
				url		: "<c:url value='/checkId.do'/>",
				data	: param,
				success : function(result) {
					var jObj = JSON.parse(result);
					
					commAlertPop.popUp("아이디 확인", jObj.msg);
				}
				
			});
			
		},
		
		// 휴대폰 유효성 검사
		phoneChkFn : function() {
			var regExp = /^(01[016789]{1})[1-9]{3,4}[1-9]{4}$/, $cpNo = $("#cpNo");

			commValidCheck.popUp(regExp, $cpNo, "핸드폰 번호가 유효하지 않습니다.");
			return commValidCheck.bool;
		},

		// hidden input에 값 합치기(휴대폰)
		mergeProcFn : function() {
			$("#cpNo").val(
					$("#cpNoFirst").val() + $("#cpNoMiddle").val() + $("#cpNoEnd").val());

		},

		// 빈칸 확인
		emptyChkFn : function() {
			var bool = true;

			$(".empty").each(
					function() {
						var $this = $(this), removeBlankData = $this.val()
								.replace(/(\s*)/g, ""), name = $this
								.data("name");

						$this.val(removeBlankData); // 공백 제거

						if (bool === true && $this.val() === "") {
							commAlertPop.popUp(name, name + "은/는 필수 입력 값입니다.",
									function() {
										$this.focus();
									})
							bool = false;
						}
					})

			return bool;
		}
	}	
	
	$(function() {
		loginMbrInfo.init();
		
	})
</script>
<!-- container -->

<div id="wrapper" class="member join">
	<div id="info-container">
		<div class="info-center-wrap">
			<div class="tit">
				<h3>아이디 찾기</h3>
				<p>회원정보에 저장된 이름, 핸드폰 번호로 아이디를 찾을 수 있습니다.</p>
			</div>
			<div class="join-group">
				<div class="join-row">
					<div class="join-item">
						<h3 class="item-tit txt-regular">
							<span>이름</span>
						</h3>
						<input id="mbrNm" name="mbrNm" data-name="이름" class="ui-ipt empty" />

					</div>
				</div>
				<div class="join-row phone ipt-bar">
					<div class="join-item">
						<h3 class="item-tit txt-regular">
							<span>휴대폰</span>
						</h3>
						<select name="cpNoFirst" id="cpNoFirst" data-name="휴대폰">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> <span class="bar"></span> <input type="text" name="cpNoMiddle"
							id="cpNoMiddle" data-name="휴대폰"
							class="ui-ipt ipt-phone num empty"> <span class="bar"></span>
						<input type="text" name="cpNoEnd" id="cpNoEnd" data-name="휴대폰"
							class="ui-ipt ipt-phone num empty">
						<p class="sub-info-txt">
							<span class="ui-bullet"></span> 예) 000 - 000 - 0000
						</p>
						<input type='hidden' id="cpNo" name="cpNo" data-name="휴대폰" />
					</div>
				</div>
			</div>
		</div>
		<div class="number-ipt-wrap txt-center mgt-60">
			<div class="inner-wrap inline-block">
				<div class="relative" style="padding-left: 0px;">
					<button class="ui-btn-blue-md btn-certify" type="button" onclick="location.href ='<c:url value="/login.do"/>'" style="background-color:gray;">
						<span class="txt-medium">돌아가기</span>
					</button>
					<button class="ui-btn-blue-md btn-certify" type="button" onclick="loginMbrInfo.submitFn()">
						<span class="txt-medium">확인</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!--// container -->