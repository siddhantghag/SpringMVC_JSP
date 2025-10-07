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

.form-container {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	padding: 2rem 2.5rem;
	transition: all 0.3s ease;
	width: 100%;
	max-width: 850px;
}

.form-container:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

label.form-label {
	font-weight: 600;
	color: #333;
}

input.form-control, select.form-select, textarea.form-control {
	border-radius: 12px;
	border: 1px solid #ddd;
	transition: all 0.3s ease;
}

input.form-control:focus, select.form-select:focus, textarea.form-control:focus
	{
	border-color: #232f3e;
	box-shadow: 0 0 0 0.15rem rgba(35, 47, 62, 0.25);
}

.btn-success {
	background-color: #232f3e;
	border: none;
	border-radius: 30px;
	padding: 0.75rem;
	font-weight: 600;
}

.btn-success:hover {
	background-color: #37475a;
}

.card-header-icon {
	font-size: 1.5rem;
	vertical-align: middle;
}
</style>
<div
	class="page-header mb-4 d-flex align-items-center justify-content-between">
	<h3 class="fw-bold mb-0">
		<i class="bi bi-box-seam me-2 card-header-icon"></i> ${empty product.id ? 'Create' : 'Edit'}
		Product
	</h3>
	<span class="small opacity-75">Admin Dashboard / Products</span>
</div>
<div class="d-flex justify-content-center align-items-center"
	style="min-height: 75vh;">
	<div class="form-container">
		<form method="post"
			action="${pageContext.request.contextPath}/admin/products/save">
			<input type="hidden" name="id" value="${product.id}">
			<div class="row g-4">
				<div class="col-md-6">
					<label class="form-label">Name</label> <input name="name"
						class="form-control" value="${product.name}" required
						placeholder="Enter product name">
				</div>
				<div class="col-md-3">
					<label class="form-label">Price</label> <input name="price"
						type="number" step="0.01" class="form-control"
						value="${product.price}" required placeholder="0.00">
				</div>
				<div class="col-md-3">
					<label class="form-label">Stock</label> <input name="stockQuantity"
						type="number" class="form-control"
						value="${product.stockQuantity}" required placeholder="Quantity">
				</div>
				<div class="col-md-6">
					<label class="form-label">Category</label> <select
						name="categoryId" class="form-select">
						<c:forEach var="c" items="${categories}">
							<option value="${c.id}"
								<c:if test="${product.category != null && product.category.id == c.id}">selected</c:if>>
								${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-6">
					<label class="form-label">Image URL</label> <input name="imageUrl"
						class="form-control" value="${product.imageUrl}"
						placeholder="https://example.com/image.jpg">
				</div>
				<div class="col-12">
					<label class="form-label">Description</label>
					<textarea name="description" class="form-control" rows="4"
						placeholder="Enter product description">${product.description}</textarea>
				</div>
			</div>
			<button class="btn btn-success w-100 mt-4">
				<i class="bi bi-save me-2"></i> Save Product
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
</style>

<div class="d-flex justify-content-center align-items-center"
	style="min-height: 80vh;">
	<div class="card shadow-sm p-4 rounded"
		style="width: 100%; max-width: 800px;">
		<h3 class="mb-4 fw-bold text-success text-center">${empty product.id ? 'Create' : 'Edit'}
			Product</h3>
		<form method="post"
			action="${pageContext.request.contextPath}/admin/products/save">
			<input type="hidden" name="id" value="${product.id}">
			<div class="row g-3">
				<div class="col-md-6">
					<label class="form-label">Name</label> <input name="name"
						class="form-control" value="${product.name}" required
						placeholder="Enter product name">
				</div>
				<div class="col-md-3">
					<label class="form-label">Price</label> <input name="price"
						type="number" step="0.01" class="form-control"
						value="${product.price}" required placeholder="0.00">
				</div>
				<div class="col-md-3">
					<label class="form-label">Stock</label> <input name="stockQuantity"
						type="number" class="form-control"
						value="${product.stockQuantity}" required placeholder="Quantity">
				</div>
				<div class="col-md-6">
					<label class="form-label">Category</label> <select
						name="categoryId" class="form-select">
						<c:forEach var="c" items="${categories}">
							<option value="${c.id}"
								<c:if test="${product.category != null && product.category.id == c.id}">selected</c:if>>${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-6">
					<label class="form-label">Image URL</label> <input name="imageUrl"
						class="form-control" value="${product.imageUrl}"
						placeholder="https://example.com/image.jpg">
				</div>
				<div class="col-12">
					<label class="form-label">Description</label>
					<textarea name="description" class="form-control" rows="4"
						placeholder="Enter product description">${product.description}</textarea>
				</div>
			</div>
			<button class="btn btn-success w-100 mt-4">
				<i class="bi bi-save me-1"></i> Save
			</button>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/_layout/footer.jsp"%> --%>
 
