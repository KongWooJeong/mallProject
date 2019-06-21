<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>
<style>
#product-name {
	text-align: center;
	font-size: 17px;
	font-weight: bold;
}
</style>
<script type="text/javascript">

	$(function() {
		move.onlineDets();
		move.shopDets();
	})
	
	var move = {
			
		onlineDets		: function() {
			$("a.main-online").click(function() {
				var catCd = $(this).data("code");
				
				location.href = "<c:url value='/onlineDt.do'/>?code=" + catCd;
			})
			
		},
		
		shopDets		: function() {
			$("a.main-product").click(function() {
				var catCd = $(this).data("code");
				
				location.href = "<c:url value='/shopDt.do'/>?code=" + catCd;
			})
		}
	}

</script>
<!--Main Slider-->
<section class="main-slider default-style style-one">

	<div class="tp-banner-container">
		<div class="tp-banner">
			<ul>
				<li data-transition="fade" data-slotamount="1"
					data-masterspeed="1000" data-thumb="images/main-slider/2.jpg"
					data-saveperformance="off" data-title="Awesome Title Here">
					<!--Pricing Section-->
					<section class="pricing-section" style="background-image: url(images/background/background-06.png); height: 80%"></section>
				</li>

			</ul>

			<div class="tp-bannertimer"></div>
		</div>
	</div>
</section>

<!--Classes Gallery Section-->
<section id="class-list" class="classes-gallery">
	<div class="auto-container">
		<!--Section Title-->
		<div class="sec-title centered">
			<h3>수업 소개</h3>
			<div class="desc-text">레벨에 맞춰 원하는 수업을 선택하세요</div>
			<div class="styled-line">
				<span class="line"></span>
			</div>
		</div>
		<div class="filter-list row clearfix">

			<!--Default Class Column-->
			<div class="default-class-column mix mix_all beginner col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box">
					<div class="box-header">
						<h3>
							<a href="#" data-code="1000000017" class="main-online">임산부 요가</a>
						</h3>
						<a class="class-cat beginner">초급</a>
					</div>
					<figure class="image-box">
						<a href="#" data-code="1000000017" class="main-online"><img src="images/class/eva_pregnant.png" alt=""></a>
					</figure>
					<div class="content-box">
						<div class="price-info">
							<div class="price">4.1</div>
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star-o"></span>
							</div>
						</div>
						<ul class="class-info">
							<li><span class="icon flaticon-people"></span>에바요가</li>
							<li><span class="icon flaticon-correct"></span>초급, 임산부, 하체</li>
						</ul>
					</div>
				</div>
			</div>

			<!--Default Class Column-->
			<div
				class="default-class-column mix mix_all intermediate col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box">
					<div class="box-header">
						<h3>
							<a href="#" data-code="1000000083" class="main-online">남성 요가</a>
						</h3>
						<a class="class-cat intermediate">중급</a>
					</div>
					<figure class="image-box">
						<a href="#" data-code="1000000083" class="main-online"><img src="images/class/man_hip.png" alt=""></a>
					</figure>
					<div class="content-box">
						<div class="price-info">
							<div class="price">4.7</div>
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span>
							</div>
						</div>
						<ul class="class-info">
							<li><span class="icon flaticon-people"></span>요가소년</li>
							<li><span class="icon flaticon-correct"></span>남성, 골반, 하체</li>
						</ul>
					</div>
				</div>
			</div>

			<!--Default Class Column-->
			<div
				class="default-class-column mix mix_all beginner col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box">
					<div class="box-header">
						<h3>
							<a href="#" data-code="1000000003" class="main-online">힐링 요가</a>
						</h3>
						<a class="class-cat beginner">초급</a>
					</div>
					<figure class="image-box">
						<a href="#" data-code="1000000003" class="main-online"><img src="images/class/yogaeun_back.png" alt=""></a>
					</figure>
					<div class="content-box">
						<div class="price-info">
							<div class="price">3.9</div>
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star-o"></span>
							</div>
						</div>
						<ul class="class-info">
							<li><span class="icon flaticon-people"></span>요가은</li>
							<li><span class="icon flaticon-correct"></span>초급, 스트레칭, 릴렉스</li>
						</ul>
					</div>
				</div>
			</div>

			<!--Default Class Column-->
			<div
				class="default-class-column mix mix_all advanced col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box">
					<div class="box-header">
						<h3>
							<a href="#" data-code="1000000075" class="main-online">빈야사</a>
						</h3>
						<a class="class-cat advanced">고급</a>
					</div>
					<figure class="image-box">
						<a href="#" data-code="1000000075" class="main-online"><img src="images/class/eva_vinyasa.png" alt=""></a>
					</figure>
					<div class="content-box">
						<div class="price-info">
							<div class="price">4.3</div>
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span>
							</div>
						</div>
						<ul class="class-info">
							<li><span class="icon flaticon-people"></span>에바요가</li>
							<li><span class="icon flaticon-correct"></span>고급, 빈야사, 다이어트</li>
						</ul>
					</div>
				</div>
			</div>

			<!--Default Class Column-->
			<div
				class="default-class-column mix mix_all beginner col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box">
					<div class="box-header">
						<h3>
							<a href="#" data-code="1000000079" class="main-online">남성요가</a>
						</h3>
						<a class="class-cat beginner">초급</a>
					</div>
					<figure class="image-box">
						<a href="#" data-code="1000000079" class="main-online"><img src="images/class/man_morning.png" alt=""></a>
					</figure>
					<div class="content-box">
						<div class="price-info">
							<div class="price">4.0</div>
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star-o"></span>
							</div>
						</div>
						<ul class="class-info">
							<li><span class="icon flaticon-people"></span>요가소년</li>
							<li><span class="icon flaticon-correct"></span>초급, 남성, 스트레칭</li>
						</ul>
					</div>
				</div>
			</div>

			<!--Default Class Column-->
			<div
				class="default-class-column mix mix_all intermediate col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box">
					<div class="box-header">
						<h3>
							<a href="#" data-code="1000000011" class="main-online">힐링요가</a>
						</h3>
						<a class="class-cat intermediate">중급</a>
					</div>
					<figure class="image-box">
						<a href="#" data-code="1000000011" class="main-online"><img src="images/class/yogaeun_legs.png" alt=""></a>
					</figure>
					<div class="content-box">
						<div class="price-info">
							<div class="price">3.5</div>
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star-o"></span>
							</div>
						</div>
						<ul class="class-info">
							<li><span class="icon flaticon-people"></span>요가은</li>
							<li><span class="icon flaticon-correct"></span>중급, 하체, 스트레칭</li>
						</ul>
					</div>
				</div>
			</div>

		</div>

	</div>
