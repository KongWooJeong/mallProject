<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main Header-->
<header class="main-header">
	<!-- Header Top -->
    	<div class="header-top" style="border-bottom : 2px solid orange;">
        	<div class="auto-container">
            	<div class="row clearfix">
                    
                    <!--Top Left-->
                    <div class="top-left col-md-6 col-sm-6 col-xs-12 pull-left">
                    	<ul>
                        	<li class="text" ><a href="<c:url value='/main.do'/>">요가야에 오신 걸 환영합니다</a></li>
                        </ul>
                    </div>
                    
                    <!--Top Right-->
                    <div class="top-right col-md-6 col-sm-6 col-xs-12 pull-right">
                    	<div class="clearfix">
                            <ul class="info-nav">
                            	<li><a href="<c:url value='/admin.do'/> ">관리자</a></li>
                                 <c:choose>
                                 	<c:when test="${sessionVO eq null }">
                                 		<li><a href="<c:url value='/login.do'/> ">로그인</a></li>
			                    		<li><a href="<c:url value='/agreeWith.do'/>">회원가입</a></li>
                                 	</c:when>
                                 	<c:otherwise>
                                 		<li><a href="<c:url value='/cart.do'/>">장바구니</a></li>
										<li><a href="<c:url value='/classroom.do'/>">강의실</a></li>
										<li><a href="<c:url value='/info.do'/>">나의 정보</a></li>
										<li><a href="<c:url value='/order.do'/>">구매내역</a></li>										
			             		    	<li><a href="<c:url value='/logout.do'/>">로그아웃</a></li>
                                 	</c:otherwise>
                                 </c:choose>			                    
                            </ul>
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div><!-- Header Top End -->
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

								<li><a href="<c:url value='/introduce.do'/>" style="font-size:18px  ;">YogaYa</a></li>
								<li><a href="<c:url value='/online.do'/>" style="font-size:18px  ;">온라인수업</a></li>								
								<li><a href="<c:url value='/shop.do'/>" style="font-size:18px  ;">요가 용품</a></li>
								<li><a href="<c:url value='/review.do'/>" style="font-size:18px  ;">이용후기</a>
								<li><a href="<c:url value='/contact.do'/>" style="font-size:18px  ;">고객센터</a></li>
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
			 <c:choose>
              	<c:when test="${sessionVO eq null }">              		
    				<a href="<c:url value='/login.do'/>" style="margin-left: 40px">로그인</a> 
					<a href="<c:url value='/agreeWith.do'/>" style="float: right; margin-right: 40px">회원가입</a>
              	</c:when>
              	<c:otherwise>              		
					<a href="<c:url value='/info.do'/>" style="margin-left: 40px">나의 정보</a>					
					<a href="<c:url value='/logout.do'/>" style="margin-left: 40px">로그아웃</a> 
              </c:otherwise>
              </c:choose>
			
			<!-- .navigation -->
			<ul class="navigation">
				<li class="current"><a href="<c:url value='/main.do'/>">요가야</a></li>
				<li ><a href="<c:url value='/online.do'/>">온라인 수업</a></li>
				<li ><a href="<c:url value='/shop.do'/>">요가 용품</a></li>
				<li ><a href="<c:url value='/review.do'/>">이용후기</a></li>
				<li ><a href="<c:url value='/contact.do'/>">고객센터</a></li>
				<c:choose>
              		<c:when test="${sessionVO ne null }">
						<li><a href="<c:url value='/cart.do'/>">장바구니</a></li>
						<li><a href="<c:url value='/classroom.do'/>">강의실</a></li>
						<li><a href="<c:url value='/order.do'/>">구매내역</a></li>	
					</c:when>
				</c:choose>			
			</ul>

		</div>
		
	</div>
	<!-- / Hidden Bar Wrapper -->
</section>
<!-- / Hidden Bar -->