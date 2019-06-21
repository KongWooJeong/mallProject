<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row clearfix">
	<%-- 상품목록 --%>
	<c:forEach items="${goodsList}" var="goodsList">
		<div class="product-item col-lg-4 col-md-6 col-sm-6 col-xs-12" style="height: 410px;">
			<div class="inner-box">
				<figure class="image-box" style="width: 240px; height: 270px;">
					<a href="#" class="goods" data-gd="${goodsList.gdCd}">
						<img src="<c:url value="/images/shop/img/${goodsList.filePath}"/>/<c:out value="${goodsList.phsFileNm}"/>" style="width: 240px; height: 270px;" alt="">
					</a>
					
				</figure>
				<div class="lower-content">
					<h3>
						<a href="#" class="goods" data-gd="${goodsList.gdCd}"><c:out value="${goodsList.gdNm}"/></a>
					</h3>										
					<div class="price"><fmt:formatNumber value="${goodsList.gdPrc}"/>원</div>
				</div>
			</div>
		</div>											
	</c:forEach> 	
	<%-- //상품목록 --%>					
</div>

<%-- 페이징 --%>
<div class="styled-pagination text-center padd-top-20">
	<ul>
		<c:if test="${pageInfo.getFirstPageNoOnPageList() > 1 }">
			<li><a class="prev" href="#" data-page="<c:out value="${pageInfo.getFirstPageNoOnPageList() - 1}" />"><span class="fa fa-long-arrow-left"></span></a></li>
		</c:if>
		<c:forEach begin="${pageInfo.getFirstPageNoOnPageList()}" end="${pageInfo.getLastPageNoOnPageList()}" step="1" var="idx">
			<li><a href="#" data-page="<c:out value="${idx}" />" class="<c:out value="${pageInfo.getCurrentPageNo() == idx ? 'active': ''}" />">${idx}</a></li>
		</c:forEach>
         <c:if test="${pageInfo.getLastPageNoOnPageList() < pageInfo.getTotalPageCount()}">
			<li><a class="next" href="#" data-page="<c:out value="${pageInfo.getLastPageNoOnPageList() + 1}" />"><span class="fa fa-long-arrow-right"></span></a></li>
		</c:if>
	</ul>
</div>	
<%-- //페이징 --%>