<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<h3 class="mb-3">My Orders</h3>
<table class="table table-striped">
	<thead>
		<tr>
			<th>ID</th>
			<th>Date</th>
			<th>Status</th>
			<th>Total</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="o" items="${orders}">
			<tr>
				<td>${o.id}</td>
				<td>${o.orderDate}</td>
				<td>${o.status}</td>
				<td>Rs. ${o.totalAmount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>
 --%>

<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* body {
	background-color: #f3f3f3;
	font-family: "Amazon Ember", Arial, sans-serif;
}
 */
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}
.orders-container {
	max-width: 1100px;
	margin: 30px auto;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
	padding: 30px;
}

.order-card {
	border: 1px solid #e6e6e6;
	border-radius: 8px;
	margin-bottom: 20px;
	transition: all 0.3s ease;
}

.order-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.order-header {
	background-color: #f0f2f2;
	border-bottom: 1px solid #ddd;
	padding: 10px 15px;
	font-weight: 600;
	color: #111;
	display: flex;
	justify-content: space-between;
}

.order-details {
	padding: 15px 20px;
}

.badge-status {
	font-size: 0.85rem;
	padding: 5px 10px;
	border-radius: 12px;
	text-transform: capitalize;
}

.badge-status.Delivered {
	background-color: #d1f7c4;
	color: #1a7f00;
}

.badge-status.Pending {
	background-color: #fff3cd;
	color: #856404;
}

.badge-status.Cancelled {
	background-color: #f8d7da;
	color: #721c24;
}

.price-tag {
	font-weight: 700;
	color: #b12704;
}

.orders-title {
	font-weight: 700;
	font-size: 1.75rem;
	color: #232f3e;
	margin-bottom: 25px;
	border-bottom: 3px solid #ffa41c;
	display: inline-block;
	padding-bottom: 5px;
}
</style>
<div class="orders-container">
	<h3 class="orders-title">
		<i class="bi bi-box-seam me-2"></i>My Orders
	</h3>
	<c:forEach var="o" items="${orders}">
		<div class="order-card">
			<div class="order-header">
				<span>Order #${o.id}</span> <span>${o.orderDate}</span>
			</div>
			<div class="order-details">
				<div
					class="d-flex justify-content-between align-items-center flex-wrap">
					<div>
						<span class="fw-semibold">Status:</span> <span
							class="badge-status ${o.status}">${o.status}</span>
					</div>
					<div>
						<span class="fw-semibold">Total:</span> <span class="price-tag">${o.totalAmount}</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${empty orders}">
		<div class="text-center py-5">
			<i class="bi bi-emoji-frown display-4 text-muted"></i>
			<h5 class="mt-3">You haven’t placed any orders yet.</h5>
			<a href="${pageContext.request.contextPath}/products"
				class="btn btn-warning mt-2"> <i class="bi bi-cart"></i> Start
				Shopping
			</a>
		</div>
	</c:if>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>