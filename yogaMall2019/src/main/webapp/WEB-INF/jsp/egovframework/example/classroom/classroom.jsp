<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<div class="classroom-page-container" >
	
	<!-- Video List -->
	<div class="row clearfix">
		<div class="classroom-title">
				<h2>나의 요가 강의</h2>
		</div>
		
		<c:forEach items="${classList }" var="list">
			<!--Product item-->
			<div class="product-item col-lg-4 col-md-6 col-sm-6 col-xs-12">
				<div class="inner-box">
					<figure class="image-box">
						<a href="<c:out value="${list.vdoUrl }"/>" class="vdo"> 
							<img src="<c:out value="${list.vdoImgUrl }"/>" alt="">
						</a>											
					</figure>
					<div class="lower-content">
						<h3>
							<c:out value="${list.vdoNm }" />							
						</h3>
						<div class="subtitle">
							<c:out value="${list.vdoTr }" />
						</div>						
					</div>
				</div>
			</div>
		</c:forEach>	
	</div>
	
</div>