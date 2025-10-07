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
	border-radius: 6px;
	padding: 10px 15px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 1.5rem;
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
	overflow: hidden;
}

.product-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
}

.product-img {
	width: 100%;
	height: 220px;
	object-fit: cover;
	border-bottom: 1px solid #ddd;
}

.product-title {
	font-weight: 700;
	color: #232f3e;
	font-size: 1rem;
	margin-bottom: 0.25rem;
}

.product-price {
	color: #B12704;
	font-weight: 700;
	margin-bottom: 0.5rem;
}

.btn-amazon {
	background-color: #ffa41c;
	color: #111;
	font-weight: 600;
	width: 100%;
}

.btn-amazon:hover {
	background-color: #f39c12;
	color: #000;
}
/* Search and Filter */
.form-control, .form-select {
	border-radius: 6px;
	height: 42px;
}
</style>
<!-- Scroll Banner -->
<!-- <div class="scroll-banner">
	<div class="scroll-text">
		<span>&#9996; Over 1000 satisfied customers</span> &nbsp; &#9679;
		&nbsp; <span>&#128512; 5000+ products available</span> &nbsp; &#9679;
		&nbsp; <span>&#9200; Fast delivery across India</span> &nbsp; &#9679;
		&nbsp; <span>&#128241; 24*7 support</span>
	</div>
</div> -->
<!-- Search / Filter Form -->
<form class="row g-2 mb-4">
	<div class="col-md-4">
		<input class="form-control" name="q" value="${q}"
			placeholder="Search Products...">
	</div>
	<div class="col-md-3">
		<select name="category" class="form-select">
			<option value="">All Categories</option>
			<c:forEach var="c" items="${categories}">
				<option value="${c.id}"
					<c:if test="${categoryId == c.id}">selected</c:if>>${c.name}</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-md-2">
		<button class="btn btn-outline-primary w-100">Filter</button>
	</div>
</form>
<!-- Product Listing -->
<div class="row g-3">
	<c:forEach var="p" items="${products}">
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="product-card h-100 d-flex flex-column">
				<img class="product-img"
					src="${empty p.imageUrl ? (pageContext.request.contextPath += '/assets/img/placeholder.png') : p.imageUrl}"
					alt="${p.name}">
				<div class="p-3 flex-grow-1 d-flex flex-column">
					<h6 class="product-title">${p.name}</h6>
					<p class="product-price">Rs. ${p.price}</p>
					<a class="btn btn-amazon mt-auto"
						href="${pageContext.request.contextPath}/products/${p.id}"> <i
						class="bi bi-eye me-1"></i> View
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>









































<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
body {
	background: linear-gradient(to right, #e3f2fd, #f1f8e9);
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


<h3 class="mb-3">Products</h3>

<form class="row g-2 mb-3">
	<div class="col-md-4">
		<input class="form-control" name="q" value="${q}"
			placeholder="Search name/description...">
	</div>
	<div class="col-md-3">
		<select name="category" class="form-select">
			<option value="">All Categories</option>
			<c:forEach var="c" items="${categories}">
				<option value="${c.id}"
					<c:if test="${categoryId == c.id}">selected</c:if>>${c.name}</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-md-2">
		<button class="btn btn-outline-primary w-100">Filter</button>
	</div>
</form>

<style>
.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
	transition: all 0.3s ease;
}

.card-img-top {
	border-radius: 0.5rem;
	object-fit: cover;
	height: 200px;
}

.btn-primary:hover {
	background-color: #0b5ed7;
	border-color: #0a58ca;
}
</style>

<div class="row">
	<c:forEach var="p" items="${products}">
		<div class="col-md-3 mb-3">
			<div class="card h-100">
				<img class="card-img-top"
					src="${empty p.imageUrl ? (pageContext.request.contextPath += '/assets/img/placeholder.png') : p.imageUrl}"
					alt="${p.name}">
				<div class="card-body">
					<h6 class="card-title">${p.name}</h6>
					<p class="text-muted mb-2">Rs. ${p.price}</p>
					<a class="btn btn-sm btn-primary stretched-link"
						href="${pageContext.request.contextPath}/products/${p.id}">View</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>
 --%>