</section>

<!--Team Section-->
<section class="team-section">
	<div class="auto-container">
		<!--Section Title-->
		<div class="sec-title centered">
			<h3>트레이너 소개</h3>
			<div class="desc-text">당신을 위한 최고의 트레이너</div>
			<div class="styled-line">
				<span class="line"></span>
			</div>
		</div>
		<div class="row clearfix">

			<!--Team Member-->
			<div class="team-member col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box wow fadeInUp" data-wow-duration="1500ms"
					data-wow-delay="0ms">
					<!--Image-->
					<figure class="image-box">
						<a href="#"><img src="images/gallery/yogaen.PNG" alt=""></a>
						<div class="social-links">
							<a href="#"><span class="fa fa-facebook-f"></span></a> <a
								href="#"><span class="fa fa-twitter"></span></a> <a href="#"><span
								class="fa fa-google-plus"></span></a> <a href="#"><span
								class="fa fa-instagram"></span></a>
						</div>
					</figure>
					<div class="member-info">
						<div class="designation">초 급</div>
						<h3>
							<a href="trainer-single.html">요가은</a>
						</h3>
						<h5>초급 - 부위별</h5>
					</div>
				</div>
			</div>

			<!--Team Member-->
			<div class="team-member col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box wow fadeInUp" data-wow-duration="1500ms"
					data-wow-delay="300ms">
					<!--Image-->
					<figure class="image-box">
						<a href="#"><img src="images/gallery/yogaboy.png" alt=""></a>
						<div class="social-links">
							<a href="#"><span class="fa fa-facebook-f"></span></a> <a
								href="#"><span class="fa fa-twitter"></span></a> <a href="#"><span
								class="fa fa-google-plus"></span></a> <a href="#"><span
								class="fa fa-instagram"></span></a>
						</div>
					</figure>
					<div class="member-info">
						<div class="designation">남 성</div>
						<h3>
							<a href="trainer-single.html">요가소년</a>
						</h3>
						<h5>남성 분들 위한 요가 트레이너</h5>
					</div>
				</div>
			</div>

			<!--Team Member-->
			<div class="team-member col-md-4 col-sm-6 col-xs-12">
				<div class="inner-box wow fadeInUp" data-wow-duration="1500ms"
					data-wow-delay="600ms">
					<!--Image-->
					<figure class="image-box">
						<a href="#"><img src="images/gallery/evayoga.png" alt=""></a>
						<div class="social-links">
							<a href="#"><span class="fa fa-facebook-f"></span></a> <a
								href="#"><span class="fa fa-twitter"></span></a> <a href="#"><span
								class="fa fa-google-plus"></span></a> <a href="#"><span
								class="fa fa-instagram"></span></a>
						</div>
					</figure>
					<div class="member-info">
						<div class="designation">중 급</div>
						<h3>
							<a href="trainer-single.html">에바요가</a>
						</h3>
						<h5>중급 - 소도구를 이용한 스트레칭</h5>
					</div>
				</div>
			</div>

		</div>

	</div>

