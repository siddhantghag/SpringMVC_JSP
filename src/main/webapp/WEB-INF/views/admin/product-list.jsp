<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* body {
	background: linear-gradient(to right, #fefefe, #f3f4f6);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
} */
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}

.page-header {
	background-color: #232f3e;
	color: #fff;
	padding: 1rem 1.5rem;
	border-radius: 0.5rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.table-container {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
	padding: 1.5rem;
	transition: all 0.3s ease;
}

.table-container:hover {
	transform: translateY(-2px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
}

.table-hover tbody tr:hover {
	background-color: #f3f6fa;
	transition: background-color 0.3s ease;
}

.table-striped-custom tbody tr:nth-child(odd) {
	background-color: #fcfcfd;
}

.table-striped-custom tbody tr:nth-child(even) {
	background-color: #f6f8fa;
}

.table th {
	background-color: #f1f3f4;
	color: #232f3e;
	font-weight: 600;
}

.btn-primary {
	background-color: #232f3e;
	border: none;
	border-radius: 30px;
	padding: 0.6rem 1.2rem;
	font-weight: 600;
}

.btn-primary:hover {
	background-color: #37475a;
}

.btn-outline-secondary:hover {
	color: #fff;
	background-color: #37475a;
	border-color: #37475a;
}

.btn-outline-danger:hover {
	color: #fff;
	background-color: #b12704;
	border-color: #b12704;
}
</style>
<div
	class="page-header mb-4 d-flex align-items-center justify-content-between">
	<h3 class="fw-bold mb-0">
		<i class="bi bi-boxes me-2"></i> Products
	</h3>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/admin/products/create"> <i
		class="bi bi-plus-circle me-1"></i> New Product
	</a>
</div>
<div class="table-container">
	<div class="table-responsive">
		<table
			class="table table-hover table-striped-custom align-middle mb-0">
			<thead class="table-light">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Stock</th>
					<th class="text-end">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${products}">
					<tr>
						<td>${p.id}</td>
						<td>${p.name}</td>
						<td>${p.category.name}</td>
						<td>${p.price}</td>
						<td>${p.stockQuantity}</td>
						<td class="text-end"><a
							class="btn btn-sm btn-outline-secondary me-1"
							href="${pageContext.request.contextPath}/admin/products/edit/${p.id}">
								<i class="bi bi-pencil"></i> Edit
						</a>
							<form method="post"
								action="${pageContext.request.contextPath}/admin/products/delete/${p.id}"
								class="d-inline">
								<button class="btn btn-sm btn-outline-danger">
									<i class="bi bi-trash"></i> Delete
								</button>
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%> 


































<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>

<style>
body {
	background: linear-gradient(to right, #e3f2fd, #f1f8e9);
}

.table-hover tbody tr:hover {
	background-color: #f1f8e9;
	transition: background-color 0.3s ease;
}

.table-striped-custom tbody tr:nth-child(odd) {
	background-color: #f8f9fa;
}

.table-striped-custom tbody tr:nth-child(even) {
	background-color: #e9f5ff;
}
</style>

<div class="d-flex justify-content-between align-items-center mb-4">
	<h3 class="fw-bold">Products</h3>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/admin/products/create"> <i
		class="bi bi-plus-circle me-1"></i> New Product
	</a>
</div>

<div class="table-responsive shadow-sm rounded">
	<table class="table table-hover table-striped-custom align-middle mb-0">
		<thead class="table-light">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Stock</th>
				<th class="text-end">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${products}">
				<tr>
					<td>${p.id}</td>
					<td>${p.name}</td>
					<td>${p.category.name}</td>
					<td>Rs. ${p.price}</td>
					<td>${p.stockQuantity}</td>
					<td class="text-end"><a
						class="btn btn-sm btn-outline-secondary me-1"
						href="${pageContext.request.contextPath}/admin/products/edit/${p.id}">
							<i class="bi bi-pencil"></i> Edit
					</a>
						<form method="post"
							action="${pageContext.request.contextPath}/admin/products/delete/${p.id}"
							class="d-inline">
							<button class="btn btn-sm btn-outline-danger">
								<i class="bi bi-trash"></i> Delete
							</button>
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%> --%>
 
 
