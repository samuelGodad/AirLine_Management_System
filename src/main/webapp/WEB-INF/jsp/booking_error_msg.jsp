<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String pagename="booking_error_msg.jsp"; session.setAttribute("pagename", pagename); %>
<head>
    <meta charset="utf-8">
    <title>AirLine Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
        -->
        <!-- Spinner End -->

        <!-- Header Start -->
        <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Header Start -->
        <jsp:include page="../includes/navbarwithsession.jsp"/>
        <!-- Header End -->

        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/booking.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">For Booking Purpose</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Booking</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
        <!-- Booking Message Error-->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Sorry to say that!</h6>
                    <h1 class="mb-5">You Need To <span class="text-primary text-uppercase">Register</span> Or <span class="text-primary text-uppercase">Login</span> Before You acn Access <span class="text-primary text-uppercase">AirReserve</span> Booking System</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="service-item rounded" href="register">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-key fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Registration</h5>
                            <p class="text-body mb-0">If You are a new user you need to register first!</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                        <a class="service-item rounded" href="login_page">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-unlock fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Login</h5>
                            <p class="text-body mb-0">If You are already Our User Dont Need to register again!</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="service-item rounded" href="${pageContext.request.contextPath}/">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-sad-cry fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Not Interested?</h5>
                            <p class="text-body mb-0">Sad to hear that you can go back to our home page!</p>
                        </a>
                    </div>

                </div>
            </div>
        </div>
        <!-- Booking Message Error -->

        <!-- Footer Gappping -->
        <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="row justify-content-center">
                <div class="col-lg-10 p-1">
                    <div class="text-center p-1">

                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Gapping -->

        <!-- Footer Start -->
        <jsp:include page="../includes/footer.jsp"/>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    </div>
    <!-- JavaScript Libraries -->
    <jsp:include page="../includes/footer_js_links.jsp"/>
</body>

</html>
