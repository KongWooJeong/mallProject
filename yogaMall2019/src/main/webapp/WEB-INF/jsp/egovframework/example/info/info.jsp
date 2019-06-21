<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script type="text/javascript" src="js/daumAddress.js"></script>
<style>
	.errorColor {
		color : red;
	}
</style>
<script type="text/javascript">
	
	var mbrInfoUpdate = {
			
		cpNo			: "<c:out value='${joinVO.cpNo}'/>",
		email			: "<c:out value='${joinVO.email}'/>",
				
		init			: function() {			
			var that 	= this,
				$num	= $(".num");
						
			// 숫자 확인
			$num.numeric("positiveInteger");
			
			// 숫자 4자리 초과 확인
			$num.keyup(function() {
				var $this = $(this);
				
				if ($this.val().length > 4) {
					$this.val($this.val().substring(0, 4));
				}
			})
			
			this.cpNoInputFn(this.cpNo, "cpNo");
			this.emailInputFn(this.email, "email");
		},
		
		// 회원 정보 수정
		submitFn		: function() {
			
			this.mergeProcFn();			// 휴대폰, 이메일 값 합치기
			
			if (!this.emptyChkFn()) {	// 빈 칸 확인
				return;
			}
						 
			if (!this.pwdChkFn()) {		// 비밀번호 유효성 확인
				return;
			} 
			
			if (!this.phoneChkFn()) {	// 휴대폰 유효성 확인
				return;
			}
			
			if (!this.radioChkFn()) {	// 라디오 버튼 체크 확인
				return;
			}
			
			if (!this.emailChkFn()) {	// 이메일 유효성 검사
				return;
			}		
					
			$("#joinVO").attr("action", "<c:url value='/updateMbrInfo.do'/>");
			$("#joinVO").submit();	 
			
		},
		
		// 회원 탈퇴
		withdraw	: function() {
			var loginId = $("#loginId").val(),
				pwd 	= $("#pwd").val();
			
			param = { "pwd" : pwd, "loginId" : loginId };
			
			this.mergeProcFn();			// 휴대폰, 이메일 값 합치기
			
			if (!this.pwdEmptyChkFn()) {	// 비밀번호 작성 확인
				return;
			}
			
			if (!this.pwdChkFn()) {		// 비밀번호 유효성 확인
				return;
			} 
					
			commAlertPop.popUp("회원 탈퇴", "요가야 회원 탈퇴 하시겠습니까?");
						
			// 비밀번호 확인
			$.ajax({
				url 		: "<c:url value='/confirmPwd.do'/>",
				type 		: "post",				
				data 		: param,
				success 	: function(result) {
					var jObj = JSON.parse(result);
					console.log(jObj);
					if (jObj.result === "success") {
						
						$("#joinVO").attr("action", "<c:url value='/wthdInfo.do'/>");
						$("#joinVO").submit();
					} else if (jObj.result === "fail") {
						commAlertPop.popUp("비밀번호 확인", "비밀번호를 다시 입력해 주십시오.")
					}
				}
				
			})			
			
		},
		
		// 라디오버튼 체크 확인
		radioChkFn		: function() {
			var bool = true;
			
			$(".radioOnly").each(function() {
				var $this			= $(this),
					radioChkLength	= $this.find("input[type='radio']:checked").length;
				
				if (bool === true && radioChkLength < 1) {
					commAlertPop.popUp("수신 여부", $this.data("name") + "은 필수 체크 값입니다.");
					
					bool = false;
				}				
			})
			
			return bool;
		},
		
		// 휴대폰 유효성 검사
		phoneChkFn		: function() {
			var regExp	= /^(01[016789]{1})[1-9]{3,4}[1-9]{4}$/,
				$cpNo	= $("#cpNo");
			
			commValidCheck.popUp(regExp, $cpNo, "핸드폰 번호가 유효하지 않습니다.");
			return commValidCheck.bool;
		},
		
		// 이메일 유효성 검사
		emailChkFn		: function() {
			var regExp	= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/,
				$email	= $("#email");
			
			commValidCheck.popUp(regExp, $email, "이메일이 유효하지 않습니다.");
			return commValidCheck.bool;
		},
		
		// hidden input에 값 합치기(휴대폰, 이메일)
		mergeProcFn		: function() {
			$("#cpNo").val($("#cpNoFirst").val() + $("#cpNoMiddle").val() + $("#cpNoEnd").val());
			$("#email").val($("#emailFirst").val() + "@" + $("#emailEnd").val());
		},
		
		// 비밀번호 유효성 확인
		pwdChkFn		: function() {
			var regExp		= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/,
				$pwd		= $("#pwd"),
				$pwdConfirm	= $("#pwdConfirm");
			
			commValidCheck.popUp(regExp, $pwd, "비밀번호는 영문/숫자/특수문자 포함 8~15자리로 해주세요.");
			
			if (commValidCheck.bool) {
				
				//	비밀번호 & 비밀번호 확인 일치 검사
				if (!($pwd.val() === $pwdConfirm.val())) {
					commAlertPop.popUp("비밀번호", "비밀번호가 일치하지 않습니다.",
										function() {
											$pwdConfirm.focus();
										}		
					)
					
					return false;
				}
				
				return true;
			}
			
		},
								
		// 빈칸 확인
		emptyChkFn			: function() {
			var bool = true;
			
			$(".empty").each(function() {
				var $this 			= $(this),
					removeBlankData = $this.val().replace(/(\s*)/g, ""),
					name			= $this.data("name");
				
				$this.val(removeBlankData);		// 공백 제거
				
				if (bool === true && $this.val() === "") {
					commAlertPop.popUp(name, name + "은/는 필수 입력 값입니다.",
										function() {
											$this.focus();
										})						
					bool = false;
				}
			})
			
			return bool;
		},
		
		// 비밀번호 확인
		pwdEmptyChkFn			: function() {
			var bool = true;
			
			$(".pwd").each(function() {
				var $this 			= $(this),
					removeBlankData = $this.val().replace(/(\s*)/g, ""),
					name			= $this.data("name");
				
				$this.val(removeBlankData);		// 공백 제거
				
				if (bool === true && $this.val() === "") {
					commAlertPop.popUp(name, name + "를 입력해 주세요.",
										function() {
											$this.focus();
										})						
					bool = false;
				}
			})
			
			return bool;
		},
		
		// 핸드폰 번호 유지
		cpNoInputFn			: function(cpNo, inputTarget) {	
			
			if (cpNo === "") {
				return;
			} else {
				var $firstTarget 	= $("#" + inputTarget + "First"),
					$middleTarget 	= $("#" + inputTarget + "Middle"),
					$endTarget 		= $("#" + inputTarget + "End");
				
				// 핸드폰 번호에 - 넣기
				cpNo = cpNo.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
				
				if (cpNo.indexOf("-") < 0) {
					$firstTarget.val("010");
				} else {				
					var cpNoArr = cpNo.split("-");
									
					$firstTarget.val(cpNoArr[0]);
					
					$middleTarget.val(cpNoArr[1]);
					
					$endTarget.val(cpNoArr[2]);
				}
				
			}
		},
		
		// 이메일 유지
		emailInputFn		: function(email, inputTarget) {
			
			if (email === "") {
				return;
			} else {
				$("#" + inputTarget + "First").val(email.split("@")[0]);
				$("#" + inputTarget + "End").val(email.split("@")[1]);
			}
		},
	}
	
	$(function() {
		mbrInfoUpdate.init();
	})
