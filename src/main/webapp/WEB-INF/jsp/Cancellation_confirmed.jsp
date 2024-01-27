<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String pagename="Cancellation_confirmed"; session.setAttribute("pagename", pagename); %>
<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="../includes/header_css_links.jsp"/>
</head>

<body>
    <div class="container-xxl bg-white p-0">

        <div class="container-xxl bg-white p-0">

        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>

            <jsp:include page="../includes/navbarwithsession.jsp"/>


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" >
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Cancellation</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="user/user_login_pass.jsp">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Cancellation</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Booking Start -->
        <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container">
                <div class="bg-white shadow" style="padding: 35px;">
                    <div class="row g-2">
                    </div>
                </div>
            </div>
        </div>
        <!-- Booking End -->

        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Tickets Cancellation</h6>
                    <h1 class="mb-5">Cancel A <span class="text-primary text-uppercase">Plane Ticket</span></h1>
                </div>
                <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 p-1">
                            <div class="text-center p-1">
                                <h1>TICKET WITH PNR ID "<%  String PNR=(String)session.getAttribute("PNR");  
                                        out.print(PNR);  
                                    %>" CANCELLED Successfully</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-end">
<%--                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.1s" src="../img/cncl1.png" style="margin-top: 25%;">--%>
                            </div>
                            <div class="col-6 text-start">
<%--                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.3s" src="../../img/cncl2.png">--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            
                            <form  method="post" action="cancellation">
                                <div class="row g-3">
                                    <div class="col-md-8">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="PNR" placeholder="Provide Your PNR Number" name="PNR">
                                            <label for="PNR">Provide Your PNR Number</label>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-floating">
                                            <button class="btn btn-primary w-100 py-3" type="submit">Cancel Now</button>
                                        </div>
                                    </div>
                                    
                                </div>
                            </form>
                        </div>
                       </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
       <!-- Newsletter Start -->
        <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="row justify-content-center">
                <div class="col-lg-10 border rounded p-1">
                    <div class="border rounded text-center p-1">
                        <div class="bg-white rounded text-center p-5">
                            <h4 class="mb-4">Subscribe Our <span class="text-primary text-uppercase">Newsletter</span></h4>
                            <form method="post" action="Newsletter_srv">
                                <div class="position-relative mx-auto" style="max-width: 400px;">
                                    <input class="form-control w-100 py-3 ps-4 pe-5" type="email" placeholder="Enter your email" id="emails" name="emails">
                                    <button type="submit" class="btn btn-primary py-2 px-3 position-absolute top-0 end-0 mt-2 me-2">Submit</button>
                                </div>
                            </form>
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