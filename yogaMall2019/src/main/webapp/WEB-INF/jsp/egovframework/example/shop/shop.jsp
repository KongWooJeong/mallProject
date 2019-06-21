<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--Sidebar Page Container-->
<div class="sidebar-page-container" >
	<div class="auto-container" >
		<div class="row clearfix">
			<!--Content Side-->
			<div class="content-side pull-right col-lg-9 col-md-8 col-sm-12 col-xs-12">
				<!--Shop Items Section-->
				<section class="shop-items-section no-padd-bottom no-padd-top" >
										
					<div id="shopList"></div>
				</section>
			</div>
			<!--End Content Side-->
			<!--Sidebar-->
			<div class="sidebar-side col-lg-3 col-md-4 col-sm-6 col-xs-12" >
				<aside class="sidebar">
					<!-- Categories -->
					<div>
						<c:forEach items="${menuList }" var="category1">
							<c:if test="${category1.catLv eq '1' }">
								<ul class="cat-listing">
									<li class="has_submenu" data-code="<c:out value='${category1.catCd }'/>" data-name="<c:out value='${category1.catNm }'/>" data-level="<c:out value='${category1.catLv }'/>">
										<a class="clearfix">
											<span class="txt pull-left category"><c:out value='${category1.catNm }'/></span>
											<span class="pull-right"><i class="fa fa-angle-right"></i></span>
										</a>
									<ul class="cat-listing" style="padding-left: 11px;">
										<c:forEach items="${menuList }" var="category2">
									 	<c:if test="${ (category2.upprCatCd eq category1.catCd) and (category2.catLv eq '2') }">
												<li class="has_submenu " data-code="<c:out value='${category2.catCd }'/>" data-upprCode="<c:out value='${category2.upprCatCd }'/>" 
													data-name="<c:out value='${category2.catNm }'/>" data-level="<c:out value='${category2.catLv }'/>">
													<a class="clearfix">
														<span class="txt pull-left category"><c:out value='${category2.catNm }'/></span>
														<span class="pull-right"><i class="fa fa-angle-right"></i></span>
													</a>
													<ul style="padding-left: 13px;">
														<c:forEach items="${menuList }" var="category3">
															<c:if test="${ (category3.upprCatCd eq category2.catCd) and (category3.catLv eq '3') }">
																	<li data-code="<c:out value='${category3.catCd }'/>" data-upprCode="<c:out value='${category3.upprCatCd }'/>" 
																		data-name="<c:out value='${category3.catNm }'/>" data-level="<c:out value='${category3.catLv }'/>">
																		<a class="clearfix">
																			<span class="txt pull-left category"><c:out value='${category3.catNm }'/></span>
																		</a>
																	</li>
															</c:if>
														</c:forEach>
													</ul>
												</li>			
											</c:if>
										</c:forEach>
									</ul>
									</li>	
								</ul>
							</c:if>
						</c:forEach>
					</div>
					<!-- Featured Products WIdget -->
					<div class="sidebar-widget featured-products-widget">
						<div class="sidebar-title">
							<h3>인기제품</h3>
						</div>
						<c:forEach items="${randomList}" var="randomList">
							<div class="product">
								<div class="post-thumb" style="width: 100px; height: 70px;">
									<a href="#" class="random" data-code="<c:out value='${randomList.gdCd }'/>">
										<img src="<c:url value="/images/shop/img/${randomList.filePath}"/>/<c:out value="${randomList.phsFileNm}" />" alt="" style="width: 100px; height: 70px;">
									</a>
								</div>
								<h4><a href="#" class="random" data-code="<c:out value='${randomList.gdCd }'/>"><c:out value="${randomList.gdNm}"/></a></h4>
								<div class="price"><fmt:formatNumber value="${randomList.gdPrc}"/>원</div>
							</div>
						</c:forEach>
					</div>
				</aside>
			</div>
			<!--End Sidebar Side-->
		</div>
	</div>
</div>

<script type="text/javascript">

	var shop = {
			
			catCd		: "",
			catLv		: "",
			
			init		: function() {
				
				// 클릭한 메뉴의 카테고리 코드, 카테고리 레벨 가져오기
				$(".category").click(function() {
					var catCd = $(this).closest("li").data("code"),
						catLv = $(this).closest("li").data("level");
					
					shop.catCd = catCd,
					shop.catLv = catLv;
					console.log("shop.catCD : ", shop.catCd);
					console.log("shop.catLv : ", shop.catLv);
					shop.getShopList();
				});
				
				// 페이징 클릭 처리
				$("#shopList").on("click", "div.styled-pagination li > a", {shop: this}, function (evt) {
					var shop = evt.data.shop;
					
					shop.getShopList({ pageNo: Number($(this).data("page")) });
				});
				
				// 상세 페이지 이동
				$("#shopList").on("click", "a.goods", function() {
					var code = $(this).data("gd");
					
					location.href = "<c:url value='/shopDt.do'/>?code=" + code;
				});
				
				$("a.random").click(function() {
					var code = $(this).data("code");
					console.log(code);
					location.href = "<c:url value='/shopDt.do'/>?code=" + code;					
				})	
			},
			
			getShopList	: function(param) {
				var param 	= param || {},
					pageNo 	= param.pageNo || 1;
				
				param.catCd = this.catCd,
				param.catLv = this.catLv;
				console.log("param : ", param);
				$.ajax({
					url			: "<c:url value = '/shop/selectGoodsList.do'/>",
					type		: "post",
					contentType : "application/json",
					data		: JSON.stringify(param),
					success		: function(data) {
						$("#shopList").html(data);
					}
				})
			}
	}
	
	$(function() {
		shop.init();
		shop.getShopList();
	})
	
</script>