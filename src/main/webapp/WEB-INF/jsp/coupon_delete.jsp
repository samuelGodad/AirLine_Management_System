<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>AirLine Reservation System - Admin Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<link rel="icon" href="img/title_logo.png" type="text/x-icon">
   <jsp:include page="../includes/header_css_links.jsp"/>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <!--div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
       Spinner End -->

        <!-- Header Start -->
        <jsp:include page="../includes/admin_navbar.jsp"/>

        <!-- Header End -->


       <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/cpndlt.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Delete Coupon</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin/admin_login_pass.jsp">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Delete Coupon</li>
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
                            <form method="post" action="delete_coupon">
                                <div class="row g-3">
                                    <h3 class="mb-4 text-center">Delete Coupons<span class="text-primary text-uppercase"> <small>By Coupon Id</small></span></h3>
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
                                        <button class="btn btn-primary w-100 py-3" type="submit">Delete</button>
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

    <jsp:include page="../includes/footer_js_links.jsp"/>
</body>

</html>