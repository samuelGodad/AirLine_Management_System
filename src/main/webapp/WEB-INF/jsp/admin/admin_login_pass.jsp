<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>AirLine Reservation System - Admin Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <jsp:include page="../../includes/header_css_links.jsp"/>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <jsp:include page="../../includes/admin_navbar.jsp"/>
        <!-- Header End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/admin.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Admin Dashboard</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin_login_pass">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Admin Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <h6 class="section-title text-start text-primary text-uppercase">AIRRESERVE Admin Pannel</h6>
                        <h1 class="mb-4">Admin <span class="text-primary text-uppercase">Dashboard</span></h1>
                        <p class="mb-4">You and go through Users responses and connectivity with the Links Below</p>
                        <div class="row g-3 pb-4">
                            <div class="col-sm-6 wow fadeIn" data-wow-delay="0.1s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <form method="post" action="Newsletter_res_show">
                                            <h2>Show Users Newsletters</h2>
                                            <button class="btn btn-primary py-3 px-5 mt-2" type="submit">Show Results</button>                                         
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 wow fadeIn" data-wow-delay="0.3s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <form method="post" action="responses">
                                            <h2>Show Users Responses</h2>
                                            <button class="btn btn-primary py-3 px-5 mt-2" type="submit">Show Results</button>                                         
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-85 wow zoomIn" data-wow-delay="0.1s" src="img/admnlog2.png" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.3s" src="img/admnlog1.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->

        
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-md-3"></div>
                    
                    <div class="col-lg-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                                <div class="row g-3">
                                    <h3 class="mb-4 text-center">Send Emails<span class="text-primary text-uppercase"> <small>To Newsletter</small></span></h3>
                                    <h6 class="text-start text-primary text-center text-uppercase"> <small>Send Emails</small> </h6>
                                    <form method="post" action="email">
                                        <div class="row g-3">
                                            <div class="col-md-12">
                                                <div class="form-floating">
                                                <input type="text" class="form-control" id="subject" placeholder="Enter Subject" name="subject">
                                                <label for="subject">Enter Subject</label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="msg" placeholder="Enter Message" name="msg">
                                                <label for="msg">Enter Message</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <button class="btn btn-primary w-100 py-3" type="submit">Send Emails</button>
                                            </div>
                                        </div>
                                   </div>
                            </form>
                                </div>
                           </div>
                    </div>
                    
                    <div class="col-md-3"></div>
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
        <jsp:include page="../../includes/footer.jsp"/>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <jsp:include page="../../includes/footer_js_links.jsp"/>
</body>

</html>