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
        <jsp:include page="../includes/admin_navbar.jsp"/>

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
                                    <h4 class="text-center text-primary text-uppercase">
                            <%  String cname=(String)session.getAttribute("cname");  
                                        out.print(cname);  
                                    %> , Coupon Added Successfully</h4>
                                    <h3 class="mb-4 text-center">Add Coupons<span class="text-primary text-uppercase"> <small>By Coupon Id</small></span></h3>
                                    <h6 class="text-start text-primary text-center text-uppercase"> <small>and Discount Offers</small> </h6>
                                     
                                    <div class="col-md-5">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="cname" name="cname" placeholder="Coupon Number">
                                            <label for="cname">Coupon Number</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-select" name="discountpercentage" id="discountpercentage">
                                                <option selected>Enter Discount Percentage</option>
                                                <option value=0>0% Discount</option>
                                                <option value=5>5% Discount</option>
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