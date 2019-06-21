<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>

<script type="text/javascript">
	
	$(function() {
		online.init();
		online.getOnlineList();
	})
	
	var online = {
			
		catCd		: "",
		catLv		: "",
			
		init		: function() {
			
			// 클릭한 메뉴의 카테고리 코드, 카테고리 레벨 가져오기
			$(".category").click(function() {
				var catCd 		= $(this).closest("li").data("code"),
					catLv		= $(this).closest("li").data("level");
								
				online.catCd 	= catCd,
				online.catLv	= catLv;
				
				online.getOnlineList();
			});
			
			// 페이징 클릭 처리
			$("#onlineList").on("click", "div.styled-pagination li > a", {online: this}, function (evt) {
				var online = evt.data.online;
				
				online.getOnlineList({ pageNo: Number($(this).data("page")) });
			});
			
			$("#onlineList").on("click", "a.vdo", function() {
				location.href = "<c:url value='/onlineDt.do'/>?vdoCd=" + $(this).data("code");
			})
			
			$("a.vdo").click(function() {
				location.href = "<c:url value='/onlineDt.do'/>?vdoCd=" + $(this).data("code");
			})
		},
		
		getOnlineList		: function(param) {
			var param 	= param || {},
				pageNo 	= param.pageNo || 1;
			
			param.catCd = this.catCd,
			param.catLv = this.catLv;
			
			$.ajax({
				url			: "<c:url value='/getList.do'/>",
				type		: "POST",
				contentType	: "application/json",				
				data		: JSON.stringify(param),
				success		: function (data) {
					$("#onlineList").html(data);
				},
				error		: function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}		
			
			});
		}
		
	}
</script>

<!--Sidebar Page Container-->
<div class="sidebar-page-container">
	<div class="auto-container">
		<div class="row clearfix">
			
			<!--Content Side-->
			<div class="content-side pull-right col-lg-9 col-md-8 col-sm-12 col-xs-12">
				
				<!--Classes Gallery / List View-->
				<section class="classes-gallery list-view">					
					<div id="onlineList"></div>					
					
				</section>	
				</div>			

				<!--Sidebar-->
				<div class="sidebar-side pull-left col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<aside class="sidebar">	
						<div class="sidebar-title">
							<h3>강의 분류</h3>
						</div>
	
						<!--Sidebar Widget / Listing Widget-->											
						<div>
							<c:forEach items="${onlineCtgrList }" var="category1">
								<c:if test="${category1.catLv eq '1' }">
									<ul class="cat-listing">
										<li class="has_submenu" data-code="<c:out value='${category1.catCd }'/>" data-name="<c:out value='${category1.catNm }'/>" data-level="<c:out value='${category1.catLv }'/>">
											<a class="clearfix">
												<span class="txt pull-left category"><c:out value='${category1.catNm }'/></span>
												<span class="pull-right"><i class="fa fa-angle-right"></i></span>
											</a>
										<ul class="cat-listing" style="padding-left: 11px;">
											<c:forEach items="${onlineCtgrList }" var="category2">
										 		<c:if test="${ (category2.upprCatCd eq category1.catCd) and (category2.catLv eq '2') }">
													<li class="has_submenu " data-code="<c:out value='${category2.catCd }'/>" data-upprCode="<c:out value='${category2.upprCatCd }'/>" 
														data-name="<c:out value='${category2.catNm }'/>" data-level="<c:out value='${category2.catLv }'/>">
														<a class="clearfix">
															<span class="txt pull-left category"><c:out value='${category2.catNm }'/></span>
															<span class="pull-right"><i class="fa fa-angle-right"></i></span>
														</a>
														<ul style="padding-left: 13px;">
															<c:forEach items="${onlineCtgrList }" var="category3">
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
						
						<div class="featured-classes sidebar-title">
							<h3>추천 강의</h3>
						</div>
	
						<!--Sidebar Widget / Featured Classes Widget-->	
						<div class="sidebar-widget featured-classes-widget">
	
							<!--Featured Classes Carousel-->
							<ul class="single-item-carousel featured-classes-carousel">
								<!--Slide Item-->
								<c:forEach items="${onlineRandomList }" var="onlineRandomList">
									<li class="slide-item">
										<figure class="image-box">
											<a href="#" class="vdo" data-code="<c:out value='${onlineRandomList.vdoCd }'/>">
												<img src="<c:out value='${onlineRandomList.vdoImgUrl }'/>" alt="">
											</a>
										</figure>
										<div class="lower-content">
											<div class="class-info">
												<h4>
													<a href="#" class="vdo" data-code="<c:out value='${onlineRandomList.vdoCd }'/>"><c:out value="${ onlineRandomList.vdoNm}" /></a>
												</h4>
												<a class="class-cat" ><c:out value="${ onlineRandomList.vdoTr}" /></a>
											</div>	
											<div class="price-info">
												<div class="price">
													<fmt:formatNumber value="${ onlineRandomList.vdoPrc}" /> 원
												</div>
												<div class="rating">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star-o"></span>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>	
						</div>
					
					</aside>
				</div>
			<!--End Sidebar Side-->
			
		</div>
	</div>
</div>