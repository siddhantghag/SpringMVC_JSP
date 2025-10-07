<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* body {
	background-color: #f3f3f3;
	font-family: "Amazon Ember", Arial, sans-serif;
} */
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}
/* Scroll Banner - Amazon style */
.scroll-banner {
	background-color: #232f3e;
	border-radius: 8px;
	padding: 12px 20px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 2rem;
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 600;
	color: #ffa41c;
}

/* Product Card */
.card-cart {
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	margin-bottom: 1.5rem;
}

.card-cart:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}
/* Buttons */
.btn-continue {
	background-color: #ffa41c;
	color: #111;
	font-weight: 600;
}

.btn-continue:hover {
	background-color: #f39c12;
	color: #000;
}
</style>
<h3 class="mb-4 fw-bold">Your Cart</h3>
<c:choose>
	<c:when test="${empty cart}">
		<div class="alert alert-warning d-flex align-items-center"
			role="alert">
			<i class="bi bi-cart-x-fill me-2"></i>
			<div>Your cart is empty.</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row">
			<c:forEach var="entry" items="${cart}">
				<div class="col-md-6 col-lg-4">
					<div class="card card-cart p-3">
						<div class="d-flex align-items-center">
							<div class="me-3" style="width: 80px;">
								<img
									src="${pageContext.request.contextPath}/assets/img/placeholder.png"
									alt="Product" class="img-fluid rounded">
							</div>
							<div class="flex-grow-1">
								<h6 class="fw-bold text-primary mb-2">#${entry.key}</h6>
								<form method="post"
									action="${pageContext.request.contextPath}/cart/remove"
									class="d-flex align-items-center gap-2">
									<input type="hidden" name="productId" value="${entry.key}">
									<input type="number" name="qty" min="0"
										class="form-control form-control-sm" value="${entry.value}"
										style="width: 80px;">
									<button class="btn btn-outline-danger btn-sm" type="submit">
										<i class="bi bi-trash"></i> Remove
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="d-flex justify-content-end gap-2 mt-4">
			<a href="${pageContext.request.contextPath}/products"
				class="btn btn-continue"> <i class="bi bi-arrow-left-circle"></i>
				Continue Shopping
			</a> <a href="${pageContext.request.contextPath}/checkout"
				class="btn btn-success"> <i class="bi bi-credit-card"></i>
				Checkout
			</a>
		</div>
	</c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>