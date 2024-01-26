<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
        width: 2px;               /* width of the entire scrollbar */
     }

    div.scroll::-webkit-scrollbar-track {
        background: orange;        /* color of the tracking area */
    }

    div.scroll::-webkit-scrollbar-thumb {
        background-color: blue;    /* color of the scroll thumb */
        border-radius: 20px;       /* roundness of the scroll thumb */
        border: 3px solid orange;  /* creates padding around scroll thumb */
    }
    
    table, th, td {
        border: 1px solid black;
    }
    </style>
    <link rel="icon" href="../../img/title_logo.png" type="text/x-icon">
    
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
        <jsp:include page="../includes/admin_navbar.jsp"/>

        <!-- Header End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/rspns2.png);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Admin Dashboard</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="admin/admin_login_pass.jsp">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Admin Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <h2 align="center"><font><strong>Showing Search Results
            
        </strong></font></h2>
        <div class="scroll">
            <table align="center" cellpadding="5" cellspacing="5">
                <tr>
                
                </tr>
                <tr style="color:blue" bgcolor="#FEA116">
                <td><center><b>User's Name</b></center></td>
                <td><center><b>User's Email</b></center></td>
                <td><center><b>User's Subject</b></center></td>
                <td><center><b>User's Message</b></center></td>
                </tr>
                <%
                int count = 0;
                //String color = "Blue";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");

                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                    
                %>
                
                <tr>
                    <td><center><%=pList.get(0)%></center></td>
                    <td><center><%=pList.get(1)%></center></td>
                    <td><center><%=pList.get(2)%></center></td>
                    <td><center><%=pList.get(3)%></center></td>
                </tr>
                    <%
                            }
                        }
                        if (count == 0) {
                            %>
                        <tr>
                            <td colspan=4 align="center"><b>No Record Found..</b></td>
                        </tr>
            <%            }
            %>
                </table>
        </div>
        </div>
        <br/>
        <!-- Service End -->


        <!-- Footer Start -->
        <jsp:include page="../includes/footer.jsp"/>

        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <jsp:include page="../includes/footer_js_links.jsp"/>

</body>

</html>