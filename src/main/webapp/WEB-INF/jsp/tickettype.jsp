<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<% String pagename="tickettype.jsp"; session.setAttribute("pagename", pagename); %>
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
        Spinner End -->

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
     <jsp:include page="../includes/navbar.jsp"/>
        <!-- Header End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-1.jpg);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Types Of Plane Ticket</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Ticket Type</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Ticket info Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Types Of Plain Ticket</h6>
                    <h1 class="mb-5"><span class="text-primary text-uppercase">AirReserve</span> Provides </h1>
                </div>
                <div class="row g-4">
                    <div class="col-12">
                        <div class="row gy-4">
                            <div class="col-md-4">
                                <h6 class="section-title text-start text-primary text-uppercase">Booking</h6>
                                <p><i class="fa fa-envelope-open text-primary me-2"></i>book@example.com</p>
                            </div>
                            <div class="col-md-4">
                                <h6 class="section-title text-start text-primary text-uppercase">General</h6>
                                <p><i class="fa fa-envelope-open text-primary me-2"></i>info@example.com</p>
                            </div>
                            <div class="col-md-4">
                                <h6 class="section-title text-start text-primary text-uppercase">Technical</h6>
                                <p><i class="fa fa-envelope-open text-primary me-2"></i>tech@example.com</p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">One-Way Ticket</span></h1>
                        <p class="mb-4">This is a type of ticket for one direction of travel only. It is ideal for travelers who do not require a return flight or for travelers who do not have an exact return date. Travelers who purchase one-way tickets must purchase a second ticket for return travel.</p>
                    </div>
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-3.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-4.png">
                                </div>                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                   
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.4s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-1.png">
                                </div>                                
                            </div>
                        </div>
                    </div>                
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.5s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">Round-trip Ticket</span></h1>
                        <p class="mb-4">Round-trip tickets are tickets that allow the purchaser to travel to their destination and then back again. This type of ticket is for travelers who have plans to travel on specific dates.</p>
                    </div>
                    
                    
                    
                    
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.7s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">First Class Ticket</span></h1>
                        <p class="mb-4">First class tickets are a form of one-way or round-trip tickets that allow travelers to travel in first class. Because first class travelers have access to spacious seating, quality food, drink and other in-flight amenities, these tickets are often the most expensive type of ticket available. First class ticket holders also have access to the airport lounge while waiting for their flight and a variety of entertainment options on-board.</p>
                    </div>
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.8s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-1.png">
                                </div>                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.10s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-3.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-4.png">
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.11s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">Business Class Ticket</span></h1>
                        <p class="mb-4">This type of ticket allows the purchaser to sit in business class. It is a ticket that provides travelers with a more comfortable traveling experience than coach/economy. For example, one of the benefits of business class is increased leg room. However, it does not have the features or luxuries that are available to travelers carrying first class tickets.</p>
                    </div>
                    
                    
                    
                    
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.13s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">Coach Ticket</span></h1>
                        <p class="mb-4">Coach tickets are a type of ticket in which fliers travel in coach or economy class. This is the most basic means of travel and it is also the least expensive. Holders of coach tickets are often given limited snacks and drink and other comfort features such as leg room are limited.</p>
                    </div>
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.14s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-5.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-6.png">
                                </div>                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.16s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-1.png">
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.17s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">Non-refundable tickets</span></h1>
                        <p class="mb-4">Round-trip tickets are tickets that allow the purchaser to travel to their destination and then back again. This type of ticket is for travelers who have plans to travel on specific dates.</p>
                    </div>
                    
                    
                    
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.5s">
                        <h6 class="section-title text-start text-primary text-uppercase">Types Of Plane Tickets</h6>
                        <h1 class="mb-4">AirReserve Provides <span class="text-primary text-uppercase">Refundable ticket</span></h1>
                        <p class="mb-4">Refundable tickets are a ticket type that is eligible for a refund. Travelers that request a refund are not charged a fee or penalty.</p>
                    </div>
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.4s">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-3.png">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-4.png">
                                </div>                                
                            </div>
                        </div>
                    </div>                
                    
                </div>
            </div>
        </div>
        <!-- Ticket info End -->

        
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

        <jsp:include page="../includes/footer_js_links.jsp"/>

</body>

</html>