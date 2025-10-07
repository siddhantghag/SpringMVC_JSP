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
/* Scroll Banner - Amazon Style */
.scroll-banner {
	background-color: #232f3e;
	border-radius: 6px;
	padding: 10px 15px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 600;
	color: #ffa41c;
}

/* Product Card */
.product-card {
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	padding: 30px;
	margin-bottom: 30px;
}

.product-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
}

.product-img {
	border-radius: 8px;
	object-fit: cover;
	width: 100%;
	height: 100%;
	border: 1px solid #ddd;
}

.product-name {
	color: #232f3e;
	font-weight: 700;
	font-size: 1.5rem;
}

.product-category {
	color: #555;
	font-size: 0.95rem;
	margin-bottom: 0.75rem;
}

.product-description {
	color: #333;
	font-size: 1rem;
	margin-bottom: 1rem;
}

.product-price {
	color: #B12704;
	font-weight: 700;
	font-size: 1.4rem;
}
/* Add to Cart Form */
.add-cart-form input[type=number] {
	max-width: 100px;
}

.btn-amazon {
	background-color: #ffa41c;
	color: #111;
	font-weight: 600;
}

.btn-amazon:hover {
	background-color: #f39c12;
	color: #000;
}
</style>
<!-- Scroll Banner -->
<!-- <div class="scroll-banner mb-3">
	<div class="scroll-text">
		<span>&#9996; Over 1000 satisfied customers</span> &nbsp; &#9679;
		&nbsp; <span>&#128512; 5000+ products available</span> &nbsp; &#9679;
		&nbsp; <span>&#9200; Fast delivery across India</span> &nbsp; &#9679;
		&nbsp; <span>&#128241; 24*7 support</span>
	</div>
</div> -->
<!-- Product Details Card -->
<div class="product-card row g-4 align-items-center">
	<div class="col-md-5">
		<img class="product-img"
			src="${empty p.imageUrl ? (pageContext.request.contextPath += '/assets/img/placeholder.png') : p.imageUrl}"
			alt="${p.name}">
	</div>
	<div class="col-md-7">
		<h3 class="product-name">${p.name}</h3>
		<p class="product-category">Category: ${p.category.name}</p>
		<p class="product-description">
			<c:out value="${p.description}" />
		</p>
		<p class="product-price">Rs. ${p.price}</p>
		<form method="post"
			action="${pageContext.request.contextPath}/cart/add"
			class="add-cart-form d-flex flex-wrap gap-2 mt-3">
			<input type="hidden" name="productId" value="${p.id}"> <input
				type="number" min="1" value="1" name="qty" class="form-control">
			<button class="btn btn-amazon px-4">
				<i class="bi bi-cart-plus me-1"></i> Add to Cart
			</button>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>


































<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>

<style>
body {
	background: linear-gradient(to right, #e3f2fd, #f1f8e9);
}

.card:hover {
	box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease;
}
.scroll-banner {
  background-color: #ffffffcc;
  border-radius: 50px;
  padding: 10px 20px;
  overflow: hidden;
  box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1);
}

.scroll-text {
  display: inline-block;
  white-space: nowrap;
  animation: scroll-left 20s linear infinite;
  font-weight: 600;
  color: #0d6efd;
}

@keyframes scroll-left {
  0% {
    transform: translateX(100%);
  }
  100% {
    transform: translateX(-100%);
  }
}

</style>
<div class="scroll-banner mb-3">
  <div class="scroll-text">
    <span class="text-primary"> &#9996; Over 1000 satisfied customers</span> &nbsp; &#9679; &nbsp;
    <span class="text-success"> &#128512; 5000+ products available</span> &nbsp; &#9679; &nbsp;
    <span class="text-warning"> &#9200; Fast delivery across India</span> &nbsp; &#9679; &nbsp;
    <span class="text-danger"> &#128241; 24*7 support</span>
  </div>
</div>


<div class="card shadow-sm rounded p-4 mb-4">
	<div class="row g-4">
		<div class="col-md-5">
			<img class="img-fluid rounded border shadow-sm"
				src="${empty p.imageUrl ? (pageContext.request.contextPath += '/assets/img/placeholder.png') : p.imageUrl}"
				alt="${p.name}"
				style="object-fit: cover; height: 100%; width: 100%;">
		</div>

		<div class="col-md-7">
			<h3 class="fw-bold">${p.name}</h3>
			<p class="text-muted mb-2">Category: ${p.category.name}</p>
			<p class="mb-3">
				<c:out value="${p.description}" />
			</p>
			<p class="h5 text-success fw-semibold">Rs. ${p.price}</p>

			<form method="post"
				action="${pageContext.request.contextPath}/cart/add"
				class="d-flex flex-wrap gap-2 mt-3">
				<input type="hidden" name="productId" value="${p.id}"> <input
					type="number" min="1" value="1" name="qty" class="form-control"
					style="max-width: 120px;">
				<button class="btn btn-primary px-4">
					<i class="bi bi-cart-plus me-1"></i> Add to Cart
				</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>
 --%>

