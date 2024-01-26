<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">


   <jsp:include page ="../includes/header_css_links.jsp"/>
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
        <jsp:include page="../includes/admin_navbar.jsp"/>
        <!-- Header End -->


        <!-- Page Header Start -->
        <jsp:include page="../includes/admin_page_header.jsp"/>
        <!-- Page Header End -->


        <!-- Adding From -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h1>
                        <c:if test="${not empty errorMessage}">
                            <div id="errorDiv" class="alert alert-danger">
                                    ${errorMessage}
                            </div>
                        </c:if>

                    </h1>
                    <h6 class="section-title text-center text-primary text-uppercase">Add Flights To DataBase</h6>
                    <h1 class="mb-5">Add A <span class="text-primary text-uppercase">New Flight</span></h1>
                </div>
                <div class="row g-5">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="add_flight_validator">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight ID" name="flight_id">
                                            <label>Enter Flight ID</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight Number" name="flight_no">
                                            <label>Enter Flight Number</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" name="flight_name" id="flight_name">
                                                <option selected>Enter Flight Name</option>
                                                <option value="Ethiopian Airlines">Ethiopian Airlines</option>
                                                <option value="ET701">ET701 - Addis Ababa to Nairobi</option>
                                                <option value="ET702">ET702 - Nairobi to Addis Ababa</option>
                                                <option value="ET703">ET703 - Addis Ababa to Johannesburg</option>
                                                <option value="ET704">ET704 - Johannesburg to Addis Ababa</option>
                                                <option value="ET705">ET705 - Addis Ababa to Dubai</option>
                                                <option value="ET706">ET706 - Dubai to Addis Ababa</option>
                                                <option value="ET707">ET707 - Addis Ababa to London</option>
                                                <option value="ET708">ET708 - London to Addis Ababa</option>
                                                <option value="ET709">ET709 - Addis Ababa to Beijing</option>
                                                <option value="ET710">ET710 - Beijing to Addis Ababa</option>
                                                <option value="ET711">ET711 - Addis Ababa to New York</option>
                                                <option value="ET712">ET712 - New York to Addis Ababa</option>
                                                <option value="ET713">ET713 - Addis Ababa to Paris</option>
                                                <option value="ET714">ET714 - Paris to Addis Ababa</option>
                                                <option value="ET715">ET715 - Addis Ababa to Mumbai</option>
                                                <option value="ET716">ET716 - Mumbai to Addis Ababa</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating">
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
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
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
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating date">
                                            <input type="date" class="form-control" placeholder="Date Of Flight" name="date_of_flight">
                                            <label for="checkin">Date Of Flight</label>
                                        </div>
                                    </div>
                                                                       
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight Departure Time HH:MM:SS" name="flight_arrival_time">
                                            <label><small>Enter Flight Departure Time HH:MM:SS</small></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight Arrival Time HH:MM:SS" id="frt" name="flight_reach_time">
                                            <label><small>Enter Flight Arrival Time HH:MM:SS</small></label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter First Class Seat" name="first_class_seat">
                                            <label><small>Enter First Class Seat</small></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter First Class Seat Price" name="first_class_price">
                                            <label><small>Enter First Class Seat Price</small></label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Business Class Seat" name="buss_class_seat">
                                            <label><small>Enter Business Class Seat</small></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Business Class Seat Price" name="buss_class_price">
                                            <label><small>Enter Business Class Seat Price</small></label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Economy Class Seat" name="eco_class_seat">
                                            <label><small>Enter Economy Class Seat</small></label>
                                        </div>
                                    </div>
                                                                       
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Economy Class Seat Price" name="eco_class_price">
                                            <label><small>Enter Economy Class Seat Price</small></label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Add Flight To The DataBase</button>
                                    </div>
                                    <div class="col-12" style="margin-bottom: 12%;"><div class="form-floating"></div></div>
                                </div>
                            </form>
                        </div>
                </div>
            </div>
        </div>
        <!-- Adding End -->
        <!-- Newsletter Start -->
     <jsp:include page="../includes/newsletter.jsp"/>
        <!-- Newsletter Start -->
        <!-- Footer Start -->
        <jspp:include page="../includes/footer.jsp"/>>
        <!-- Footer End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
        <script>
            window.onload = function() {
                const  errorDiv = document.getElementById('errorDiv');
                if (errorDiv) {
                    errorDiv.scrollIntoView();
                }
            }
        </script>
    <!-- JavaScript Libraries -->
   <jsp:include page="../includes/footer_js_links.jsp"/>

</body>

</html>