<%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
/* Amazon-like modern theme */
/* body {
	background-color: #f5f5f5;
	font-family: "Amazon Ember", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
} */
body {
	background: linear-gradient(to bottom right, #f3f3f3, #e7f0d9);
	font-family: "Amazon Ember", Arial, sans-serif;
}
/* Scrolling banner */
.scroll-banner {
	background: linear-gradient(90deg, #232f3e, #37475a);
	border-radius: 6px;
	padding: 10px 15px;
	overflow: hidden;
	color: #fff;
	margin-bottom: 1rem;
}

.scroll-text {
	display: inline-block;
	white-space: nowrap;
	animation: scroll-left 20s linear infinite;
	font-weight: 500;
	color: #febd69;
}

/* Category section styling */
h1 {
	font-weight: 700;
	color: #232f3e;
}

.text-muted {
	color: #555 !important;
}
/* Category cards */
.card {
	border: none;
	border-radius: 10px;
	background: #fff;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	height: 100%;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.12);
}

.card-body {
	text-align: center;
	padding: 1.5rem 1rem;
}

.card-title {
	font-size: 1.2rem;
	font-weight: 600;
	color: #111;
}

.card-text {
	font-size: 0.9rem;
	color: #555;
	min-height: 50px;
}

.btn-outline-primary {
	border-radius: 25px;
	border-color: #232f3e;
	color: #232f3e;
	transition: all 0.3s;
}

.btn-outline-primary:hover {
	background-color: #febd69;
	color: #111;
	border-color: #febd69;
}
/* Category grid styling */
.category-section {
	margin-top: 2rem;
}

.category-section .col-md-3 {
	display: flex;
	align-items: stretch;
}

.category-section .card {
	flex: 1;
}
/* Subtle background tones */
.bg-primary-subtle {
	background-color: #e3f2fd !important;
}

.bg-success-subtle {
	background-color: #e8f5e9 !important;
}

.bg-warning-subtle {
	background-color: #fff8e1 !important;
}

.category-section .card:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
}


</style>
<!-- Amazon-style scrolling banner -->
<!-- <div class="scroll-banner mb-4">
	<div class="scroll-text">🌟 Over 1000 satisfied customers &nbsp;
		• &nbsp; 🛍️ 5000+ products available &nbsp; • &nbsp; ⚡ Fast delivery
		across India &nbsp; • &nbsp; ☎️ 24×7 Support</div>
</div> -->
<!-- Welcome heading -->
<div class="text-center mb-5">
	<h1>Welcome to OMS</h1>
	<p class="text-muted fs-5">Explore categories tailored just for you</p>
</div>
<!-- Category grid -->
<%-- <div class="row category-section g-4">
	<c:forEach var="c" items="${categories}" varStatus="loop">
		<div class="col-md-3 col-sm-6">
			<div
				class="card
<c:choose>
<c:when test='${loop.index % 3 == 0}'>bg-primary-subtle</c:when>
<c:when test='${loop.index % 3 == 1}'>bg-success-subtle</c:when>
<c:otherwise>bg-warning-subtle</c:otherwise>
</c:choose>
       ">
				<div class="card-body">
					<div class="mb-3">
						<i class="bi bi-box-seam fs-1 text-warning"></i>
					</div>
					<h5 class="card-title">${c.name}</h5>
					<p class="card-text">
						<c:out value="${c.description}" />
					</p>
					<a class="btn btn-sm btn-outline-primary"
						href="${pageContext.request.contextPath}/products?category=${c.id}">
						<i class="bi bi-eye"></i> View Products
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div> --%>

<div class="row category-section g-4">
    <c:forEach var="c" items="${categories}" varStatus="loop">
        <div class="col-md-3 col-sm-6">
            <div class="card h-100 border-0 shadow-sm rounded-4"
                 style="background-color: #fdfdfd; transition: transform 0.3s ease;"
                 onmouseover="this.style.transform='scale(1.02)'"
                 onmouseout="this.style.transform='scale(1)'">
                
                <div class="card-body d-flex flex-column justify-content-between p-4">
                    
                    <div class="text-center mb-3">
                        <i class="bi bi-box-seam fs-1 text-primary"></i>
                    </div>
                    
                    <h5 class="card-title text-center fw-semibold text-dark">${c.name}</h5>
                    
                    <p class="card-text text-muted small text-center">
                        <c:out value="${c.description}" />
                    </p>
                    
                    <div class="text-center mt-auto">
                    <a class="btn btn-sm btn-outline-primary"
						href="${pageContext.request.contextPath}/products?category=${c.id}">
						<i class="bi bi-eye"></i> View Products
					</a>
                    </div>
                    
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>





































<%-- <%@ include file="/WEB-INF/views/_layout/header.jsp"%>
<style>
body {
	background: linear-gradient(to right, #e3f2fd, #f1f8e9);
}
</style>
<style>
body {
	background: linear-gradient(to right, #e3f2fd, #f1f8e9);
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.15);
	transition: all 0.3s ease;
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


<h1 class="mb-3">Welcome to OMS</h1>
<p class="text-muted">Browse our categories:</p>
<div class="row">
	<c:forEach var="c" items="${categories}" varStatus="loop">
		<div class="col-md-3 mb-3">
			<div
				class="card h-100 
         <c:choose>
           <c:when test="${loop.index % 3 == 0}">bg-primary-subtle</c:when>
           <c:when test="${loop.index % 3 == 1}">bg-success-subtle</c:when>
           <c:otherwise>bg-warning-subtle</c:otherwise>
         </c:choose>
         border-0 shadow-sm">
				<div class="card-body">
					<h5 class="card-title">${c.name}</h5>
					<p class="card-text">
						<c:out value="${c.description}" />
					</p>
					<a class="btn btn-sm btn-outline-primary"
						href="${pageContext.request.contextPath}/products?category=${c.id}">View</a>
				</div>
			</div>
		</div>
	</c:forEach>

</div>
<%@ include file="/WEB-INF/views/_layout/footer.jsp"%>
 --%>
