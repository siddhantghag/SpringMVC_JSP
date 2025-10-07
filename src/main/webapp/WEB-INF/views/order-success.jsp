<%@ include file="/WEB-INF/views/_layout/header.jsp"%>

<style>
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}


.confetti-container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	overflow: hidden;
	pointer-events: none;
	z-index: 1050;
}

.confetti {
	position: absolute;
	width: 10px;
	height: 10px;
	background-color: #febd69;
	border-radius: 50%;
	animation: confetti-fall 3s linear infinite;
}

@
keyframes confetti-fall { 0% {
	transform: translateY(0) rotate(0deg);
	opacity: 1;
}

100
%
{
transform
:
translateY(
100vh
)
rotate(
720deg
);
opacity
:
0;
}
}


.scroll-banner {
	background-color: #232f3e;
	border-radius: 50px;
	padding: 10px 20px;
	overflow: hidden;
	box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1);
	margin-bottom: 25px;
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 600;
	color: #febd69;
}

.success-card {
	max-width: 600px;
	margin: 60px auto;
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.1);
	padding: 40px 30px;
	text-align: center;
}

.success-icon {
	font-size: 4rem;
	color: #00a650;
	background-color: #e8f5e9;
	padding: 20px;
	border-radius: 50%;
	display: inline-block;
}

.success-title {
	font-weight: 700;
	color: #232f3e;
	margin-top: 20px;
}

.success-subtext {
	color: #6c757d;
	font-size: 1.1rem;
	margin-bottom: 30px;
}

.btn-amazon {
	background-color: #febd69;
	border: none;
	color: #111;
	font-weight: 600;
}

.btn-amazon:hover {
	background-color: #f3a847;
	color: #111;
}

.btn-outline-amazon {
	border: 2px solid #232f3e;
	color: #232f3e;
	font-weight: 600;
}

.btn-outline-amazon:hover {
	background-color: #232f3e;
	color: #fff;
}
</style>
<div class="container">
	<div class="scroll-banner text-center">
		<span class="scroll-text">Thank you for shopping with us! *
			Fast Delivery Guaranteed * Track your orders anytime * 24/7 Support </span>
	</div>
	<div class="success-card">
		<div class="success-icon">
			<i class="bi bi-check-circle-fill"></i>
		</div>
		<h3 class="success-title">Order Placed Successfully!</h3>
		<p class="success-subtext">Order confirmed! We're working on
			getting it to you as soon as possible.</p>
		<div class="d-flex justify-content-center gap-3 mt-4 flex-wrap">
			<a class="btn btn-outline-amazon btn-lg px-4"
				href="${pageContext.request.contextPath}/orders"> <i
				class="bi bi-box-seam me-2"></i> View My Orders
			</a> <a href="${pageContext.request.contextPath}/products"
				class="btn btn-amazon btn-lg px-4"> <i
				class="bi bi-cart-plus me-2"></i> Continue Shopping
			</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>



























<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>

<!-- Confetti Animation -->
<style>
.confetti-container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh; /* Full viewport height */
	overflow: hidden;
	pointer-events: none;
	z-index: 1050;
}

.confetti {
	position: absolute;
	width: 10px;
	height: 10px;
	background-color: #ffc107;
	border-radius: 50%;
	animation: confetti-fall 3s linear infinite;
}

@keyframes confetti-fall {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 1;
  }
  100% {
    transform: translateY(100vh) rotate(360deg);
    opacity: 0;
  }
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
<div class="text-center py-5">
	<i class="bi bi-check-circle-fill text-success"
		style="font-size: 4rem;"></i>
	<h3 class="mt-3 fw-bold text-success">Order placed successfully!</h3>
	<p class="lead text-muted">Order confirmed! We're working on getting it to you as soon as possible.</p>

	<div class="d-flex justify-content-center gap-3 mt-4">
		<a class="btn btn-outline-success btn-lg"
			href="${pageContext.request.contextPath}/orders"> <i
			class="bi bi-box-seam"></i> View my orders
		</a> <a href="${pageContext.request.contextPath}/products"
			class="btn btn-success btn-lg"> <i class="bi bi-cart-plus"></i>
			Continue Shopping
		</a>
	</div>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>


 --%>