</section>

<!--Gallery Section-->
<section class="gallery-section"
	style="background-image: url(images/background/watercolor-4.PNG)">
	<div class="auto-container">
		<!--Section Title-->
		<div class="sec-title centered">
			<h3 class="">요가 용품</h3>
			<h2>요가 수업을 도와줄 소도구</h2>
			<div class="styled-line">
				<span class="line"></span>
			</div>
		</div>

		<div class="row clearfix">
			<!--Images Column-->
			<div class="images-column col-md-9 col-sm-12 col-xs-12"
				style="width: 1380px;">

				<!--Gallery Item-->
				<div
					class="default-class-column mix mix_all advanced col-md-4 col-sm-6"
					style="display: inline-block; width: 300px;">
					<div class="inner-box">
						<figure class="image-box">
							<a href="#" data-code="G000000415" class="main-product"><img src="images/shop/img/G000000415/ball4_270.jpg" alt="짐볼"></a>
							<div id="product-name">
								<a href="#" data-code="G000000415" class="main-product"><span class="title centered"> 바디밸런스 필라테스 요가볼 </span></a>
							</div>
						</figure>
						<div class="content-box">
							<div class="info">
								<span class="tags"> <span class="tag"
									style="color: #fe6d6d; font-size: 11px;"><strong>[MD추천!]</strong></span>
								</span><br /> <span class="price"> <strong>20,000<span>원</span></strong>
								</span><br /> <span class="option"> <span class="buy"
									style="font-size: 11px;">구매 390</span>
								</span>
							</div>
						</div>
					</div>
				</div>


				<!--Gallery Item-->
				<div
					class="default-class-column mix mix_all advanced col-md-4 col-sm-6 col-xs-12"
					style="display: inline-block; width: 300px;">
					<div class="inner-box">
						<figure class="image-box">
							<a href="#" data-code="G000000421" class="main-product"><img src="images/shop/img/G000000421/P_ring1_270.jpg" alt="필라테스링"></a>
							<div id="product-name">
								<a href="#" data-code="G000000421" class="main-product"><span class="title centered"> 필라테스 링 </span></a>
							</div>
						</figure>
						<div class="content-box">
							<div class="info">
								<span class="tags"> <span class="tag"
									style="color: #0080ff; font-size: 11px;"><strong>[인기상품]</strong></span>
								</span><br /> <span class="price"> <strong>30,000<span>원</span></strong>
								</span><br /> <span class="option"> <span class="buy"
									style="font-size: 11px;">구매 950</span>
								</span>
							</div>
						</div>
					</div>
				</div>


				<!--Gallery Item-->
				<div
					class="default-class-column mix mix_all advanced col-md-4 col-sm-6 col-xs-12"
					style="display: inline-block; width: 300px;">
					<div class="gallery-item">
						<div class="inner-box">
							<figure class="image-box">
								<a href="#" data-code="G000000451" class="main-product"><img src="images/shop/img/G000000451/roller1_270.jpg" alt="폼롤러"></a>
								<div id="product-name">
									<a href="#" data-code="G000000451" class="main-product"><span class="title centered"> 날씬한 다리를 위한 폼롤러 </span></a>
								</div>
							</figure>
							<div class="content-box">
								<div class="info">
									<span class="tags"> <span class="tag"
										style="color: #fe6d6d; font-size: 11px;"><strong>[MD추천!]</strong></span>
									</span><br /> <span class="price"> <strong>28,900<span>원</span></strong>
									</span><br /> <span class="option"> <span class="buy"
										style="font-size: 11px;">구매 890</span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>



				<!--Gallery Item-->
				<div
					class="default-class-column mix mix_all advanced col-md-4 col-sm-6 col-xs-12"
					style="display: inline-block; width: 300px;">
					<div class="gallery-item">
						<div class="inner-box">
							<figure class="image-box">
								<a href="#" data-code="G000000426" class="main-product"><img src="images/shop/img/G000000426/mat2_270.jpg" alt="요가매트"></a>
								<div id="product-name">
									<a href="#" data-code="G000000426" class="main-product"><span class="title centered"> 요가 매트 </span></a>
								</div>							
							</figure>
							<div class="content-box">
								<div class="info">
									<span class="tags"> <span class="tag"
										style="color: #84CA10; font-size: 11px;"><strong>[NEW!]</strong></span>
									</span><br /> <span class="price"> <strong>25,000<span>원</span></strong>
									</span><br /> <span class="option"> <span class="buy"
										style="font-size: 11px;">구매 190</span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--Testimonials Section-->
