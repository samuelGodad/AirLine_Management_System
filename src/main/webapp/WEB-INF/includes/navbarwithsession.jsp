
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid bg-dark px-0">
    <div class="row gx-0">
        <div class="col-lg-3 bg-dark d-none d-lg-block">
            <a href="${pageContext.request.contextPath}/" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                <h1 class="m-0 text-primary text-uppercase">AirEthiopia</h1>
            </a>
        </div>
        <div class="col-lg-9">
            <div class="row gx-0 bg-white d-none d-lg-flex">
                <div class="col-lg-7 px-5 text-start">
                    <div class="h-100 d-inline-flex align-items-center py-2 me-4">
                        <i class="fa fa-envelope text-primary me-2"></i>
                        <p class="mb-0"></p>
                    </div>
                    <div class="h-100 d-inline-flex align-items-center py-2">
                        <i class="fa fa-phone-alt text-primary me-2"></i>
                        <p class="mb-0">+251980117654</p>
                    </div>
                </div>
                <div class="col-lg-5 px-5 text-end">
                    <div class="d-inline-flex align-items-center py-2">
                        <a class="me-3" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="me-3" href=""><i class="fab fa-twitter"></i></a>
                        <a class="me-3" href=""><i class="fab fa-linkedin-in"></i></a>
                        <a class="me-3" href=""><i class="fab fa-instagram"></i></a>
                        <a class="me-3" href=""><i class="fab fa-youtube"></i></a>
                        <% if (session.getAttribute("loginUser") != null) { %>
                        <a class="" href="#" data-bs-toggle="modal" data-bs-target="#profileModal"><i class="fas fa-user"></i></a>
                        <% } %>

                    </div>
                    <jsp:include page="model.jsp"/>

                </div>

            </div>
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
                <a href="${pageContext.request.contextPath}/" class="navbar-brand d-block d-lg-none">
                    <h1 class="m-0 text-primary text-uppercase">AIREthiopia</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">Home</a>
                        <a href="user_about" class="nav-item nav-link">About</a>
                        <a href="availability_from_user_booking" class="nav-item nav-link">Check Availability</a>
                        <a href="booking" class="nav-item nav-link active">Booking</a>
                        <a href="booking_search" class="nav-item nav-link active">search bookings</a>
                        <a href="Cancellation" class="nav-item nav-link">Cancellation</a>
                        <a href="contact_user" class="nav-item nav-link">Contact</a>
                    </div>

                    <% if (session.getAttribute("loginUser") == null) { %>
                    <%-- If loginUser is null, display the "Admin Panel" link --%>
                    <a href="admin_login" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block">Admin Panel<i class="fa fa-arrow-right ms-3"></i></a>
                    <% } else { %>
                    <%-- If loginUser is not null, display the "LogOut As" link --%>
                    <a href="logout_servlet" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block">LogOut As<small>
                        ${sessionScope.loginUser.getUserName()}
                    </small><i class="fa fa-arrow-right ms-3"></i></a>
                    <% } %>
                </div>

            </nav>
        </div>
    </div>
</div>
