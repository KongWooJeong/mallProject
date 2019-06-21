<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=765acf0c80c21abf04115bf6c04981e6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	$(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.49861712132161, 127.0276103216081), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	})
</script>

<!--Contact Information Section-->
<section class="contact-information">
	<div class="auto-container one-column-offset">
		<div class="row clearfix" style="width: 1500px;">

			<!--Map Column-->
			<div class="map-column col-md-4 col-sm-4 col-xs-12" style="width: 450px;">
				<!--Map Container-->
				<div id="map" class="map-container wow fadeInLeft"
					style="width: 450px; height: 470px"></div>
				<%-- <div class="map-container wow fadeInLeft" data-wow-duration="1500ms"
					data-wow-delay="0ms">
					<!--Map Canvas-->
					<div class="map-canvas" data-zoom="13" data-lat="-37.817085"
						data-lng="144.955631" data-type="roadmap" data-hue="#ffc400"
						data-title="Leezen"
						data-content="Location Title Here<br><a href='mailto:info@youremail.com'>info@youremail.com</a>"
						style="height: 470px;"></div>
				</div> --%>
			</div>

			<!--Content Column-->

			<div class="content-column col-md-8 col-sm-6 col-xs-12" style="padding-left: 100px;" >
				<div class="big-text" style="left: 50px;">
					Contact<br>Us
				</div>
				<!--Section Title-->
				<div class="sec-title">
					<h3 class="styled-font">Contact details</h3>
					<h2>Get in touch with us</h2>
				</div>

				<!--Info -->
				<div class="row clearfix" style="width: 500px;">
					<!--Info Block-->
					<div class="info-block col-lg-6 col-sm-12 col-xs-12">
						<div class="inner-box">
							<div class="icon-box">
								<span class="flaticon-telephone"></span>
							</div>
							<h4>전화</h4>
							<ul>
								<li>전화: +02 1234 9876</li>
							</ul>
						</div>
					</div>

					<!--Info Block-->
					<div class="info-block col-lg-6 col-sm-12 col-xs-12">
						<div class="inner-box">
							<div class="icon-box">
								<span class="flaticon-location"></span>
							</div>
							<h4>주소</h4>
							<ul>
								<li>서울시 강남구 역삼동</li>
							</ul>
						</div>
					</div>

					<!--Info Block-->
					<div class="info-block col-lg-6 col-sm-12 col-xs-12">
						<div class="inner-box">
							<div class="icon-box">
								<span class="flaticon-multimedia-3"></span>
							</div>
							<h4>Email</h4>
							<ul>
								<li>info@yogaya.com</li>
								<li>support@yogaya.com</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!--Contact Section-->
<section class="contact-section">

	<div class="auto-container one-column-offset">

		<div class="form-outer default-form">

			<form method="post" action="sendemail.php" id="contact-form">
				<div class="row clearfix">
					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="field-label">
							이름 <sup>*</sup>
						</div>
						<input type="text" name="username" value="" >
					</div>

					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="field-label">
							이메일 <sup>*</sup>
						</div>
						<input type="email" name="email" value="" >
					</div>

					<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="field-label">제목</div>
						<input type="text" name="subject" value="" >
					</div>

					<div class="form-group col-lg-12 col-sm-12 col-xs-12">
						<div class="field-label">내용</div>
						<textarea name="message" ></textarea>
					</div>
				</div>
				<div class="text-center padd-top-20">
					<button type="submit" class="theme-btn btn-style-two">보내기</button>
				</div>
			</form>
		</div>
	</div>
</section>

