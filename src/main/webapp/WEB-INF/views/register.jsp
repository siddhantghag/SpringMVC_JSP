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
/* .scroll-banner {
	background-color: #232f3e;
	border-radius: 8px;
	padding: 12px 20px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 2rem;
} */

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 600;
	color: #ffa41c;
}

/* Card */
.card-amazon {
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card-amazon:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}

/* Form Elements */
.form-control, .form-label {
	border-radius: 6px;
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

/* Headings */
h3 {
	color: #232f3e;
}
</style>
<!-- Scroll Banner -->
<!-- <div class="scroll-banner mb-4">
	<div class="scroll-text">
		<span>&#9996; Over 1000 satisfied customers</span> &nbsp; &#9679;
		&nbsp; <span>&#128512; 5000+ products available</span> &nbsp; &#9679;
		&nbsp; <span>&#9200; Fast delivery across India</span> &nbsp; &#9679;
		&nbsp; <span>&#128241; 24*7 support</span>
	</div>
</div> -->
<!-- Registration Form -->
<div class="d-flex justify-content-center align-items-center"
	style="min-height: 70vh;">
	<div class="card card-amazon shadow-sm p-4"
		style="width: 100%; max-width: 480px;">
		<h3 class="mb-4 text-center fw-bold">Register</h3>
		<form method="post"
			action="${pageContext.request.contextPath}/auth/register">
			<div class="mb-3">
				<label class="form-label">Username</label> <input name="username"
					class="form-control" required placeholder="Choose a username">
			</div>
			<div class="mb-3">
				<label class="form-label">Password</label> <input name="password"
					type="password" class="form-control" required minlength="4"
					placeholder="Create a password">
				<!-- <div class="form-text">Minimum 4 characters</div> -->
			</div>
			<button class="btn btn-amazon w-100">
				<i class="bi bi-person-plus-fill me-1"></i> Create account
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


<div class="d-flex justify-content-center align-items-center"
	style="min-height: 70vh;">
	<div class="card shadow-sm p-4 rounded"
		style="width: 100%; max-width: 450px;">
		<h3 class="mb-4 text-center fw-bold">Register</h3>
		<form method="post"
			action="${pageContext.request.contextPath}/auth/register">
			<div class="mb-3">
				<label class="form-label">Username</label> <input name="username"
					class="form-control" required placeholder="Choose a username">
			</div>
			<div class="mb-3">
				<label class="form-label">Password</label> <input name="password"
					type="password" class="form-control" required minlength="4"
					placeholder="Create a password">
				<div class="form-text">Minimum 4 characters</div>
			</div>
			<button class="btn btn-primary w-100">
				<i class="bi bi-person-plus-fill me-1"></i> Create account
			</button>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>
 --%>

