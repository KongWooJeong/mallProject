<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include	file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script>
	
	var payment = {
		
		init : function() {
			var that = this;
			
			$("#payment").click(function() {
				that.reqText();
				
				var type = $("[type=radio]:checked").val();
				
				if (type === "cash") {
					$("#user-form").attr("action", "paymentCash.do");
				} else if (type === "card") {
					$("#user-form").attr("action", "paymentCard.do");
				}
				
				$("#user-form").submit();
			});
		},
		
		// 요청사항도 같이 넘기기 위해 인풋 히든태그에 넣어줌
		reqText : function() {
			var reqText = $("#req").val();
			
			$("[name=req]").val(reqText);
		}
	}

	
	$(function() {
		payment.init();
	})

</script>
<!--Checkout Page-->
<div class="checkout-page">
	<div class="auto-container">
		<div class="row clearfix">
			<form id="user-form" method="post" action="">
			<!--Billing Details-->
			
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
			
				<!--Billing Details-->
				<div class="billing-details">
					<div class="group-title">
						<h2>주문하기 </h2>
					</div>

					<div class="shop-form">
						
							<div class="row clearfix">

								<!--Form Group-->
								<div class="form-group col-md-6 col-sm-6 col-xs-12">
									<div class="field-label">
										이름  <sup>*</sup>
									</div>
									<input type="text" name="mbrNm" value="<c:out value='${userList.mbrNm }'/>" placeholder="">
								</div>

								<!--Form Group-->
								<div class="form-group col-md-6 col-sm-6 col-xs-12">
									<div class="field-label">
										전화번호 <sup>*</sup>
									</div>
									<input type="text" name="cpNo" value="<c:out value='${userList.cpNo }'/> " placeholder="">
								</div>
								
								
								<!--Form Group-->
								<div class="form-group col-md-12 col-sm-12 col-xs-12">
									<div class="field-label">
										이메일 
									</div>
									<input type="text" name="email" value="<c:out value='${userList.email }'/> " placeholder="">
								</div>
							

								<!--Form Group-->
								<div class="form-group col-md-12 col-sm-12 col-xs-12">
									<div class="field-label">
										주소 <sup>*</sup>
									</div>
									<input type="text" name="addr" value="<c:out value='${userList.addr }'/>" placeholder="">
								</div>

								<!--Form Group-->
								<div class="form-group col-md-6 col-sm-6 col-xs-12">
									<div class="field-label">우편번호</div>
									<input type="text" name="zipcode" value="<c:out value='${userList.zipcode }'/> "
										placeholder="">
								</div>


								<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="field-label">요청 사항 </div>
									<textarea id="req" placeholder=""></textarea>
								</div>
								<input type="hidden" name="req" value=""/>
								<input type="hidden" name="mbrNo" value="<c:out value='${userList.mbrNo }'/>"/>
								<input type="hidden" name="totalPrc" value="<c:out value='${userList.totalPrc }'/>"/>
							</div>
						
					</div>

				</div>

			</div>
			<!--Summary Column-->
			<div class="summary-column col-md-4 col-sm-8 col-xs-12">
				<div class="summary-box">
					<h3>주문내역 </h3>

					<div class="total-header clearfix">
						<div class="product-title">제품</div>
						<div class="product-price">합계</div>
					</div>
					<ul class="products clearfix">
						<c:forEach items="${cartList }" var="cartList">
							<c:if test="${cartList.type eq 'G'}">
								<li class="clearfix">
									<div class="product-title">
										<c:out value="${cartList.gdNm }"/> x <c:out value="${cartList.amt }"/>
									</div>
									<div class="product-price">
										<fmt:formatNumber value="${cartList.totPrc }"/>
									</div>
									<input type="hidden" name="gdCd" value="${cartList.gdCd }"/>
								</li>
							</c:if>
							<c:if test="${cartList.type eq 'V'}">
								<li class="clearfix">
									<div class="product-title">
										<c:out value="${cartList.vdoNm }"/> x <c:out value="${cartList.amt }"/>
									</div>
									<div class="product-price">
										<fmt:formatNumber value="${cartList.totPrc }"/>
									</div>
									<input type="hidden" name="vdoCd" value="${cartList.vdoCd }"/>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<div class="sub-total clearfix">
						<div class="total-title">가격</div>
						<div class="total-price"><fmt:formatNumber value="${userList.totalPrc }"/></div>
					</div>
					<div class="shipping-info clearfix">
						<div class="shipping-title">배송료</div>
						<div class="shipping-status">FREE</div>
					</div>
					<div class="grand-title clearfix">
						<div class="total-title">
							<strong>총 합계 </strong>
						</div>
						<div class="total-price theme_color">
							<strong><fmt:formatNumber value="${userList.totalPrc }"/></strong>
						</div>
					</div>

					<!--Payment Options-->
					<div class="payment-options">
						<ul>
							<li>
								<div class="radio-option">
									<input type="radio" name="payment-group" value="cash" checked="checked" id="payment-1">
									<label for="payment-1"><strong>무통장 입금 </strong></label>
								</div>
							</li>
							<li>
								<div class="radio-option">
									<input type="radio" name="payment-group" value="card" id="payment-3">
									<label for="payment-3"><strong>카드 결제</strong> <img
										src="images/icons/credit-card-icon.png" alt=""></label>
								</div>
							</li>
						</ul>
					</div>

					<button type="button" id="payment" class="theme-btn btn-style-two place-order">
						결제하기</button>

				</div>
			</div>
			</form>
		</div>
	</div>
</div>