<c:if test="${not empty success}">
	<div class="alert alert-success">${success}</div>
</c:if>
<c:if test="${not empty error}">
	<div class="alert alert-danger">${error}</div>
</c:if>
