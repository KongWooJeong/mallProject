<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<script type="text/javascript">

	$(function() {		
		checkVideo.init();
	})

	var moveCart = {
			
		init	: function() {
			
			// 장바구니 이동
			$("#online-btn").click(function() {
				
				<c:choose>
					<c:when test="${sessionVO eq null }">
						$("#online-form").attr("action", "<c:url value='/login.do'/>")
					</c:when>
					<c:otherwise>
						$("#online-form").attr("action", "<c:url value='/addCart.do'/>");					
					</c:otherwise>
				</c:choose>
							
				$("#online-form").submit();
			});		
		}
	}
	
	var checkVideo = {
			
		init	: function() {
			
			var vdoCd = ${vdo.vdoCd};
			
			$.ajax({
				data	: { "vdoCd" : vdoCd },
				type	: "post",
				url		: "<c:url value='/checkVideo.do'/>",
				success : function(data) {
					
					if (data.result === "success") {
						$("#online-btn").text("강의실 가기");
						$("#online-btn").attr("href", "<c:url value='/classroom.do'/>");
					} else {
						moveCart.init();
					}
				}
			})
		}
			
	}

</script>
<!--Sidebar Page Container-->
<div class="sidebar-page-container">
	<div class="auto-container">
		<div class="row clearfix">
			<!--Content Side-->
			<div class="content-side col-lg-9 col-md-8 col-sm-12 col-xs-12">

				<!--Class Single-->
				<section class="single-class">

					<div class="post-container">
						<div class="inner-box">
							<div class="title-info">
								<h2><c:out value='${vdo.vdoNm }'/></h2>
								
							</div>
							
							<!--Video Box-->
							<div class="video-box">
								<iframe width="700" height="390" src="<c:out value='${vdo.vdoUrl }'/>?end=120" frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								<div class="video-caption">미리보기</div>
							</div>
							
							<div class="content-box">
								<!--Product Tabs-->
								<section class="prod-tabs" id="product-tabs">
	
									<!--Tab Btns-->
									<div class="tab-btns clearfix">
										<a href="#prod-description" class="tab-btn active-btn">강의정보</a>									
									</div>
	
									<!--Tabs Container-->
									<div class="tabs-container">
	
										<!--Tab / Active Tab-->
										<div class="tab active-tab" id="prod-description">
											<div class="content">
												<h3>특징</h3>
												<p><c:out value="${vdo.smr }"/></p>											
											</div>
										</div>		
									</div>								
								</section>	
							</div>
						</div>
					</div>
				</section>

			</div>
			<!--End Content Side-->

			<!--Sidebar-->
			<div class="sidebar-side col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<aside class="sidebar">

					<!--Sidebar Widget / class stats Widget-->
					<div class="sidebar-widget class-stats-widget">
						<div class="content-box">
							<div class="header-box">
								<div class="price"><fmt:formatNumber value="${vdo.vdoPrc }"/>원</div>
								<div class="rating">
									<span class="fa fa-star"></span><span class="fa fa-star"></span><span
										class="fa fa-star"></span><span class="fa fa-star"></span><span
										class="fa fa-star-o"></span>
								</div>
								<a href="#" class="class-level">
									<c:out value="${vdo.title }"/>
								</a>
							</div>
							<form id="online-form" method="post" action="">
								<ul class="info-list">
									<li class="info-detail"><strong>분류</strong><c:out value='${vdo.catNm }'/></li>
									<li class="info-detail"><strong>강사</strong><c:out value='${vdo.vdoTr }'/></li>								
									<li style="padding-left: 45px;"><a href="#" id="online-btn" class="theme-btn btn-style-two">장바구니</a></li>
								</ul>
								<input type="hidden" name="vdoCd" value="<c:out value='${vdo.vdoCd }'/>">
							</form>
						</div>
					</div>

				</aside>
			</div>
			<!--End Sidebar Side-->
		</div>
	</div>
</div>
