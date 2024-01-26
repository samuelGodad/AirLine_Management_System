<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sami.airline_management_system_project.model.Flight" %>
<!DOCTYPE html>
<html lang="en">
<% String pagename = "search_filter_flights_result_u.jsp";
    session.setAttribute("pagename", pagename); %>
<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="../includes/header_css_links.jsp"/>

    <style>

        div.scroll {
            margin: 4%;
            padding: 4px;
            width: 90%;
            overflow: auto;
            overflow-x: auto;
            overflow-y: auto;
            white-space: nowrap;
            scrollbar-color: #d4aa70 #e4e4e4;
            scrollbar-width: thin;
        }

        div.scroll::-webkit-scrollbar {
            width: 2px; /* width of the entire scrollbar */
        }

        div.scroll::-webkit-scrollbar-track {
            background: orange; /* color of the tracking area */
        }

        div.scroll::-webkit-scrollbar-thumb {
            background-color: blue; /* color of the scroll thumb */
            border-radius: 20px; /* roundness of the scroll thumb */
            border: 3px solid orange; /* creates padding around scroll thumb */
        }

        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>

<body>
<div class="container-xxl bg-white p-0">

    <!-- Header Start -->
    <div class="container-xxl bg-white p-0">

        <!-- Header Start -->
        <jsp:include page="../includes/navbarwithsession.jsp"/>
        <!-- Header End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/search.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Update Flight Details</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin/admin_login_pass.jsp">Home</a></li>
                            <li class="breadcrumb-item text-white" aria-current="page">Update Flight Details</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <div class="container-xxl py-5">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title text-center text-primary text-uppercase">Congrats!</h6>
                <h1 class="mb-5">Showing Results <span class="text-primary text-uppercase">For the Flight</span></h1>
            </div>
        </div>

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
        <h2 align="center"><font><strong>Showing Search Results</strong></font></h2>
        <%
            List<Flight> piList = (List<Flight>) request.getAttribute("piList");
            if (piList != null && !piList.isEmpty()) {

        %>
        <div class="scroll">
            <table align="center" cellpadding="5" cellspacing="5">
                <tr style="color:blue" bgcolor="#FEA116">
                    <td><b>flight_id</b></td>
                    <td><b>flight_no</b></td>
                    <td><b>flight_name</b></td>
                    <td><b>from_city</b></td>
                    <td><b>to_city</b></td>
                    <td><b>date_of_flight</b></td>
                    <td><b>flight_arrival_time</b></td>
                    <td><b>flight_reach_time</b></td>
                    <td><b>duration</b></td>
                    <td><b>first_class_seat</b></td>
                    <td><b>first_class_seat_booked</b></td>
                    <td><b>first_class_seat_aval</b></td>
                    <td><b>buss_class_seat</b></td>
                    <td><b>buss_class_seat_booked</b></td>
                    <td><b>buss_class_seat_aval</b></td>
                    <td><b>eco_class_seat</b></td>
                    <td><b>eco_class_seat_booked</b></td>
                    <td><b>eco_class_seat_aval</b></td>
                    <td><b>first_class_price</b></td>
                    <td><b>buss_class_price</b></td>
                    <td><b>eco_class_price</b></td>
                </tr>
                <% for (Flight flight : piList) { %>

                <tr>
                    <td>
                        <%= flight.getFlightId()%>
                    </td>

                    <td>
                        <%= flight.getFlightNo()%>
                    </td>
                    <td>
                        <%= flight.getFlightName()%>
                    </td>

                    <td>
                        <%= flight.getFromCity()%>
                    </td>
                    <td>
                        <%= flight.getToCity()%>
                    </td>
                    <td>
                        <%= flight.getDateOfFlight()%>
                    </td>
                    <td>
                        <%= flight.getFlightArrivalTime()%>
                    </td>
                    <td>
                        <%= flight.getFlightReachTime()%>
                    </td>
                    <td>
                        <%= flight.getDuration()%>
                    </td>
                    <td>
                        <%= flight.getFirstClassSeat()%>
                    </td>
                    <td>
                        <%= flight.getFirstClassSeatBooked()%>
                    </td>
                    <td>
                        <%= flight.getFirstClassSeatAval()%>
                    </td>
                    <td>
                        <%= flight.getBussClassSeat()%>
                    </td>
                    <td>
                        <%= flight.getBussClassSeatBooked()%>
                    </td>
                    <td>
                        <%= flight.getBussClassSeatAval()%>
                    </td>
                    <td>
                        <%= flight.getEcoClassSeat()%>
                    </td>
                    <td>
                        <%= flight.getEcoClassSeatBooked()%>
                    </td>
                    <td>
                        <%= flight.getEcoClassSeatAval()%>
                    </td>
                    <td>
                        <%= flight.getFirstClassPrice()%>
                    </td>
                    <td>
                        <%= flight.getBussClassPrice()%>
                    </td>
                    <td>
                        <%= flight.getEcoClassPrice()%>
                    </td>
                </tr>
                <% } %>
            </table>


            <%
            } else {

            %></
        >
    </
    >
    <h2 style="text-align: center;color: red"><font><strong>No Flight Found</strong></font></h2>
    <%
        }
    %>
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
                            <input class="form-control w-100 py-3 ps-4 pe-5" type="email"
                                   placeholder="Enter your email" id="emails" name="emails">
                            <button type="submit"
                                    class="btn btn-primary py-2 px-3 position-absolute top-0 end-0 mt-2 me-2">Submit
                            </button>
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