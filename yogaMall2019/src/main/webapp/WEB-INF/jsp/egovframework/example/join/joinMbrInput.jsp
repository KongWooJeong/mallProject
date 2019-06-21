<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<style type="text/css">
	.errorColor {
		color : red;
	}
</style>

<script type="text/javascript">
	
	var joinMbrInput = {
			
		cpNo			: "<c:out value='${joinVO.cpNo}'/>",
		email			: "<c:out value='${joinVO.email}'/>",
		idDupChk		: false,
		
		init			: function() {
			
			<c:if test="${validResult eq 'fail'}">
				this.idDupChk = true;
			</c:if>
			
			var that 	= this,
				$num	= $(".num");
			
			// ID 중복 확인
			$("#dupChkBtn").click(that.duplicateChkFn);
			
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
		
		submitFn		: function() {
			
			this.mergeProcFn();			// 휴대폰, 이메일 값 합치기
			
			if (!this.emptyChkFn()) {	// 빈 칸 확인
				return;
			}
			
			if (!this.idValidChkFn($("#loginId"))) {	// 아이디 유효성 확인
				return;
			}
			 
			if (!this.pwdChkFn()) {						// 비밀번호 유효성 확인
				return;
			} 
			
			if (!this.phoneChkFn()) {					// 휴대폰 유효성 확인
				return;
			}
			
			if (!this.radioChkFn()) {					// 라디오 버튼 체크 확인
				return;
			}
			
			if (!this.emailChkFn()) {					// 이메일 유효성 검사
				return;
			}		
			 
			if (!this.idDupChk) {						// 이메일 중복성 검사
				commAlertPop.popUp("아이디", "아이디 중복 체크는 필수입니다.");				 
				return;
			}  
			 			 
			var chkAgreeData 	= [],
				urlCall 		= "<c:url value='/selectTermsRequiredDataChk.do'/>";
			
			$("input[name='chkAgreement']").each(function() {
				chkAgreeData.push($(this).val());
			})
			
			// 필수 약관 동의 확인
			COMMON_DUP_CHK.dupChkFn(chkAgreeData, urlCall, function(data) {
				var jObj = JSON.parse(data);
				
				if (jObj.result === "SUCCESS") {
					$("#joinVO").attr("action", "<c:url value='/saveJoinMbr.do'/>");
					$("#joinVO").submit();
				} else {
					commAlertPop.popUp("필수 약관 동의 확인 결과", "필수 약관동의를 확인하여 주시기 바랍니다.",
										function() {
											location.href = "<c:url value='/main.do'/>";
										}
					);
					return;
				}
			});			 
			
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
			$("#email").val($("#emailFirst").val() + "@" + $("#emailEnd1").val());
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
		
		// ID 중복 확인
		duplicateChkFn	: function() {			
			var $id		= $("#loginId"),
				loginId = $id.val();
			
			// ID 유효성 확인
			if (!joinMbrInput.idValidChkFn($id)) {				
				return;
			}
			
			$.ajax({
				url			: "<c:url value='/selectDuplicateIdChk.do'/>",
				data		: {"loginId" : loginId},
				success		: function(data) {
					data = parseInt(data);
					
					if (data > 0) {
						
						// DB에 ID가 존재할 경우, 사용 불가
						commAlertPop.popUp("아이디 확인", loginId + "는 사용할 수 없습니다.");
					} else {
						
						// DB에 ID가 존재하지 않을 경우, 사용 가능
						joinMbrInput.idDupChk = true;
						
						commAlertPop.popUp("아이디 확인", loginId + "는 사용 가능합니다.");
					}
				}
			})	
		},
		
		// ID 유효성 확인
		idValidChkFn		: function($id) {
			
			// 영문, 숫자 포함 8~12자리 
			var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/;
			
			commValidCheck.popUp(reg, $id, "아이디는 영문/숫자 포함 8~12자리로 입력해주세요");			
			
			return commValidCheck.bool;
		},
		
		// email domain 설정
		emailDomainProcFn	: function() {
			var $emailEnd1 = $("#emailEnd1"),
				$emailEnd2 = $("#emailEnd2");
			
			if ($emailEnd2.val() === "") {
				$emailEnd1.prop("readonly", false);
			} else {
				$emailEnd1.prop("readonly", true);
			}
			
			$emailEnd1.val($emailEnd2.val());
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
					$firstTarget.parent().parent().find("div.selectric > span.label").text("010");
				} else {				
					var cpNoArr = cpNo.split("-");
					
					$firstTarget.parent().parent().find("div.selectric > span.label").text(cpNoArr[0]);
									
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
				$("#" + inputTarget + "End1").val(email.split("@")[1]);
			}
		},
	}
	
	$(function() {
		joinMbrInput.init();
	})
</script>
<!-- container -->
<div id="container">
	<form:form commandName="joinVO" method="post">
		<!-- contents -->
		<div class="center-wrap">
			<p class="join-step mgt-70">
				<img src="<c:url value='images/sub/userInform.png' />"
					alt="03 정보입력">
			</p>

         <h3 class="heading-medium join-enter mgt-60">회원가입 기본정보 입력사항</h3>

         <h3 class="heading-medium join-group-tit">회원 기본 정보</h3>
         <span class="sub-tit">
         	<span>*</span>
         	<span>표시정보는 필수 입력 사항이니 반드시 입력해 주십시오.</span>
         </span>
         <div class="join-group">
			<div class="join-row">
                <div class="join-item">
                    <h3 class="item-tit txt-regular">
                    	<span>이름</span><span class="point">*</span>
                    </h3>
                    <form:input class="ui-ipt empty" data-name="이름" path="mbrNm"></form:input>
                    <form:errors path="mbrNm" element="div" cssClass="errorColor"/> 
                </div>
            </div>
            <div class="join-row">
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>아이디</span><span class="point">*</span>
                  </h3>
                  <form:input data-name="아이디" path="loginId" class="ui-ipt empty"/>
                  <button type="button" id="dupChkBtn" class="ui-btn-gray-md">아이디
                     중복 확인</button>
                  <form:errors path="loginId" element="div" cssClass="errorColor"/>
                  <p class="sub-info-txt">
                     <span class="ui-bullet"></span> 아이디는 영문/숫자 포함 8자리 ~ 12자리
                  </p>
               </div>
            </div>
            <div class="join-row">
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>비밀번호</span><span class="point">*</span>
                  </h3>
                  <form:input data-name="비밀번호" path="pwd" class="ui-ipt empty"/>         
                  <form:errors path="pwd" element="div" cssClass="errorColor"/>
                  <p class="sub-info-txt">
                     <span class="ui-bullet"></span> 비밀번호는 영문/숫자/특수문자 포함 8자리~15자리
                  </p>
               </div>
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>비밀번호 확인</span><span class="point">*</span>
                  </h3>
                  <form:input data-name="비밀번호확인" path="pwdConfirm" class="ui-ipt empty"/>
                  <form:errors path="pwdConfirm" element="div" cssClass="errorColor"/>
               </div>
            </div>
			
                
            <div class="join-row phone ipt-bar">

               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>휴대폰</span><span class="point">*</span>
                  </h3>
                  <select name="cpNoFirst" id="cpNoFirst">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
                  </select> <span class="bar"></span> 
                  <input type="text" name="cpNoMiddle" id="cpNoMiddle" class="ui-ipt ipt-phone num"> 
                  <span class="bar"></span>
				  <input type="text" name="cpNoEnd" id="cpNoEnd" class="ui-ipt ipt-phone num">
                  <form:hidden path="cpNo" data-name="휴대폰"/>
                  <form:errors path="cpNo" element="div" cssClass="errorColor"/>
                  <p class="sub-info-txt">
                     <span class="ui-bullet"></span> 예) 000 - 000 - 0000
                  </p>
               </div>
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>문자수신</span><span class="point">*</span>
                  </h3>
                  <div class="radioOnly" data-name="문자수신">
                     <div style="display: inline; padding-right: 50px">
                        <form:radiobutton path="smsRcpYn" checked="checked" value="Y"/>
                        <label for="smsRcpYn1" style="font-size: 15px;">받음</label>
                     </div>
                     <div style="display: inline;">
                        <form:radiobutton path="smsRcpYn" value="N"/>
                        <label for="smsRcpYn2" style="font-size: 15px;">받지않음</label>
                     </div>
                  </div>
                  <p class="sub-info-txt">
                     <span class="ui-bullet"></span> 수신동의시 이벤트 및 다양한 정보를 받으실 수 있습니다.
                  </p>
                  <form:errors path="smsRcpYn" element="div" cssClass="errorColor"/>
               </div>
            </div>
            <div class="join-row">
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>배송받을 주소</span><span class="point">*</span>
                  </h3>
                  <div class="sub-addr-wrap mgt-10">
                  	<form:input path="zipCode" data-name="우편번호" class="ui-ipt empty" placeholder="우편번호"/>
                  	<input type="button" value="우편번호 검색" onclick="daum_address.popUpAddress()" class="ui-btn-gray-md pop-call"/>
                   	<div class="sub-addr-wrap mgt-10">
                   		<form:input path="bsAddr" data-name="기본 주소" class="ui-ipt empty"/>
                   		<form:input path="dtAddr" data-name="상세 주소" class="ui-ipt empty"/>
                    </div>
                  </div>
                  <form:errors path="bsAddr" element="div" cssClass="errorColor"></form:errors>
               </div>
            </div>
            <div class="join-row email">
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>이메일</span><span class="point">*</span>
                  </h3>
                  <input type="text" name="emailFirst" id="emailFirst"
                     class="ui-ipt empty"><span>@</span><input type="text"
                     name="emailEnd1" id="emailEnd1" class="ui-ipt empty"> <select
                     name="emailEnd2" id="emailEnd2"
                     onchange="joinMbrInput.emailDomainProcFn()">
                     <option value="_input">직접입력</option>

                     <c:forEach items="${emailDomainList}" var="emailDomainList">
                        <option value="<c:out value="${emailDomainList.cmmCdNm}"/>"><c:out
                              value="${emailDomainList.cmmCdNm}" /></option>
                     </c:forEach>

                  </select>
                  <form:hidden path="email" data-name="이메일"/>
                  <form:errors path="email" element="div" cssClass="errorColor"/>
               </div>
               <div class="join-item">
                  <h3 class="item-tit txt-regular">
                     <span>메일수신</span><span class="point">*</span>
                  </h3>
                  <div class="radioOnly" data-name="메일수신">
                     <div style="display: inline; padding-right: 50px">
                        <form:radiobutton path="emailRcpYn" checked="checked" value="Y"/>
                        <label for="emailRcpYn1" style="font-size: 15px;">받음</label>
                     </div>
                     <div style="display: inline;">
                        <form:radiobutton path="emailRcpYn" value="N"/>
                        <label for="emailRcpYn2" style="font-size: 15px;">받지않음</label>
                     </div>
                  </div>
                  <p class="sub-info-txt">
                     <span class="ui-bullet"></span> 수신동의시 이벤트 및 다양한 정보를 받으실 수 있습니다.
                  </p>
                  <form:errors path="emailRcpYn" element="div" cssClass="errorColor"/>
               </div>
            </div>
         </div>

         <div class="btn-join-confirm btn-wrap txt-center">
            <button type="button" class="ui-btn-blue-lg"
               onclick="joinMbrInput.submitFn()">회원가입 완료</button>
            <button type="button" class="ui-btn-black-lg"
               onclick="location.href ='<c:url value='/main.do'/>' ">회원가입 취소</button>
         </div>
      </div>
      <!--// contents -->
      
      <c:forEach items="${joinVO.chkAgreement }" var="chkAgreement">
      	<input type="hidden" name="chkAgreement" value="<c:out value='${chkAgreement }'/>">
      </c:forEach>
   </form:form>
</div>
<!--// container -->