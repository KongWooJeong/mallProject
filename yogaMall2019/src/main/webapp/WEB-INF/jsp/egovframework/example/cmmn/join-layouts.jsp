<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">
	<tiles:insertAttribute name="head"/>	
<body>

<!--skip navigation-->
<a href="#container" class="skip-navigation">&raquo; 메뉴 건너 뛰기</a>

<!-- wrapper -->
<div id="wrapper" class="member join">
	<!-- header -->
	<tiles:insertAttribute name="header"/>	
	<!--// header -->
	
	<!-- content -->
	<tiles:insertAttribute name="content"/>	
	<!-- // content -->
    <hr>
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>	
	<!--// footer -->
</div>

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target=".main-header"><span class="fa fa-long-arrow-up"></span></div>

<!--// wrapper -->

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/revolution.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/mixitup.js"></script>
<!-- Master Slider -->
<script src="js/masterslider/jquery.easing.min.js"></script>
<script src="js/masterslider/masterslider.min.js"></script>
<!--End Master Slider -->
<script src="js/owl.js"></script>
<script src="js/wow.js"></script>
<script src="js/script.js"></script>
</body>
</html>