<section class="testimonials-section">
	<div class="auto-container">

		<!--Section Title-->
		<div class="sec-title centered">
			<h3 class="">후기</h3>
			<div class="desc-text">수강생들의 생생한 후기</div>
			<div class="styled-line">
				<span class="line"></span>
			</div>
		</div>

		<!-- Slider -->
		<div class="ms-caro3d-template">
			<!-- masterslider -->
			<div class="master-slider ms-skin-default" id="testimonial-slider">
				<!--Slide-->
				<div class="ms-slide">
					<div class="content-layer">
						<div class="inner-box">
							<img src="images/icon/person_icon1.png" class="img-circle" alt="">
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star-o"></span>
							</div>
							<div class="text">“듣고 싶은 요가 수업이랑 학교 수업이 겹쳐서 고민이 많았는데 요가요에서
								원하는 수업을 내 스케쥴에 맞춰 들을 수 있어서 좋았어요! 친구들한테도 추천해서 같이 다니고 있어요!!”</div>
							<div class="author-info">
								<strong>박선형</strong> / <span class="designation">학생</span>
							</div>
						</div>
					</div>
				</div>
				<!--Slide-->
				<div class="ms-slide">
					<div class="content-layer">
						<div class="inner-box">
							<img src="images/icon/person_icon2.png" class="img-circle" alt="">
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span>
							</div>
							<div class="text">“진짜 적극 추천합니다 !! 직장다니면서 원하는 요가시간에 원하는 요가를
								하지 못했는데 진짜 온라인 요가 덕분에 틈나면 할 수 있었어요. 그리고 다른 곳들보다 더 저렴하게 운동할 수 있고
								굳이 운동복 가져가고 씻고 귀찮게 이럴필요가 없이 홈트레이닝으로 자유롭게 운동하고 있어요. 요가요 최고!!”</div>
							<div class="author-info">
								<strong>황정아</strong> / <span class="designation">개발자</span>
							</div>
						</div>
					</div>
				</div>
				<!--Slide-->
				<div class="ms-slide">
					<div class="content-layer">
						<div class="inner-box">
							<img src="images/icon/person_icon3.png" class="img-circle" alt="">
							<div class="rating">
								<span class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star"></span><span class="fa fa-star"></span><span
									class="fa fa-star-o"></span>
							</div>
							<div class="text">“아무래도 임신상태라 직접 가서 요가를 하자니 부담됬었는데, 이렇게
								온라인으로 내가 듣고 싶은 유형과 트레이너를 고를수 있어서 너무 좋아용~!>< 아무래도 애가 낳고서도 산후조리 할
								때도 꼭 이용해야겟어용!!!”</div>
							<div class="author-info">
								<strong>조아빈</strong> / <span class="designation">임산부</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of masterslider -->
		</div>
		<!-- end of Slider -->

	</div>
</section>
