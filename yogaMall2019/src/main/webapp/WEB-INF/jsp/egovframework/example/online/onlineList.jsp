<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include	file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>

<div class="row clearfix">

	<c:forEach items="${vdoList }" var="vdoList">
		<!--Product item-->
		<div class="product-item col-lg-4 col-md-6 col-sm-6 col-xs-12">
			<div class="inner-box">
				<figure class="image-box">
					<a href="#" class="vdo" data-code="${vdoList.vdoCd }"> 
						<img src="<c:url value='${ vdoList.vdoImgUrl}'/>" alt="">
					</a>
				</figure>
				<div class="lower-content">
					<h3>
						<a href="#" class="vdo" data-code="${vdoList.vdoCd }"><c:out value="${vdoList.vdoNm }" /></a>
					</h3>
					<div class="subtitle">
						<c:out value="${vdoList.vdoTr }" />
					</div>
					<div class="price">
						<fmt:formatNumber value="${vdoList.vdoPrc }" /> 원
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>


<!-- Styled Pagination -->
<div class="styled-pagination text-center padd-top-20">
	<ul>
		<c:if test="${pageInfo.getFirstPageNoOnPageList() > 1 }">
			<li><a class="prev"
				data-page='<c:out value='${pageInfo.getFirstPageNoOnPageList() - 1 }'/>'>
					<span class="fa fa-long-arrow-left"></span>
			</a></li>
		</c:if>
		<c:forEach begin="${pageInfo.getFirstPageNoOnPageList() }"
			end="${pageInfo.getLastPageNoOnPageList() }" step="1" var="index">
			<li><a data-page="<c:out value='${index }'/> "
				class="${pageInfo.getCurrentPageNo() == index ? 'active' : '' }">${index }</a>
			</li>
		</c:forEach>
		<c:if
			test="${pageInfo.getLastPageNoOnPageList() < pageInfo.getTotalPageCount()}">
			<li><a class="next"
				data-page="<c:out value='${pageInfo.getLastPageNoOnPageList() + 1 }'/>">
					<span class="fa fa-long-arrow-right"></span>
			</a></li>
		</c:if>
	</ul>
</div>