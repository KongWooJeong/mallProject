<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<html>
	<!-- <head></head> -->
	<tiles:insertAttribute name="head"/>

<body>

<div class="page-wrapper">
 	
    <!-- loading 시 나오는 모래시계 -->
    <div class="preloader"></div>
 	
 	<!-- <header></header> ~ <hidden까지>-->
    <tiles:insertAttribute name="nav"/>
    
    <!-- 매번 바뀌는 content -->
    <tiles:insertAttribute name="content"/>
    
    <!--<footer></footer> -->
    <tiles:insertAttribute name="footer"/>

</div>
<!--End pagewrapper-->

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target=".main-header"><span class="fa fa-long-arrow-up"></span></div>


<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/revolution.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/mixitup.js"></script>
<!-- Master Slider -->
<script src="js/masterslider/jquery.easing.min.js"></script>
<script src="js/masterslider/masterslider.min.js"></script>

<script src="js/map-script.js"></script>
<script src="js/validate.js"></script>
<script src="js/nouislider.js"></script>

<!--End Master Slider -->
<script src="js/owl.js"></script>
<script src="js/wow.js"></script>
<script src="js/script.js"></script>

<script src="js/sidebar.js"></script>


</body>
</html>