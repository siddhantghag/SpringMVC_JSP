<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* Amazon-inspired design */
body {
	/* background-color: #f2f2f2;
	font-family: "Amazon Ember", Arial, sans-serif; */
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}
/* Scroll banner (kept as-is but recolored for theme) */
.scroll-banner {
	background: linear-gradient(90deg, #232f3e, #37475a);
	border-radius: 6px;
	padding: 10px 15px;
	overflow: hidden;
	color: #fff;
	margin-bottom: 2rem;
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 500;
	color: #febd69;
}


/* Login container */
.login-container {
	flex-grow: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2rem 1rem;
}

.login-card {
	width: 100%;
	max-width: 380px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	padding: 2rem;
}

.login-header {
	text-align: center;
	margin-bottom: 1.5rem;
}

.login-header img {
	width: 120px;
	margin-bottom: 1rem;
}

.login-header h3 {
	font-weight: 600;
	color: #111;
}
/* Input fields */
.form-label {
	font-weight: 600;
	color: #111;
}

.form-control {
	border-radius: 6px;
	border: 1px solid #a6a6a6;
}

.form-control:focus {
	border-color: #febd69;
	box-shadow: 0 0 0 0.2rem rgba(254, 189, 105, 0.25);
}
/* Buttons */
.btn-login {
	background-color: #febd69;
	border: 1px solid #a88734;
	color: #111;
	font-weight: 600;
	border-radius: 6px;
}

.btn-login:hover {
	background-color: #f3a847;
	border-color: #9c7e31;
}
/* Links and footer */
.login-footer {
	text-align: center;
	margin-top: 1rem;
	font-size: 0.9rem;
}

.login-footer a {
	color: #0066c0;
	text-decoration: none;
}

.login-footer a:hover {
	text-decoration: underline;
}

.amazon-footer {
	background-color: #232f3e;
	color: #fff;
	text-align: center;
	padding: 1rem 0;
	margin-top: 2rem;
	font-size: 0.9rem;
}
</style>
<!-- Scrolling banner -->
<!-- <div class="scroll-banner mb-3">
	<div class="scroll-text">🌟 Over 1000 satisfied customers • 🛍️
		5000+ products available • ⚡ Fast delivery across India • ☎️ 24×7
		Support</div>
</div> -->
<!-- Login Section -->
<div class="login-container">
	<div class="login-card">
		<div class="login-header">
			<!-- <img
				src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg"
				alt="Amazon Logo"> -->
			<h3>Sign-In</h3>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/auth/login">
			<div class="mb-3">
				<label class="form-label">Username</label> <input name="username"
					class="form-control" required placeholder="Enter your username">
			</div>
			<div class="mb-3">
				<label class="form-label">Password</label> <input name="password"
					type="password" class="form-control" required
					placeholder="Enter your password">
			</div>
			<button class="btn btn-login w-100 mb-3">
				<i class="bi bi-box-arrow-in-right me-1"></i> Login
			</button>
			<div class="login-footer">
				<p>
					By continuing, you agree OMS's <a href="#">Terms of Use</a> and
					<a href="#">Privacy Notice</a>.
				</p>
				<hr>
				<p>New to OMS?</p>
				<a href="${pageContext.request.contextPath}/auth/register"
					class="btn btn-outline-secondary w-100">Create your OMS account</a>
			</div>
		</form>
	</div>
</div>
<!-- Amazon-style footer -->
<div class="amazon-footer"> 2025 OMS Store | Inspired by Amazon
	Design | Built with using Bootstrap 5</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>



















<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
body {
	background: linear-gradient(to right, #e3f2fd, #f1f8e9);
}.scroll-banner {
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
		style="width: 100%; max-width: 400px;">
		<h3 class="mb-4 text-center fw-bold">Login</h3>
		<form method="post"
			action="${pageContext.request.contextPath}/auth/login">
			<div class="mb-3">
				<label class="form-label">Username</label> <input name="username"
					class="form-control" required placeholder="Enter your username">
			</div>
			<div class="mb-3">
				<label class="form-label">Password</label> <input name="password"
					type="password" class="form-control" required
					placeholder="Enter your password">
			</div>
			<button class="btn btn-primary w-100">
				<i class="bi bi-box-arrow-in-right me-1"></i> Login
			</button>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>
 --%>

