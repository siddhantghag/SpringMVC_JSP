<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* ===== Amazon-Themed Styles ===== */
/* body {
	background: linear-gradient(to right, #f0f3f5, #fafafa);
	font-family: "Segoe UI", Roboto, Arial, sans-serif;
	color: #232f3e;
}
 */body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}

.page-header {
	background: #232f3e;
	color: #fff;
	padding: 1rem 1.5rem;
	border-radius: 12px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.page-header h3 {
	font-weight: 700;
	margin: 0;
}

.amazon-btn {
	background-color: #febd69;
	color: #111;
	border: none;
	font-weight: 600;
	transition: all 0.3s ease;
}

.amazon-btn:hover {
	background-color: #f3a847;
	color: #111;
}

.table-container {
	background: #fff;
	border-radius: 12px;
	padding: 1.5rem;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease-in-out;
}

.table-container:hover {
	box-shadow: 0 6px 25px rgba(0, 0, 0, 0.12);
}

.table {
	border-collapse: separate;
	border-spacing: 0 0.5rem;
}

.table thead {
	background-color: #232f3e;
	color: #fff;
	border-radius: 12px;
}

.table tbody tr {
	background-color: #fff;
	border-radius: 8px;
	transition: background-color 0.3s ease, transform 0.2s;
}

.table tbody tr:hover {
	background-color: #f7fafa;
	transform: scale(1.005);
}

.table th, .table td {
	vertical-align: middle;
	padding: 1rem;
}

.table-striped-custom tbody tr:nth-child(odd) {
	background-color: #f9fbfc;
}

.btn-outline-secondary {
	color: #232f3e;
	border-color: #dcdcdc;
	transition: all 0.2s ease;
}

.btn-outline-secondary:hover {
	background-color: #f0f2f2;
	color: #111;
}

.btn-outline-danger {
	border-color: #ffbdbd;
	color: #b12704;
	transition: all 0.2s ease;
}

.btn-outline-danger:hover {
	background-color: #ffe1e1;
	color: #b12704;
	border-color: #ffbdbd;
}
</style>
<!-- ===== Amazon-Themed Header ===== -->
<div
	class="d-flex justify-content-between align-items-center mb-4 page-header">
	<h3>Categories</h3>
	<a class="btn amazon-btn"
		href="${pageContext.request.contextPath}/admin/categories/create">
		<i class="bi bi-plus-circle me-1"></i> New Category
	</a>
</div>
<!-- ===== Table Container ===== -->
<div class="table-responsive table-container">
	<table class="table table-hover table-striped-custom align-middle mb-0">
		<thead>
			<tr>
				<!-- <th style="width: 10%">ID</th> -->
				<th style="width: 25%">Name</th>
				<th style="width: 45%">Description</th>
				<th class="text-end" style="width: 20%">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${categories}">
				<tr>
					<%-- <td>${c.id}</td> --%>
					<td class="fw-semibold">${c.name}</td>
					<td>${c.description}</td>
					<td class="text-end"><a
						class="btn btn-sm btn-outline-secondary me-2"
						href="${pageContext.request.contextPath}/admin/categories/edit/${c.id}">
							<i class="bi bi-pencil"></i> Edit
					</a>
						<form method="post"
							action="${pageContext.request.contextPath}/admin/categories/delete/${c.id}"
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
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>