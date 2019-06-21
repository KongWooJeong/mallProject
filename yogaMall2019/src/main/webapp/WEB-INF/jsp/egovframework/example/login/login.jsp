<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<script type="text/javascript">
	var loginCls = {
			
		loginFn		: function() {
			var $idTarget 	= $("#id"),
				$pwdTarget 	= $("#pwd");
			
			// 아이디 빈칸 확인
			if (!this.emptyChkFn($idTarget)) {
				return;
			}
			
			// 비밀번호 빈칸 확인
			if (!this.emptyChkFn($pwdTarget)) {
				return;
			}
			
			param = {
				"id"	: $idTarget.val(),
				"pwd"	: $pwdTarget.val()
			}
			
			$.ajax({
				url		: "<c:url value='/loginProc.do'/>",
				type	: "post",
				data	: param,
				success : function(result) {
					console.log(result);
					
					var jObj = JSON.parse(result);
					
					if (jObj.result === "fail") {
						commAlertPop.popUp("로그인 실패", jObj.msg);
					} else if (jObj.result === "dormSuccess") {
						// location.href = "휴면 해제 화면으로 이동"
						commAlertPop.popUp("로그인 실패", jObj.msg);
					} else {
						location.href = "<c:url value='/main.do'/>";
					}
				}
			})	
		},
		
		// 아이디, 비밀번호 빈칸 확인
		emptyChkFn	: function($inputTarget) {
			var removeBlankData = $inputTarget.val().replace(/(\s*)/g, "");
			
			if (removeBlankData === "") {
				commAlertPop.popUp("아이디, 비밀번호 확인", $inputTarget.data("name") + "를 입력해 주세요.",
									function() {
										$inputTarget.focus();
									}	
				);
				
				return false;
			} else {
				return true;
			}
		}
	}
</script>
<!-- container -->
<div id="container">
    <div class="login-wrap">
        <div class="tit">
            <h3>요가야에 오신 것을 환영합니다.</h3>
            <p>로그인을 하신 후 요가야의 다양한 서비스를 만나보세요.</p>
        </div>
        <div class="login-box">

            <div class="tab item-03 type3">
                <ul>
                    <li class="on"><a href="#">로그인</a></li>
                    <li><a href="<c:url value='/idInfo.do'/>">아이디 찾기</a></li>
                    <li><a href="<c:url value='/pwdInfo.do'/>">비밀번호 찾기</a></li>
                </ul>
            </div>

            <div class="login-cont">

                <div class="login">

                    <div class="login-entry">
                        <div class="entry">
                            <p><input id="id" name="id" data-name="회원 아이디" type="text" 	placeholder="아이디"  title="로그인"></p>
                            <p><input id="pwd" name="pwd" data-name="회원 비밀번호" type="password" placeholder="비밀번호"  title="비밀번호 입력"></p>
                        </div>
                        <a href="#" onclick="loginCls.loginFn()">로그인</a>
                    </div>
                    <div class="login-etc">
                        <ul>
                            <li><p>아직 yogaya 회원이 아니신가요?</p><a href="<c:url value='/agreeWith.do'></c:url>">회원가입</a></li>
                            <li><p>아이디를 잊으셨나요?</p><a href="<c:url value='/idInfo.do'/>">아이디 찾기</a></li>
                            <li><p>비밀번호를 잊으셨나요?</p><a href="<c:url value='/pwdInfo.do'/>">비밀번호 찾기</a></li>
                        </ul>
                    </div>

                </div>

                <div class="ad">
                    <img src="<c:url value='/common/images/aniYoga.jpg'/>" alt="gtx 1060" width="400" height="335">
                </div>
            </div>
        </div>
    </div>
</div>
<!--// container -->
