<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include	file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script type="text/javascript">
	
	var update = {
		
		cart	: function() {
			$("#update-btn").click(function() {
				
				$("#cart-form").submit();
				
			});
		}
	}
	

	$(function() {
		update.cart();
		
	})
		
</script>
<!--Shopping Cart Page-->
<div class="shopping-cart-page">
	<div class="auto-container">

		<!--Shopping Cart-->
		<section class="shopping-cart cart-section">
			<div class="group-title">
				<h2>장바구니</h2>
			</div>
			<form id="cart-form" method="post" action="<c:url value='/update.do'/>">
			<!--Cart Column-->
			<div class="cart-column">
				<c:choose>
					<c:when test="${cartList.size() eq 0  }">
						<!--Cart Outer-->
						<div class="cart-outer">
							<div class="table-outer">
								<table class="cart-table">
									<thead class="cart-header">
										<tr>		
											<th class="prod-column">요가강의</th>
											<th></th>
											<th class="price">가격</th>
											<th>수량</th>
											<th>합계</th>
											<th>&ensp;</th>
										</tr>
									</thead>		
									<tbody>										
										<tr>
											<td class="prod-column" colspan="2">&ensp;</td>
											<td class="price">&ensp;</td>
											<td class="qty">&ensp;</td>
											<td class="sub-total">&ensp;</td>
											<td class="remove">&ensp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--Cart Outer-->
						<div class="cart-outer">
							<div class="table-outer">
								<table class="cart-table">
									<thead class="cart-header">
										<tr>
											<th class="prod-column">요가용품</th>
											<th></th>
											<th class="price">가격</th>
											<th>수량</th>
											<th>합계</th>
											<th>&ensp;</th>
										</tr>
									</thead>		
									<tbody>										
										<tr>
											<td class="prod-column" colspan="2">&ensp;</td>
											<td class="price">&ensp;</td>
											<td class="qty">&ensp;</td>
											<td class="sub-total">&ensp;</td>
											<td class="remove">&ensp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!--Cart Outer-->
						<div class="cart-outer">
							<div class="table-outer">
								<table class="cart-table">
									<thead class="cart-header">
										<tr>		
											<th class="prod-column">요가강의</th>
											<th></th>
											<th class="price">가격</th>
											<th>수량</th>
											<th>합계</th>
											<th>&ensp;</th>
										</tr>
									</thead>
		
									<tbody>
										<c:forEach items="${cartList }" var="list">
											<c:if test="${list.type eq 'V' }">
												<tr>
													<td class="prod-column" colspan="2">
														<figure class="prod-thumb">
															<a href="<c:url value='/onlineDt.do'/>?vdoCd=${list.vdoCd}">
																<img src="<c:out value='${list.vdoImgUrl }'/>" alt=""></a>
														</figure>
														<div class="prod-info">
															<h3 class="prod-title">
																<a href="<c:url value='/onlineDt.do'/>?vdoCd=${list.vdoCd}"><c:out value="${list.vdoNm }"/></a>
															</h3>
														</div>
													</td>
													<td class="price"><fmt:formatNumber value="${list.vdoPrc }"/></td>
													<td class="qty"></td>
													<td class="sub-total"><fmt:formatNumber value="${list.vdoPrc }"/></td>
													<td class="remove"><a href="<c:url value='/delete.do'/>?vdoCd=${list.vdoCd}" class="remove-btn"><span
															class="flaticon-cross-1"></span></a></td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!--Cart Outer-->
						<div class="cart-outer">
							<div class="table-outer">
								<table class="cart-table">
									<thead class="cart-header">
										<tr>
											<th class="prod-column">요가용품</th>
											<th></th>
											<th class="price">가격</th>
											<th>수량</th>
											<th>합계</th>
											<th>&ensp;</th>
										</tr>
									</thead>
		
									<tbody>
										<c:forEach items="${cartList }" var="list">
											<c:if test="${list.type eq 'G' }">
												<tr>
													<td class="prod-column" colspan="2">
														<figure class="prod-thumb">
															<a href="<c:url value='/shopDt.do'/>?code=${list.gdCd}"><img
																src="<c:out value='${list.gdImgUrl }'/>" alt=""></a>
														</figure>
														<div class="prod-info">
															<h3 class="prod-title">
																<a href="<c:url value='/shopDt.do'/>?code=${list.gdCd}"><c:out value="${list.gdNm }"/></a>
															</h3>											
														</div>
													</td>
													<td class="price"><fmt:formatNumber value="${list.gdPrc }"/></td>
													<td class="qty">
														<div class="quantity-spinner">
															<button type="button" class="minus">
																<span class="fa fa-caret-down"></span>
															</button>
															<input type="text" name="amt" value="<c:out value="${list.amt }"/>" class="prod_qty" />													
															<button type="button" class="plus">
																<span class="fa fa-caret-up"></span>
															</button>
														</div>
													</td>											
													<td class="sub-total"><fmt:formatNumber value="${list.gdPrc * list.amt }"/></td>
													<td class="remove"><a href="<c:url value='/delete.do'/>?gdCd=${list.gdCd}" class="remove-btn"><span
															class="flaticon-cross-1"></span></a></td>
												</tr>
												<input type="hidden" name="gdCd" value="<c:out value="${list.gdCd }"/>">
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
				</c:otherwise>
				</c:choose>
				<!--Other Options-->

				<div class="other-options">
					<div class="clearfix">
						
						<!--Continue Column-->
						<div class="continue-column pull-right clearfix">
							<a href="<c:url value='/online.do'/>" class="theme-btn btn-style-four">쇼핑 계속하기</a>
						</div>
						<div class="continue-column pull-right clearfix" style="padding-right: 10px;">
							<a id="update-btn" class="theme-btn btn-style-four">수정하기</a>
						</div>
					</div>
				</div>

			</div>
			<!--End Cart Column-->
			</form>
			<div class="row clearfix">

				<div class="cart-total col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="clearfix">
						<!--Totals Box-->
						<div class="totals-box">
							<ul class="amounts-list">								
								<li class="clearfix">
									<span class="title">전체 금액</span>
									<span class="amount grand-total"><fmt:formatNumber value='${sum }'/></span>
								</li>
							</ul>
							<a href="<c:url value='/payment.do'/>" class="theme-btn btn-style-two proceed-btn">계산하기</a>							
						</div>

					</div>
				</div>


			</div>

		</section>
		<!--End Shopping Cart-->

	</div>
</div>