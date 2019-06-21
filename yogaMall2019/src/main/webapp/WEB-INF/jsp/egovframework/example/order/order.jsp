<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp"%>

<div class="shopping-cart-page">
	<div class="auto-container">

		<!--Shopping Cart-->
		<section class="shopping-cart cart-section">
			<div class="group-title">
				<h2>주문내역</h2>
			</div>

			<!--Cart Column-->
			<div class="cart-column">
				<!--Cart Outer-->
				<div class="cart-outer">
					<div class="table-outer">
						<table class="cart-table">
							<thead class="cart-header">
								<tr>
									<th class="prod-column">상품</th>
									<th></th>
									<th class="price">가격</th>
									<th>수량</th>
									<th>합계</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="prod-column" colspan="2">
										<figure class="prod-thumb">
											<a href="#"><img src="images/resource/products/cart-thumb-1.jpg" alt=""></a>
										</figure>
										<div class="prod-info">
											<h3 class="prod-title">
												<a href="#">Yoga Bra</a>
											</h3>
											<div class="info">
												Color: <span class="theme_color">Green / Dark Blue</span>
											</div>
										</div>
									</td>
									<td class="price">$9.50</td>
									<td class="qty">
										<div class="quantity-spinner">
											<input type="text" name="product" value="2" class="prod_qty" style="width: 60px; padding: 0px;"/>
										</div>
									</td>
									<td class="sub-total">$19.00</td>

								</tr>

								<tr>
									<td class="prod-column" colspan="2">
										<figure class="prod-thumb">
											<a href="#"><img
												src="images/resource/products/cart-thumb-2.jpg" alt=""></a>
										</figure>
										<div class="prod-info">
											<h3 class="prod-title">
												<a href="#">Yoga Towel</a>
											</h3>
											<div class="info">
												Color: <span class="theme_color">Green / Dark Blue</span>
											</div>
										</div>
									</td>
									<td class="price">$16.50</td>
									<td class="qty">
										<div class="quantity-spinner">
											<input type="text" name="product" value="1" class="prod_qty" style="width: 60px; padding: 0px;" />
										</div>
									</td>
									<td class="sub-total">$16.50</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--End Cart Column-->
		</section>
	</div>
</div>