</script>

<div id="wrapper" class="member join">
	<div id="container" style="padding-top: 80px;">
		<form:form commandName="joinVO" method="post">
			<!-- contents -->
			<div class="center-wrap">
				<h3 class="heading-medium join-group-tit">회원 기본 정보</h3>
				<span class="sub-tit"><span>*</span><span>표시정보는 필수 입력 사항이니 반드시 입력해 주십시오.</span></span>
				<div class="join-group">
				
					<div class="join-row">
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>이름</span><span class="point">*</span>
							</h3>
							<form:input path="mbrNm" data-name="이름" readonly="true" value="${sessionVO.mbrNm }" cssClass="ui-ipt"/>	
							<form:hidden path="mbrNo" value="${sessionVO.mbrNo}"/>	
						</div>
					</div>
					<div class="join-row">
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>아이디</span><span class="point">*</span>
							</h3>
							<form:input path="loginId" data-name="아이디" readonly="true" value="${sessionVO.loginId }" class="ui-ipt empty"/>
						</div>
					</div>
					<div class="join-row">
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>비밀번호</span><span class="point">*</span>
							</h3>
							<form:password path="pwd" data-name="비밀번호" class="ui-ipt empty pwd"/>
							<form:errors path="pwd" class="errorColor" element="div"/>
							<p class="sub-info-txt">
								<span class="ui-bullet"></span> 비밀번호는 영문/숫자/특수문자 포함 8자리~15자리
							</p>
						</div>
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>비밀번호 확인</span><span class="point">*</span>
							</h3>
							<form:password path="pwdConfirm" data-name="비밀번호 확인" class="ui-ipt empty pwd"/>
							<form:errors path="pwdConfirm" class="errorColor" element="div"/>
						</div>
					</div>			
					
					<div class="join-row phone ipt-bar">						
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>휴대폰</span><span class="point">*</span>
							</h3>							
							<input name="cpNoFirst" id="cpNoFirst" data-name="휴대폰" type="text" class="ui-ipt ipt-phone" value="<c:out value='${sessionVO.cpNo.substring(0, 3) }'/>">  							
							<c:choose>
								<c:when test="${ fn:length(sessionVO.cpNo) eq 11}">
									<span class="bar"></span> 
									<input type="text" name="cpNoMiddle" id="cpNoMiddle" data-name="휴대폰" class="ui-ipt ipt-phone num empty" value="<c:out value='${sessionVO.cpNo.substring(3, 7) }'/>">
									<span class="bar"></span> 
									<input type="text" name="cpNoEnd" id="cpNoEnd" data-name="휴대폰" class="ui-ipt ipt-phone num empty" value="<c:out value='${sessionVO.cpNo.substring(7) }'/>">
								</c:when>
								<c:otherwise>
									<span class="bar"></span> 
									<input type="text" name="cpNoMiddle" id="cpNoMiddle" data-name="휴대폰" class="ui-ipt ipt-phone num empty" value="<c:out value='${sessionVO.cpNo.substring(3, 6) }'/>">
									<span class="bar"></span> 
									<input type="text" name="cpNoEnd" id="cpNoEnd" data-name="휴대폰" class="ui-ipt ipt-phone num empty" value="<c:out value='${sessionVO.cpNo.substring(6) }'/>">
								</c:otherwise>
							</c:choose>							
							<p class="sub-info-txt">
								<span class="ui-bullet"></span> 예) 000 - 000 - 0000
							</p>
							<form:hidden path="cpNo" data-name="휴대폰"/>
							<form:errors path="cpNo" class="errorColor" element="div"/>
						</div>
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>문자수신</span><span class="point">*</span>
							</h3>
							<div class="radioOnly" data-name="문자수신 여부">
								<div class="ui-radio">
									<form:radiobutton path="smsRcpYn" value="y"/>								 
									<label 	for="smsRcpYn1">받음</label>
								</div>
								<div class="ui-radio">
									<form:radiobutton path="smsRcpYn" value="n"/>
									<label for="smsRcpYn2">받지않음</label>								
								</div>
							</div>
							<p class="sub-info-txt">
								<span class="ui-bullet"></span> 수신동의시 이벤트 및 다양한 정보를 받으실 수 있습니다.
							</p>
							<form:errors path="smsRcpYn" class="errorColor" element="div"/>
						</div>
					</div>
					<div class="join-row">
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>배송받을 주소</span><span class="point">*</span>
							</h3>
							<form:input path="zipCode" data-name="우편번호" value="${sessionVO.zipCode }" class="ui-ipt empty"/>			
							<input type="button" data-popup="#pop-01" class="ui-btn-gray-md pop-call" onclick="daum_address.popUpAddress()" value="우편번호 검색">
							<form:errors path="zipCode" class="errorColor"/>
							<div class="sub-addr-wrap mgt-10">
								<form:input path="bsAddr" data-name="기본주소" value="${sessionVO.roadNmBscAddr }" class="ui-ipt empty"/>
								<form:input path="dtAddr" data-name="상세주소" value="${sessionVO.roadNmDtlAddr }" class="ui-ipt empty"/>
								<form:errors path="bsAddr" class="errorColor" element="div"/>
								<form:errors path="dtAddr" class="errorColor" element="div"/>
							</div>
						</div>
					</div>
					<div class="join-row email">
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>이메일</span><span class="point">*</span>
							</h3>
							<input type="text" name="emailFirst" id="emailFirst" data-name="이메일" class="ui-ipt empty" value="<c:out value='${sessionVO.email.split("@")[0] }'/>">
							<span>@</span>
							<input type="text" name="emailEnd" id="emailEnd" data-name="이메일" class="ui-ipt empty" value="<c:out value='${sessionVO.email.split("@")[1] }'/>">
							<form:hidden path="email" data-name="이메일"/>		
							<form:errors path="email" class="errorColor" element="div"/>		 
						</div>
						<div class="join-item">
							<h3 class="item-tit txt-regular">
								<span>메일수신</span><span class="point">*</span>
							</h3>
							<div class="radioOnly" data-name="메일수신 여부">
								<div class="ui-radio">
									<form:radiobutton path="emailRcpYn"  value="y"/> 
									<label for="emailRcpYn1">받음</label>
								</div>
								<div class="ui-radio">
									<form:radiobutton path="emailRcpYn" value="n"/>
									<label for="emailRcpYn2">받지않음</label>
								</div>
							</div>	
							<p class="sub-info-txt">
								<span class="ui-bullet"></span> 수신동의시 이벤트 및 다양한 정보를 받으실 수 있습니다.
							</p>
							<form:errors path="emailRcpYn" class="errorColor" element="div"/>
						</div>
					</div>
				</div>

				<div class="btn-join-confirm btn-wrap txt-center">
					<button type="button" class="ui-btn-blue-lg" onclick="mbrInfoUpdate.submitFn()">정보 수정</button>
					<button type="button" class="ui-btn-black-lg" onclick="location.href='<c:url value='/main.do'/>' " >취소</button>
					<button type="button" class="ui-btn-gray-md2" onclick="mbrInfoUpdate.withdraw()" >탈퇴</button>
				</div>
				
					
				
			</div>
			<!--// contents -->
		</form:form>
	</div>
</div>