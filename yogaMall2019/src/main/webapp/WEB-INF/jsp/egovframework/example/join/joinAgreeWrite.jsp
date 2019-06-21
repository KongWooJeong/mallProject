<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
 
<script type="text/javascript">

var joinAgree = {
		
		agreeValidFn	: function() {
			var chkAgreeData = [],
				callUrl		 = "<c:url value='/selectTermsRequiredDataChk.do'/>";
			
			$("[name='chkAgreement']:checked").each(function() {
				chkAgreeData.push($(this).val());
			})
			
			console.log(chkAgreeData);
			
			COMMON_DUP_CHK.dupChkFn(chkAgreeData, callUrl, function(data) {
				//alert(data);
				
				var jObj = JSON.parse(data);
				
				if(jObj.result === "SUCCESS") {
					
					$("#termsFrm").submit();
				}else {
					commAlertPop.popUp("필수 약관 동의 확인 결과", "무슨 문제가 있습니다. 확인 바랍니다.");
				}
				
			});
			
		},
		
		submitFn		: function() {
			
			if(!this.essnAgrChkFn()) {
				
				commAlertPop.popUp("필수 약관 동의 확인 결과","필수 약관동의에 대하여 체크하여 주십시오");
				
				return;
			}
			
			this.agreeValidFn();
			
		},
		
		essnAgrChkFn	: function() {
			var bool	=	true;
			
			$("[data-essnAgrYn='Y']").each(function() {
				
				if(!$(this).prop("checked")) {
					bool = false;
				}
			})
			
			if(!bool) {
				return false;
			} else {
				return true;
			}
		}
		
}

$(function(){
	$(".chk_full_agreement").change(function(){
		if($(this).is(":checked")){
			$("input[name=chkAgreement]").prop("checked",true);
		}else{
			$("input[name=chkAgreement]").prop("checked",false);
		}
	})
})
</script>   

<!-- container -->
<div id="container">
    <form action='<c:url value='/selectJoinInput.do'/>' id="termsFrm" method="post">
    <!-- contents -->
    <div class="center-wrap">
        <p class="join-step mgt-70"><img src="<c:url value='images/sub/agreeWith.png'></c:url>" alt="01 약관동의"></p>

        <h3 class="heading-medium h3-join-agree mgt-60">"요가요" 회원 약관 동의</h3>

        <h4 class="heading-right h4-join-agree mgt-35">요가요 서비스 이용약관(필수)<span class="txt-medium">*</span></h4>
        <div class="scroll-box mgt-10">
            ${termsMngList10.termsHtml}
        </div>
        <div class="txt-right mgt-10">
            <div class="ui-chk-orange-right">
                <input type="checkbox" id="chk<c:out value='${termsMngList10.termsTyCd }'/>" name="chkAgreement"
                	data-essnAgrYn="<c:out value='${termsMngList10.essnAgrYn }'/>"
                	value="<c:out value='${termsMngList10.termsMngNo }'/>">
                <label for="chk<c:out value='${termsMngList10.termsTyCd }'/>"><span>위의 약관을 모두 읽었으며 동의합니다.</span></label>
            </div>
        </div>

        <h4 class="heading-right h4-join-agree mgt-35">개인정보 취급방침(필수)<span class="txt-medium">*</span></h4>
        <div class="scroll-box mgt-10">
            ${termsMngList20.termsHtml}
        </div>
        <div class="txt-right mgt-10">
            <div class="ui-chk-orange-right">
                <input type="checkbox" id="chk<c:out value='${termsMngList20.termsTyCd }'/>" name="chkAgreement"
                	data-essnAgrYn="<c:out value='${termsMngList20.essnAgrYn }'/>"
                	value="<c:out value='${termsMngList20.termsMngNo }'/>">
                <label for="chk<c:out value='${termsMngList20.termsTyCd }'/>"><span>위의 약관을 모두 읽었으며 동의합니다.</span></label>
            </div>
        </div>

		<h4 class="heading-right h4-join-agree mgt-35">개인정보 수집 및 이용안내에 대한 동의(필수)<span class="txt-medium">*</span></h4>		
        <div class="scroll-box mgt-10">
            ${termsMngList30.termsHtml}
        </div>
        <div class="txt-right mgt-10">
            <div class="ui-chk-orange-right">
                <input type="checkbox" id="chk<c:out value='${termsMngList30.termsTyCd }'/>" name="chkAgreement"
                	data-essnAgrYn="<c:out value='${termsMngList30.essnAgrYn }'/>"
                	value="<c:out value='${termsMngList30.termsMngNo }'/>">
                <label for="chk<c:out value='${termsMngList30.termsTyCd }'/>"><span class="text">위의 약관을 모두 읽었으며 동의합니다.</span></label>
            </div>
        </div>

		<h4 class="heading-right h4-join-agree mgt-35">마케팅 활용을 위한 개인정보 제 3자 제공 동의(선택)</h4>		
        <div class="scroll-box mgt-10">
            ${termsMngList40.termsHtml}
        </div>
        <div class="txt-right mgt-10">
            <div class="ui-chk-orange-right">
                <input type="checkbox" id="chk<c:out value='${termsMngList40.termsTyCd }'/>" name="chkAgreement"
                	data-essnAgrYn="<c:out value='${termsMngList40.essnAgrYn }'/>"
                	value="<c:out value='${termsMngList40.termsMngNo }'/>">
                <label for="chk<c:out value='${termsMngList40.termsTyCd }'/>"><span class="text">위의 약관을 모두 읽었으며 동의합니다.</span></label>
            </div>
        </div>
            
        <div class="gray-box txt-right mgt-15">
            <div class="ui-chk-orange-right">
                <input type="checkbox" id="chk7" class="chk_full_agreement">
                <label for="chk7"><strong class="text">[ 전체동의 ]  YOGAYO 전체 약관에 동의합니다.</strong></label>
            </div>
        </div>

        <div class="number-ipt-wrap txt-center mgt-60">
            <div class="inner-wrap inline-block">
                <div class="relative" style="padding-left:0px;">
		<button class="ui-btn-blue-md btn-certify" type="button" onclick="location.href ='<c:url value='/main.do'/>'" style="background-color:gray;"><span class="txt-medium">비동의</span></button>
		<button class="ui-btn-blue-md btn-certify" type="button" onclick="joinAgree.submitFn()" style="background-color:orange;"><span class="txt-medium">동의</span></button>
                </div>
            </div>
        </div>
    </div>
    <!--// contents -->
    </form>
</div>
<!--// container -->
<!-- 
<div class="pop-wrap" id="pop-01" style="display:none">
    <dl>
        <dt class="pop-header">
            <h2 class="txt-medium-sm-02">필수 약관 동의 확인결과</h2>
            <button type="button" class="btn-close"><span class="ico-del-02"></span><span class="blind">팝업창 닫힘</span></button>
        </dt>
        <dd class="pop-body">
            <div class="pop-cont">
                <div class="pop-msg">
                    <p class="txt-light txt-center">필수 약관동의에 대하여 체크하여 주십시오</p>
                </div>
            </div>

            <div class="pop-btn-wrap txt-center">
                <button type="button" class="btn-footer-close txt-medium">확인</button>
            </div>
        </dd>
    </dl>
</div> -->