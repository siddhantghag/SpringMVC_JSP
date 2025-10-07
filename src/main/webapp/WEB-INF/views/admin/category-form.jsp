<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* ===== Amazon-Themed Styles ===== */
/* body {
	background: linear-gradient(to right, #f0f3f5, #fafafa);
	font-family: "Segoe UI", Roboto, Arial, sans-serif;
	color: #232f3e;
} */
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}

.amazon-card {
	background: #fff;
	border-radius: 12px;
	border: 1px solid #e3e6e6;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease-in-out;
}

.amazon-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
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

.form-label {
	font-weight: 600;
	color: #232f3e;
}

input.form-control, textarea.form-control {
	border: 1px solid #ccc;
	border-radius: 8px;
	transition: border-color 0.2s, box-shadow 0.2s;
}

input.form-control:focus, textarea.form-control:focus {
	border-color: #febd69;
	box-shadow: 0 0 0 0.15rem rgba(254, 189, 105, 0.4);
}

.page-title {
	color: #232f3e;
	font-weight: 700;
	margin-bottom: 1.5rem;
	text-align: center;
}

.icon-save {
	color: #232f3e;
	font-size: 1.1rem;
}
</style>
<div class="d-flex justify-content-center align-items-center"
	style="min-height: 80vh;">
	<div class="amazon-card p-5 shadow-sm"
		style="width: 100%; max-width: 650px;">
		<h3 class="page-title">${empty category.id ? 'Create' : 'Edit'}
			Category</h3>
		<form method="post"
			action="${pageContext.request.contextPath}/admin/categories/save">
			<input type="hidden" name="id" value="${category.id}">
			<!-- Category Name -->
			<div class="mb-4">
				<label class="form-label">Category Name</label> <input name="name"
					class="form-control" value="${category.name}" required
					placeholder="Enter category name">
			</div>
			<!-- Description -->
			<div class="mb-4">
				<label class="form-label">Description</label>
				<textarea name="description" class="form-control" rows="4"
					placeholder="Enter category description">${category.description}</textarea>
			</div>
			<!-- Save Button -->
			<button class="btn amazon-btn w-100 py-2">
				<i class="bi bi-save icon-save me-2"></i>Save Category
			</button>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%> 