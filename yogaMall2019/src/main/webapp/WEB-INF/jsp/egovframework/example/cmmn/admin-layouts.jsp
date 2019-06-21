<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
<!DOCTYPE html>
<html>
	<tiles:insertAttribute name="head"/>	
  	<body>
  		<div id="wrapper" class="ui-tbl">
	  		<tiles:insertAttribute name="header"/>
  		    <hr>
	  		<div id="container" class="ui-tbl-row">
	  			<tiles:insertAttribute name="left"/>
	  			<!-- 임시 스타일 적용 -->
				<div class="contents" style="padding:0px 30px 48px 41px !important;">
					<!-- 임시 스타일 적용 -->
					<div id="tab_con" style="min-height:500px;">
		  				<tiles:insertAttribute name="content"/>
					</div>
				</div>
			</div>
		  	<tiles:insertAttribute name="footer"/>
  		</div>
  	</body>
</html>