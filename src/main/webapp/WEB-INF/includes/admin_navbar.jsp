<%--
  Created by IntelliJ IDEA.
  User: Sami
  Date: 1/1/2024
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
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
                        <p class="mb-0">godadsamuel@gmail.com</p>
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
                        <a class="" href=""><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
                <a href="${pageContext.request.contextPath}/" class="navbar-brand d-block d-lg-none">
                    <h1 class="m-0 text-primary text-uppercase">AirEthiopia</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="admin_login_pass" class="nav-item nav-link">Home</a>
                        <a href="addflights" class="nav-item nav-link"><small>Add Flights</small></a>
                        <a href="availability_from_admin" class="nav-item nav-link"><small>Search Flights</small></a>
                        <a href="coupon_add" class="nav-item nav-link"><small>Add Coupon</small></a>
                        <a href="coupon_search" class="nav-item nav-link active"><small>Search Coupon</small></a>
                        <a href="coupon_search?fromDeleteCoupon=true" class="nav-item nav-link"><small>Delete Coupon</small></a>
<%--                        <a href="coupon_delete" class="nav-item nav-link"><small>Delete Coupon</small></a>--%>
                    </div>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block"><small>LogOut As</small><b>
                        <%  String A_name=(String)session.getAttribute("admin_name");
                            out.print(A_name);
                        %></b>
                        <i class="fa fa-arrow-right ms-3"></i></a>
                </div>
            </nav>
        </div>
    </div>
</div>
