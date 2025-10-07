<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">OMS</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#nav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="nav" class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/products">Products</a></li>
					<sec:authorize access="hasRole('ROLE_CUSTOMER')">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/cart">Cart</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/orders">My Orders</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							data-bs-toggle="dropdown">Admin</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/admin/categories">Categories</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/admin/products">Products</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/admin/orders">Orders</a></li>
							</ul></li>
					</sec:authorize>
				</ul>

				<ul class="navbar-nav ms-auto">
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><span class="navbar-text me-2">
								Hello, <sec:authentication property="name" />
						</span></li>
						<li class="nav-item"><a class="btn btn-outline-light btn-sm"
							href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/auth/login">Login</a></li>
						<li class="nav-item"><a class="btn btn-primary btn-sm"
							href="${pageContext.request.contextPath}/auth/register">Register</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<%@ include file="messages.jsp"%> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>

/* ===== Amazon-like Custom Styling ===== */
.navbar-amazon {
	background-color: #131921 !important;
	color: white;
	font-size: 0.95rem;
}

.navbar-amazon .navbar-brand {
	color: #ff9900 !important;
	font-weight: 700;
	font-size: 1.3rem;
	letter-spacing: 0.5px;
}

.navbar-amazon .nav-link {
	color: #ddd !important;
	margin-right: 0.75rem;
	transition: color 0.2s;
}

.navbar-amazon .nav-link:hover {
	color: #fff !important;
}

.search-bar {
	flex-grow: 1;
	max-width: 500px;
}

.search-bar input {
	border-radius: 0.5rem 0 0 0.5rem;
	border: none;
	box-shadow: none;
}

.search-bar button {
	border-radius: 0 0.5rem 0.5rem 0;
	background-color: #febd69;
	border: none;
	color: #111;
	font-weight: 600;
}

.dropdown-menu {
	border-radius: 0.5rem;
}

.navbar-text {
	color: #febd69 !important;
	font-weight: 500;
}

.btn-outline-light.btn-sm {
	border-color: #febd69;
	color: #febd69;
}

.btn-outline-light.btn-sm:hover {
	background-color: #febd69;
	color: #111;
}

.btn-primary.btn-sm {
	background-color: #febd69;
	border: none;
	color: #111;
	font-weight: 600;
}

.nav-item-custom a {
	margin: 0 10px;
	padding: 5px 10px;
	font-weight: 500;
	color: white !important;
	text-decoration: none !important;
}
</style>
</head>
<body>
	<!-- ===== Amazon-Themed Navbar ===== -->
	<nav class="navbar navbar-expand-lg navbar-amazon mb-4 py-2">
		<div class="container-fluid px-4">
			<!-- Brand -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">OMS</a>
			<!-- Toggle for mobile -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#nav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Search Bar (centered like Amazon) -->
			<form class="d-flex search-bar mx-3">
				<input class="form-control" type="search"
					placeholder="Search products..." aria-label="Search">
				<button class="btn" type="submit">Search</button>
			</form>
			<!-- Menu -->
			<div id="nav" class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav me-auto">

					<sec:authorize access="hasRole('ROLE_CUSTOMER')">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/products">Products</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/cart">Cart</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/orders">My Orders</a></li>
					</sec:authorize>
					<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							data-bs-toggle="dropdown">Admin</a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/admin/categories">Categories</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/admin/products">Products</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/admin/orders">Orders</a></li>
							</ul></li>
					</sec:authorize> --%>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item nav-item-custom"><a
							href="${pageContext.request.contextPath}/admin/categories">Categories</a></li>
						<li class="nav-item nav-item-custom"><a
							href="${pageContext.request.contextPath}/admin/products">Products</a></li>
						<li class="nav-item nav-item-custom"><a
							href="${pageContext.request.contextPath}/admin/orders">Orders</a></li>
						</li>
					</sec:authorize>


				</ul>
				<!-- Right Section -->
				<ul class="navbar-nav ms-auto align-items-center">
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><span class="navbar-text me-3">

								Hello, <sec:authentication property="name" />
						</span></li>
						<li class="nav-item"><a class="btn btn-outline-light btn-sm"
							href="${pageContext.request.contextPath}/auth/logout">Logout</a>
						</li>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/auth/login">Login</a></li>
						<li class="nav-item"><a class="btn btn-primary btn-sm ms-2"
							href="${pageContext.request.contextPath}/auth/register">Register</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Container -->
	<div class="container">
		<%@ include file="messages.jsp"%>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
