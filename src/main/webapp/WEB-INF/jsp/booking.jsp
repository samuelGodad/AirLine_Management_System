<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String pagename="booking.jsp"; session.setAttribute("pagename", pagename); %>
<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

   <jsp:include page="../includes/header_css_links.jsp"/>

    <script>
        function booking_validate(){
            if(document.getElementById("username").value===""){
                alert("Please Enter Username!");
                return false;
            }
            else if(document.getElementById("flight_id").value===""){
                alert("Please Enter Flight Id!");
                return false;
            }
            else if(document.getElementById("no_of_seats").value===""){
                alert("Please Enter Total Number Of Seats");
                return false;
            }
            else if(document.getElementById("adults").value===""){
                alert("Please Enter Number Of Adults!");
                return false;
            }
            else if(document.getElementById("date_of_flight").value===""){
                alert("Please Enter Date Of Flight!");
                return false;
            }
            
            
        }
        
    </script>
    <link rel="icon" href="img/title_logo.png" type="text/x-icon">
</head>
<body>
    <div class="container-xxl bg-white p-0">
        <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Header Start -->
        <div class="container-fluid bg-dark px-0">
            <div class="row gx-0">
                <div class="col-lg-3 bg-dark d-none d-lg-block">
                    <a href="${pageContext.request.contextPath}/" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
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
                                <p class="mb-0">+25180117654</p>
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
                            <h1 class="m-0 text-primary text-uppercase">AirReserve</h1>
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
                                <a href="Cancellation" class="nav-item nav-link">Cancellation</a>
                                <a href="contact_user" class="nav-item nav-link">Contact</a>
                            </div>
                            <a href="${pageContext.request.contextPath}/" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block">LogOut As<small>
                                    <%  String U_name=(String)session.getAttribute("username");  
                                        out.print(U_name);  
                                    %>  
                            </small><i class="fa fa-arrow-right ms-3"></i></a>
                        </div>

                    </nav>
                </div>
            </div>
        </div>
        <!-- Header End -->


        <!-- Page Header Start -->
        <jsp:include page="../includes/user_page_header.jsp"/>
        <!-- Page Header End -->
        <!-- Booking Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Tickets Booking</h6>
                    <h1 class="mb-5">Book A <span class="text-primary text-uppercase">Plane Ticket</span></h1>
                </div>
                <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 p-1">
                            <div class="text-center p-1">
                            
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.1s" src="img/about-1.png" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.png">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-50 wow zoomIn" data-wow-delay="0.5s" src="img/about-3.png">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.7s" src="img/about-4.png">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            
                            <form name="m_f" method="post" action="user_booking_validation_check">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="username" placeholder="Your User Name" name="username">
                                            <label for="name">Your User Name</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="flight_id" placeholder="Plane Id" name="flight_id">
                                            <label for="name">Provide Plane ID</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="number" class="form-control" id="no_of_seats" placeholder="Total Number Of Seats" name="no_of_seats">
                                            <label for="number">Number of Seats</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" id="select3" name="ticket_type">
                                              <option value="Business Class">Business Class</option>
                                              <option value="First Class">First Class</option>
                                              <option value="Coach Class">Coach Class</option>
                                            </select>
                                            <label for="select3">Select Ticket Type</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="number" class="form-control" id="adults" placeholder="Total Number Of Adults" name="adults">
                                            <label for="adults">Select Number Of Adults</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating date">
                                            <input type="date" class="form-control" placeholder="Date Of Flight" id="date_of_flight" name="date_of_flight">
                                            <label for="checkin">Date Of Flight</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <button class="btn btn-primary w-100 py-3" onclick="return booking_validate();" type="submit">Book Now</button>
                                        </div>
                                    </div>
                                    <div class="row g-4">
                                        <div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
                                            <a class="service-item rounded" href="availability_from_user_booking.jsp">
                                            <div class="service-icon bg-transparent border rounded p-1">
                                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                                    <i class="fa fa-question-circle fa-2x text-primary"></i>
                                                </div>
                                            </div>
                                            <h5 class="mb-3">Plane Id?</h5>
                                            <p class="text-body mb-0">How To Get My Plane Id??</p>
                                            </a>
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
        <!-- Booking End -->


        <!-- Newsletter Start -->
        <jsp:include page="../includes/newsletter.jsp"/>
        <!-- Newsletter Start -->


        <!-- Footer Start -->
        <jsp:include page="../includes/footer.jsp"/>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <jsp:include page="../includes/footer_js_links.jsp"/>

    <!-- Template Javascript -->

</body>

</html>