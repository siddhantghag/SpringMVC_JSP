<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}

.checkout-container {
	max-width: 900px;
	margin: 40px auto;
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	padding: 30px 40px;
}

/* Header */
.checkout-header {
	background-color: #232f3e;
	color: #fff;
	padding: 14px 24px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 25px;
}

.checkout-header h3 {
	margin: 0;
	font-weight: 700;
	font-size: 1.4rem;
}

/* Scroll Banner */
.scroll-banner {
	background-color: #232f3e;
	border-radius: 50px;
	padding: 10px 20px;
	overflow: hidden;
	box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.15);
	margin-bottom: 25px;
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 600;
	color: #febd69;
}


/* Buttons */
.btn-amazon {
	background-color: #febd69;
	border-color: #f3a847;
	color: #111;
	font-weight: 600;
}

.btn-amazon:hover {
	background-color: #f3a847;
	color: #111;
}

/* Empty cart */
.empty-cart {
	text-align: center;
	padding: 40px 0;
}

.empty-cart i {
	font-size: 2rem;
	color: #999;
}

.alert {
	border-radius: 10px;
}
</style>
<div class="container checkout-container">
	<div class="checkout-header">
		<h3>
			<i class="bi bi-bag-check-fill me-2 text-warning"></i> Checkout
		</h3>
	</div>
	<c:if test="${empty cart}">
		<div
			class="alert alert-info empty-cart d-flex flex-column align-items-center">
			<i class="bi bi-cart-x-fill mb-3"></i>
			<h5>Your cart is empty</h5>
			<p class="text-muted mb-0">Looks like you haven’t added anything
				yet.</p>
			<a href="${pageContext.request.contextPath}/products"
				class="btn btn-amazon mt-3"> Continue Shopping </a>
		</div>
	</c:if>
	<c:if test="${not empty cart}">
		<div class="mb-4">
			<p class="lead fw-semibold text-secondary mb-4">Please review and
				place your order below.</p>
			<form method="post"
				action="${pageContext.request.contextPath}/checkout/place">
				<div class="d-grid gap-2">
					<button class="btn btn-amazon btn-lg shadow-sm">
						<i class="bi bi-bag-check-fill me-2"></i> Place Your Order
					</button>
				</div>
			</form>
		</div>
		<div class="card border-0 shadow-sm mt-4">
			<div class="card-body">
				<h5 class="fw-bold mb-3">
					<i class="bi bi-cart-fill me-2 text-warning"></i> Order Summary
				</h5>
				<p class="text-muted mb-0">All items in your cart will be
					processed for checkout.</p>
			</div>
		</div>
	</c:if>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>






















<%-- <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
body {
	background-color: #f3f3f3;
	font-family: "Amazon Ember", Arial, sans-serif;
}

/* Scroll Banner */
.scroll-banner {
	background-color: #232f3e;
	color: #fff;
	padding: 10px 0;
	border-radius: 6px;
	margin-bottom: 1.5rem;
	overflow: hidden;
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 18s linear infinite;
	font-weight: 600;
	color: #ffa41c;
}

@
keyframes scroll-left { 0% {
	transform: translateX(100%);
}

100
%
{
transform
:
translateX(
-100%
);
}
}

/* Cart Heading */
.cart-header {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 1.5rem;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

/* Product Cards */
.card-cart {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
	transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card-cart:hover {
	transform: translateY(-4px);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.card-cart img {
	border-radius: 8px;
	object-fit: contain;
	width: 100%;
}

.card-body-custom {
	padding: 15px 10px;
}

.product-id {
	font-size: 0.95rem;
	color: #007185;
	font-weight: 600;
}

/* Buttons */
.btn-continue {
	background-color: #ffd814;
	border: none;
	color: #111;
	font-weight: 600;
}

.btn-continue:hover {
	background-color: #f7ca00;
	color: #000;
}

.btn-checkout {
	background-color: #ffa41c;
	border: none;
	color: #111;
	font-weight: 600;
}

.btn-checkout:hover {
	background-color: #f39c12;
}

.alert-warning {
	background-color: #fff8e1;
	border: 1px solid #ffe082;
}
</style>
<!-- 
<div class="scroll-banner text-center">
	<div class="scroll-text">✌️ Over 1000 satisfied customers &nbsp;
		• &nbsp; 😄 5000+ products available &nbsp; • &nbsp; ⏰ Fast delivery
		across India &nbsp; • &nbsp; 📱 24*7 support</div>
</div> -->
<!-- Cart Header -->
<div
	class="cart-header d-flex align-items-center justify-content-between">
	<h3 class="fw-bold mb-0">
		<i class="bi bi-cart3 me-2 text-warning"></i>Your Cart
	</h3>
	<a href="${pageContext.request.contextPath}/products"
		class="btn btn-continue btn-sm"> <i
		class="bi bi-arrow-left-circle"></i> Continue Shopping
	</a>
</div>
<!-- Cart Section -->
<c:choose>
	<c:when test="${empty cart}">
		<div class="alert alert-warning d-flex align-items-center"
			role="alert">
			<i class="bi bi-cart-x-fill me-2 fs-4 text-danger"></i>
			<div>Your cart is empty. Start adding your favorite items!</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row g-4">
			<c:forEach var="entry" items="${cart}">
				<div class="col-md-6 col-lg-4">
					<div class="card card-cart h-100">
						<div class="row g-0 align-items-center p-3">
							<div class="col-4 text-center">
								<img
									src="${pageContext.request.contextPath}/assets/img/placeholder.png"
									alt="Product" class="img-fluid">
							</div>
							<div class="col-8">
								<div class="card-body-custom">
									<div class="product-id mb-2">#${entry.key}</div>
									<form method="post"
										action="${pageContext.request.contextPath}/cart/update"
										class="d-flex align-items-center gap-2">
										<input type="hidden" name="productId" value="${entry.key}">
										<input type="number" name="qty" min="0"
											class="form-control form-control-sm" value="${entry.value}"
											style="width: 80px;">
										<button class="btn btn-outline-danger btn-sm" type="submit">
											<i class="bi bi-trash"></i>
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="d-flex justify-content-end gap-3 mt-4">
			<a href="${pageContext.request.contextPath}/checkout"
				class="btn btn-checkout px-4"> <i class="bi bi-credit-card"></i>
				Proceed to Checkout
			</a>
		</div>
	</c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%> --%>



