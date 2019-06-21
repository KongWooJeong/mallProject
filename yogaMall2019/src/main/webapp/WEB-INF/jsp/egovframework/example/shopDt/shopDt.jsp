<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include	file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script type="text/javascript">

	var move = {
		
		cart	: function() {
						
			// 장바구니 이동
			$("#shop-btn").click(function() {
				
				<c:choose>
					<c:when test="${sessionVO eq null }">
						$("#shop-form").attr("action", "<c:url value='/login.do'/>")
					</c:when>
					<c:otherwise>
						$("#shop-form").attr("action", "<c:url value='/addCart.do'/>");					
					</c:otherwise>
				</c:choose>
							
				$("#shop-form").submit();
			});	
		}
	}
	
	$(function() {
		move.cart();
	})

</script>
<!--Sidebar Page Container-->
<div class="shopDets-container sidebar-page-container">
	<div class="auto-container">
		<div class="row clearfix">
			<!--Content Side-->
			<div class="content-side col-lg-9 col-md-8 col-sm-12 col-xs-12">

				<!--Shop Single-->
				<div class="shop-single shop-page">
					<div class="shop-container">

						<!--Prod Info Section-->
						<section class="prod-info-section">
							<div class="row clearfix">
								<div class="carousel-column col-lg-5 col-md-6 col-sm-5 col-xs-12">
									<div class="carousel-outer wow fadeInLeft">
										<ul class="image-carousel">
											<c:forEach items="${goods.imgList }" var="imgList">
												<li>
													<img src="<c:url value='/images/shop/img/${imgList.filePath }'/>/<c:out value='${imgList.phsFileNm }'/> "
													alt="">
												</li>
											</c:forEach>
											
										</ul>

										<ul class="thumbs-carousel">
											<c:forEach items="${goods.imgList }" var="imgList">
												<li>
													<img src="<c:url value='/images/shop/img/${imgList.filePath }'/>/<c:out value='${imgList.phsFileNm }'/> "
													alt="">
												</li>
											</c:forEach>
											
										</ul>

									</div>
								</div>

								<!--Content Column-->
								<div class="content-column col-lg-7 col-md-6 col-sm-7 col-xs-12">
									<div class="outer wow fadeInRight">
										<div class="title-box">
											<h2><c:out value="${goods.gdNm }"/></h2>
											<div class="rating">
												<span class="fa fa-star"></span><span class="fa fa-star"></span><span
													class="fa fa-star"></span><span class="fa fa-star"></span><span
													class="fa fa-star-o"></span> 
											</div>
											<div class="price">
												<fmt:formatNumber value="${goods.gdPrc }"/>원
											</div>
											<div class="availability">
												<strong>재고</strong> 있음 <span
													class="fa fa-check-circle"></span>
											</div>
										</div>
										<div class="desc-text">
											<p><c:out value="${goods.smr }"/></p>
										</div>

										<div class="shop-options clearfix">
											<form id="shop-form" method="post" action="">
												<div class="form-group">
													<div class="quantity-spinner">
														<button type="button" class="minus">
															<span class="fa fa-caret-down"></span>
														</button>
														<input id="prdAmt" type="text" name="amt" value="1" class="prod_qty" />
														<button type="button" class="plus">
															<span class="fa fa-caret-up"></span>
														</button>
													</div>
												</div>
												<div class="form-group">
													<button id="shop-btn" type="button" class="theme-btn btn-style-two add-cart-btn">장바구니</button>
												</div>																				
												<input type="hidden" name="gdCd" value="<c:out value="${goods.gdCd }"/>">
											</form>
										</div>
									</div>
								</div>

							</div>

						</section>

						<!--Product Info Tabs-->
						<div class="product-info-tabs">

							<!--Product Tabs-->
							<section class="prod-tabs" id="product-tabs">

								<!--Tab Btns-->
								<div class="tab-btns clearfix">
									<a href="#prod-description" class="tab-btn active-btn">상품정보</a>									
								</div>

								<!--Tabs Container-->
								<div class="tabs-container">

									<!--Tab / Active Tab-->
									<div class="tab active-tab" id="prod-description">
										<div class="content">
											<h3>특징</h3>
											<p><c:out value="${goods.smr }"/></p>											
										</div>
									</div>		
								</div>								
							</section>

						</div>
					</div>
				</div>
			</div>
			<!--End Content Side-->

		</div>
	</div>
</div>