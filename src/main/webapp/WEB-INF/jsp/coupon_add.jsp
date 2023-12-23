<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>AirLine Reservation System - Admin Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="../includes/header_css_links.jsp"/>

</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Header Start -->
        <div class="container-fluid bg-dark px-0">
            <div class="row gx-0">
                <div class="col-lg-3 bg-dark d-none d-lg-block">
                    <a href="../../index.jsp" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                        <h1 class="m-0 text-primary text-uppercase">AirReserve</h1>
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
                        <a href="../../index.jsp" class="navbar-brand d-block d-lg-none">
                            <h1 class="m-0 text-primary text-uppercase">AirReserve</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="admin_login_pass" class="nav-item nav-link">Home</a>
                                <a href="addflights" class="nav-item nav-link"><small>Add Flights</small></a>
                                <a href="availability_from_admin" class="nav-item nav-link"><small>Search Flights</small></a>
                                <a href="coupon_add" class="nav-item nav-link active"><small>Add Coupon</small></a>
                                <a href="coupon_search" class="nav-item nav-link"><small>Search Coupon</small></a>
                                <a href="coupon_delete" class="nav-item nav-link"><small>Delete Coupon</small></a>
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
        <!-- Header End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/cpnadd.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Add Coupon</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin_login_pass">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Add Coupon</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Searching Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-12">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="add_coupon">
                                <div class="row g-3">
                                    <h3 class="mb-4 text-center">Add Coupons<span class="text-primary text-uppercase"> <small>By Coupon Id</small></span></h3>
                                    <h6 class="text-start text-primary text-center text-uppercase"> <small>and Discount Offers</small> </h6>
                                     
                                    <div class="col-md-5">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="cname" name="cname" placeholder="Coupon Number">
                                            <label for="cname">Coupon Number</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-select" name="discoutnpercentage" id="discoutnpercentage">
                                                <option selected>Enter Discount Percentage</option>
                                                <option value=05>05% Discount</option>
                                                <option value=10>10% Discount</option>
                                                <option value=15>15% Discount</option>
                                                <option value=20>20% Discount</option>
                                                <option value=25>25% Discount</option>
                                                <option value=30>30% Discount</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Add</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        
        <!-- Newsletter Start -->
        <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s" style="margin: 23px; padding: 23px">
            <div class="row justify-content-center">
                <div class="col-lg-10 border rounded p-1">
                    <div class="text-center p-1">
                        <div class="bg-white text-center p-5">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Newsletter Start -->


        <!-- Footer Start -->
      <jsp:include page="../includes/footer.jsp"/>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <jsp:include page="../includes/footer_js_links.jsp"/>
</body>

</html>