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
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	padding: 1.5rem;
	transition: all 0.3s ease;
}

.table-container:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.table thead {
	background-color: #f1f3f4;
	font-weight: 600;
	text-transform: uppercase;
	color: #333;
}

.table-hover tbody tr:hover {
	background-color: #f7fafc;
	transition: background-color 0.25s ease;
}

.status-badge {
	padding: 0.35rem 0.75rem;
	border-radius: 30px;
	font-size: 0.85rem;
	text-transform: capitalize;
}

.status-badge.PLACED {
	background-color: #e8f5e9;
	color: #2e7d32;
}

.status-badge.PAID {
	background-color: #e3f2fd;
	color: #1565c0;
}

.status-badge.SHIPPED {
	background-color: #fff8e1;
	color: #f9a825;
}

.status-badge.CANCELLED {
	background-color: #ffebee;
	color: #c62828;
}

.btn-outline-primary {
	border-color: #232f3e;
	color: #232f3e;
}

.btn-outline-primary:hover {
	background-color: #232f3e;
	color: #fff;
}

select.form-select {
	border-radius: 30px;
	padding: 0.25rem 0.75rem;
}
</style>
<div
	class="page-header d-flex justify-content-between align-items-center mb-4">
	<h3 class="mb-0 fw-bold">
		<i class="bi bi-bag-check-fill me-2"></i> All Orders
	</h3>
	<span class="small opacity-75">Admin Dashboard / Orders</span>
</div>
<div class="table-container">
	<div class="table-responsive">
		<table class="table table-hover align-middle mb-0">
			<thead>
				<tr>
					<th>ID</th>
					<th>Customer</th>
					<th>Date</th>
					<th>Status</th>
					<th>Total</th>
					<th class="text-end">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${orders}">
					<tr>
						<td>${o.id}</td>
						<td class="fw-semibold">${o.customer.username}</td>
						<td><i class="bi bi-calendar3 me-1 text-muted"></i>
							${o.orderDate}</td>
						<td><span class="status-badge ${o.status}">${o.status}</span>
						</td>
						<td class="fw-bold text-success"> ${o.totalAmount}</td>
						<td class="text-end">
							<form method="post"
								action="${pageContext.request.contextPath}/admin/orders/status/${o.id}"
								class="d-flex gap-2 justify-content-end align-items-center">
								<select name="status" class="form-select form-select-sm"
									style="max-width: 150px;">
									<c:forEach var="s"
										items="${fn:split('PLACED,PAID,SHIPPED,CANCELLED', ',')}">
										<option <c:if test="${o.status==s}">selected</c:if>>${s}</option>
									</c:forEach>
								</select>
								<button class="btn btn-sm btn-outline-primary">
									<i class="bi bi-arrow-repeat"></i> Update
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%> 