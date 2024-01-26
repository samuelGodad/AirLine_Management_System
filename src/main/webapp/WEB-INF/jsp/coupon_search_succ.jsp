<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%--<% String deleteSuccess = (String) request.getAttribute("deleteSuccess");%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="icon" href="img/title_logo.png" type="text/x-icon">
    <jsp:include page="../includes/header_css_links.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
        <jsp:include page="../includes/admin_navbar.jsp"/>
          <!-- Header End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/cpnsrch.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
<%--                    <h1 class="display-3 text-white mb-3 animated slideInDown"id="pageTitle">Search Coupon Details</h1>--%>
                    <%
                        String fromDeleteCoupon = request.getParameter("fromDeleteCoupon");
                    %>

                    <h1 class="display-3 text-white mb-3 animated slideInDown" id ="pageTitle" class="mb-5">
                        <%= "true".equals(fromDeleteCoupon) ? "Delete Coupon Details" : "Search Coupon Details" %>
                    </h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin_login_pass">Home</a></li>
                            <li class="breadcrumb-item text-white" aria-current="page">Search Coupon Details</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <div class="container-xxl py-5">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title text-center text-primary text-uppercase">Congrats!</h6>
                <h1 class="mb-5">Showing Results <span class="text-primary text-uppercase">For the Coupon</span></h1>
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
        <h2 align="center"><font><strong>Showing Search Results

        </strong></font></h2>
        <div class="scroll">
            <table align="center" cellpadding="5" cellspacing="5">
                <tr>

                </tr>
                <tr style="color:blue" bgcolor="#FEA116">
                    <td><b>Coupon Name/ Id/ Number</b></td>
                    <td><b>Discount Offer For This Coupon</b></td>
                </tr>
                <%
                    int count = 0;
                    //String color = "Blue";
                    if (request.getAttribute("piList") != null) {
                        ArrayList al = (ArrayList) request.getAttribute("piList");
                        System.out.println(al);
                        Iterator itr = al.iterator();
                        while (itr.hasNext()) {
                            count++;
                            ArrayList pList = (ArrayList) itr.next();

                %>

                <tr>
                    <td>
                        <center><%=pList.get(0)%>
                        </center>
                    </td>
                    <td>
                        <center><%=pList.get(1)%> %</center>
                    </td>
                    <td>
                        <a href="edit_coupon?id=<%=pList.get(0)%>">
                            <i class="fa fa-edit"></i>
                        </a>
                    </td>
                    <td>

                        <a href="#" data-toggle="modal" data-target="#deleteModal" data-coupon-name="<%=pList.get(0)%>"
                           data-discountpercentage="<%=pList.get(1)%>">
                            <i class="fa fa-trash"></i>
                        </a>
                        <jsp:include page="../includes/deleteModal.jsp"/>
                        <%--                        <a class="" href="#" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fas fa-user"></i></a>--%>

                    </td>
                </tr>
                <%
                        }
                    }
                    if (count == 0) {
                %>
                <tr>
                    <td colspan=2 align="center"><b>No Record Found..</b></td>
                </tr>
                <% }
                %>
            </table>
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


    <script>
        $(".fa-trash").click(function () {
            const  couponName = $(this).parent().data("coupon-name"); // Get the coupon_name from the data attribute
            const discountpercentage = $(this).parent().data("discountpercentage"); // Get the discountpercentage from the data attribute
            $("#deleteCouponName").val(couponName);
            $("#deleteDiscountpercentage").val(discountpercentage);
        });
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const fromDeleteCoupon = urlParams.get('fromDeleteCoupon');
            if (fromDeleteCoupon) {
                document.getElementById("pageTitle").textContent = "Delete Coupon Details";
            }
        };

    </script>

</body>

</html>