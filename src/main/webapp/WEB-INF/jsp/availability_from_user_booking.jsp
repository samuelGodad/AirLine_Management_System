<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String pagename="availability_from_user_booking.jsp"; session.setAttribute("pagename", pagename); %>
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
        <!-- Spinner Start -->
        <!--div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
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
            <jsp:include page="../includes/navbar.jsp"/>

        <!-- Header End -->
        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/search.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Search Flights</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin_login_pass">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Search Flights</li>
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
                    <form method="post" action="search_flight_by_user">
                        <div class="row g-2">
                        <div class="col-md-10">
                            <h1>Show All Flight Details From Database</h1>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary w-100">Search</button>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Booking End -->

        <!-- Searching Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="search_flight_by_user">
                                <div class="row g-3">
                                    <h3 class="mb-4 text-center">Search Flights<span class="text-primary text-uppercase"> <small>By Flight Number</small></span></h3>
                                    <h6 class="text-start text-primary text-center text-uppercase"> <small>Search Flights By Flight Number</small> </h6>
                                     
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="fname" name="flight_no" placeholder="Flight Number">
                                            <label for="fname">Flight Number</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="col-lg-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="search_flight_by_user">
                                <div class="row g-3">
                                    <h3 class="mb-4 text-center">Search Flights<span class="text-primary text-uppercase"> <small>By Flight ID</small></span></h3>
                                    <h6 class="text-start text-primary text-uppercase text-center"> <small>Search Flights By Flight ID </small></h6>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="flight_id" name="flight_id" placeholder="Flight ID">
                                            <label for="flight_id">Flight ID</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="col-lg-12">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="search_flight_by_user">
                                <div class="row g-3">
                                    <h3 class="mb-4 text-center">Search Flights<span class="text-primary text-uppercase"> <small>By Flight Name</small></span></h3>
                                    <h6 class="text-start text-primary text-uppercase text-center"> <small>Search Flights By Flight Name</small></h6>
                                    <div class="col-md-8">
                                        <label>Enter Flight Name</label>
                                        <select
                                        class="form-select"
                                        name="flight_name"
                                        id="flight_name"
                                      >
                                        <option selected>Enter Flight Name</option>
                                        <option value="Ethiopian Airlines">
                                          Ethiopian Airlines
                                        </option>
                                        <option value="Kenya Airways">Kenya Airways</option>
                                        <option value="RwandAir">RwandAir</option>
                                        <option value="Fly540">Fly540</option>
                                        <option value="Precision Air">Precision Air</option>
                                        <option value="Jambojet">Jambojet</option>
                                        <option value="Air Tanzania">Air Tanzania</option>
                                        <option value="EgyptAir">EgyptAir</option>
                                        <option value="Turkish Airlines">
                                          Turkish Airlines
                                        </option>
                                        <option value="Emirates">Emirates</option>
                                        <option value="Qatar Airways">Qatar Airways</option>
                                        <option value="Etihad Airways">Etihad Airways</option>
                                        <option value="British Airways">
                                          British Airways
                                        </option>
                                        <option value="KLM Royal Dutch Airlines">
                                          KLM Royal Dutch Airlines
                                        </option>
                                        <option value="Lufthansa">Lufthansa</option>
                                      </select>
                                   </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="col-lg-12" style="margin-top: 5%;">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="search_flight_by_user">
                                <div class="row g-2">
                                    <h3 class="mb-4 text-center">Search Flights<span class="text-primary text-uppercase"> <small>By From-To Citys</small></span></h3>
                                    <h6 class="text-start text-primary text-uppercase text-center"> <small>Search Flights By Citys </small></h6>
                                    <div class="col-md-4">
                                        <label>From City</label>
                                                  <select
                          class="form-select"
                          name="from_city"
                          id="from_city"
                        >
                          <option selected>Departure City Name</option>
                          <option
                            value="Addis Ababa Bole International Airport - ADD"
                          >
                            Addis Ababa Bole International Airport - ADD
                          </option>
                          <option
                            value="Nairobi Jomo Kenyatta International Airport - NBO"
                          >
                            Nairobi Jomo Kenyatta International Airport - NBO
                          </option>
                          <option
                            value="Johannesburg OR Tambo International Airport - JNB"
                          >
                            Johannesburg OR Tambo International Airport - JNB
                          </option>
                          <option value="Dubai International Airport - DXB">
                            Dubai International Airport - DXB
                          </option>
                          <option value="London Heathrow Airport - LHR">
                            London Heathrow Airport - LHR
                          </option>
                          <option value="Paris Charles de Gaulle Airport - CDG">
                            Paris Charles de Gaulle Airport - CDG
                          </option>
                          <option
                            value="Beijing Capital International Airport - PEK"
                          >
                            Beijing Capital International Airport - PEK
                          </option>
                          <option
                            value="New York John F. Kennedy International Airport - JFK"
                          >
                            New York John F. Kennedy International Airport - JFK
                          </option>
                          <option
                            value="Mumbai Chhatrapati Shivaji Maharaj International Airport - BOM"
                          >
                            Mumbai Chhatrapati Shivaji Maharaj International
                            Airport - BOM
                          </option>
                          <option value="Cairo International Airport - CAI">
                            Cairo International Airport - CAI
                          </option>
                          <option value="Kigali International Airport - KGL">
                            Kigali International Airport - KGL
                          </option>
                          <option
                            value="Lagos Murtala Muhammed International Airport - LOS"
                          >
                            Lagos Murtala Muhammed International Airport - LOS
                          </option>
                          <option
                            value="Seychelles International Airport - SEZ"
                          >
                            Seychelles International Airport - SEZ
                          </option>
                          <option
                            value="Accra Kotoka International Airport - ACC"
                          >
                            Accra Kotoka International Airport - ACC
                          </option>
                          <option
                            value="Djibouti-Ambouli International Airport - JIB"
                          >
                            Djibouti-Ambouli International Airport - JIB
                          </option>
                          <option
                            value="Mogadishu Aden Adde International Airport - MGQ"
                          >
                            Mogadishu Aden Adde International Airport - MGQ
                          </option>
                          <option value="Kinshasa N'djili Airport - FIH">
                            Kinshasa N'djili Airport - FIH
                          </option>
                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>To City</label>
                                        <select class="form-select" name="to_city" id="to_city">
                                            <option selected>Arrival City Name</option>
                                            <option
                                              value="Addis Ababa Bole International Airport - ADD"
                                            >
                                              Addis Ababa Bole International Airport - ADD
                                              (Ethiopia)
                                            </option>
                                            <option
                                              value="Nairobi Jomo Kenyatta International Airport - NBO"
                                            >
                                              Nairobi Jomo Kenyatta International Airport - NBO
                                              (Kenya)
                                            </option>
                                            <option value="Entebbe International Airport - EBB">
                                              Entebbe International Airport - EBB (Uganda)
                                            </option>
                                            <option value="Kigali International Airport - KGL">
                                              Kigali International Airport - KGL (Rwanda)
                                            </option>
                                            <option
                                              value="Dar es Salaam Julius Nyerere International Airport - DAR"
                                            >
                                              Dar es Salaam Julius Nyerere International Airport -
                                              DAR (Tanzania)
                                            </option>
                                            <option
                                              value="Mombasa Moi International Airport - MBA"
                                            >
                                              Mombasa Moi International Airport - MBA (Kenya)
                                            </option>
                                            <option
                                              value="Zanzibar Abeid Amani Karume International Airport - ZNZ"
                                            >
                                              Zanzibar Abeid Amani Karume International Airport -
                                              ZNZ (Tanzania)
                                            </option>
                                            <option value="Lalibela Airport - LLI">
                                              Lalibela Airport - LLI (Ethiopia)
                                            </option>
                                            <option value="Gondar Airport - GDQ">
                                              Gondar Airport - GDQ (Ethiopia)
                                            </option>
                                            <option value="Dire Dawa Airport - DIR">
                                              Dire Dawa Airport - DIR (Ethiopia)
                                            </option>
                                            <option value="Bahir Dar Airport - BJR">
                                              Bahir Dar Airport - BJR (Ethiopia)
                                            </option>
                                            <option value="Axum Airport - AXU">
                                              Axum Airport - AXU (Ethiopia)
                                            </option>
                                            <option
                                              value="Hargeisa Egal International Airport - HGA"
                                            >
                                              Hargeisa Egal International Airport - HGA
                                              (Somaliland)
                                            </option>
                                            <option
                                              value="Djibouti–Ambouli International Airport - JIB"
                                            >
                                              Djibouti–Ambouli International Airport - JIB
                                              (Djibouti)
                                            </option>
                                          </select>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
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

   <jsp:include page="../includes/footer_js_links.jsp"/>
</body>

</html>