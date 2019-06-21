<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main Header-->
<header class="main-header">

	<!-- Main Box -->
	<div class="main-box">
		<div class="auto-container">
			<div class="outer-container clearfix">
				<!--Logo Box-->
				<div class="logo-box">
					<div class="logo">
						<a href="main.do"><img src="images/logo4.PNG" alt=""></a>
					</div>
				</div>

				<!--Nav Outer-->
				<div class="nav-outer clearfix">
					<!-- Main Menu -->
					<nav class="main-menu" style="margin-left: 100px">
						<div class="navbar-header">
							<!-- Toggle Button -->
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>

						<div class="navbar-collapse collapse clearfix">
							<ul class="navigation clearfix">

								<li><a href="about-us.html" style="font-size:18px  ;">Yoga yo!</a></li>
								<li><a href="<c:url value='/online.do'/>" style="font-size:18px  ;">온라인수업</a></li>								
								<li><a href="<c:url value='/shop.do'/>" style="font-size:18px  ;">요가 용품</a></li>
								<li><a href="<c:url value='/review.do'/>" style="font-size:18px  ;">이용후기</a>
								<li><a href="<c:url value='/contact.do'/>" style="font-size:18px  ;">고객센터</a></li>						
								<li><a href="contact.html" style="color: red ; font-size:18px  ;">수강권신청</a></li>

							</ul>
						</div>
					</nav>
					<!-- Main Menu End-->

				</div>
				<!--Nav Outer End-->


				<!-- Hidden Nav Toggler -->
				<div class="nav-toggler">
					<button class="hidden-bar-opener">
						<span class="icon fa fa-bars"></span>
					</button>

				</div>
				<!-- / Hidden Nav Toggler -->
				<!--  
                    Search Btn
                    <a href="shopping-cart.html" class="cart-btn-outer" >
                    	<div class="icon">
                    		<span class="flaticon-shopping-bag-1"></span>
                    		<span class="count">3</span>
                    	</div>
                    	<span class="amount">상품 없음</span>
                    </a>
                     -->
			</div>
		</div>
	</div>

</header>
<!--End Main Header -->

<!-- Hidden Navigation Bar -->
<section class="hidden-bar right-align">

	<div class="hidden-bar-closer">
		<button class="btn">
			<i class="fa fa-close"></i>
		</button>
	</div>

	<!-- Hidden Bar Wrapper -->
	<div class="hidden-bar-wrapper">

		<!-- .logo -->
		<div class="logo text-center">
			<a href="index.html"><img src="" alt=""></a>
		</div>
		<!-- /.logo -->

		<!-- .Side-menu -->
		<div class="side-menu">
			<a href="#" style="margin-left: 40px">Login</a> <a href="#"
				style="float: right; margin-right: 40px">Register</a>

			<!-- .navigation -->
			<ul class="navigation">

				<li class="dropdown current"><a href="#">Home</a>
					<ul>
						<li><a href="index.html">Home One</a></li>
						<li><a href="index2.html">Home Two</a></li>
					</ul></li>
				<li><a href="about-us.html">About Us</a></li>
				<li class="dropdown"><a href="#">Classes</a>
					<ul>
						<li><a href="class-list-view.html">Classes List View</a></li>
						<li><a href="class-grid-view.html">Classes Grid View</a></li>
						<li><a href="class-single.html">Class Single</a></li>
					</ul></li>
				<li class="dropdown"><a href="#">Events</a>
					<ul>
						<li><a href="events-one.html">Events Style One</a></li>
						<li><a href="events-two.html">Events Style Two</a></li>
						<li><a href="event-single.html">Event Single</a></li>
					</ul></li>
				<li class="dropdown"><a href="#">Pages</a>
					<ul>
						<li><a href="error-page.html">404 Page</a></li>
						<li class="dropdown"><a href="#">Trainers</a>
							<ul>
								<li><a href="trainers.html">Trainers</a></li>
								<li><a href="trainer-single.html">Trainer Single</a></li>
							</ul></li>
						<li><a href="shopping-cart.html">Shopping Cart</a></li>
						<li><a href="checkout.html">Checkout</a></li>
					</ul></li>
				<li class="dropdown"><a href="#">Shop</a>
					<ul>
						<li><a href="shop.html">Shop</a></li>
						<li><a href="shop-grid.html">Shop Grid View</a></li>
						<li><a href="shop-grid-full.html">Shop Grid Full</a></li>
						<li><a href="shop-list.html">Shop List View</a></li>
						<li><a href="shop-single.html">Shop Single</a></li>
						<li><a href="shop-single-full.html">Shop Single Full</a></li>
						<li><a href="shopping-cart.html">Shopping Cart</a></li>
						<li><a href="checkout.html">Checkout</a></li>
					</ul></li>
				<li class="dropdown"><a href="#">Blog</a>
					<ul>
						<li><a href="blog-grid.html">Blog Grid View</a></li>
						<li><a href="blog-list.html">Blog List View</a></li>
						<li><a href="blog-list-full.html">Blog List Full</a></li>
						<li><a href="blog-single.html">Blog Single</a></li>
					</ul></li>
				<li><a href="contact.html">Contact</a></li>

			</ul>

		</div>
		<!-- /.Side-menu -->

		<div class="social-icons">
			<ul>
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			</ul>
		</div>

	</div>
	<!-- / Hidden Bar Wrapper -->
</section>
<!-- / Hidden Bar -->