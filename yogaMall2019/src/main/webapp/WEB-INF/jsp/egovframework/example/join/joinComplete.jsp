<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
    
<!-- container -->
<div id="container" class="type3">

    <!-- contents -->
    <div class="center-wrap">
        <p class="txt-center">
        	<img src='<c:url value="images/sub/joinComplete.PNG"></c:url>'>
        </p>
        <p class="heading-bold-lg-05 txt-center join-head mgt-40">회원가입이 완료되었습니다.<span class="txt-md-light mgt-5">요가야 회원가입이 완료되었습니다. 즐거운쇼핑되세요!</span></p>
        <div class="clearfix mgt-55 txt-center">
            <a href="<c:url value='/login.do'/>" class="ui-btn-blue-lg txt-medium btn-join-com">로그인 하기</a>
            <a href="<c:url value='/main.do'/> " class="ui-btn-bordered-lg txt-medium btn-join-com">메인으로 이동</a>
        </div>
    </div>
    <!--// contents -->

</div>
<!--// container -->