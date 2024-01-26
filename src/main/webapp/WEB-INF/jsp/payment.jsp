<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String pagename="user_login_pass.jsp"; session.setAttribute("pagename", pagename); %>
<head>
    <script>
        function setClipboard(value) {
            var tempInput = document.createElement("input");
            tempInput.style = "position: absolute; left: -1000px; top: -1000px";
            tempInput.value = value;
            document.body.appendChild(tempInput);
            tempInput.select();
            document.execCommand("copy");
            document.body.removeChild(tempInput);
            alert("copied to clipboard!!");
        }
    </script>
    <meta charset="utf-8">
    <title>AirLine Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="../includes/header_css_links.jsp"/>

</head>

<body>
<div class="container-xxl bg-white p-0">
    <!-- Header Start -->
    <jsp:include page="../includes/navbarwithsession.jsp"/>
    <!-- Header End -->


    <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/carousel-3.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h6 class="section-title text-white text-uppercase mb-3 animated slideInDown">Congratulations!</h6>
                            <h1 class="display-3 text-white mb-4 animated slideInDown">You have succesfully booked flight</h1>
                            <a href="availability_from_user_booking" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft"></a>
                            <a href="booking" class="btn btn-light py-md-3 px-md-5 animated slideInRight"></a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-4.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h6 class="section-title text-white mb-3 animated slideInDown">Coupon Code: abcdefgh05</h6>
                            <h1 class="display-3 text-white mb-4 animated slideInDown">Discover Huge Discounts On Plane Tickets</h1>
                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Get 5% Flat Discount</a>
                            <button onclick="setClipboard('abcdefgh05')" class="btn btn-light py-md-3 px-md-5 animated slideInRight"></button>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-5.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h6 class="section-title text-white mb-3 animated slideInDown">Coupon Code: abcdefgh10</h6>
                            <h1 class="display-3 text-white mb-4 animated slideInDown">Discover Huge Discounts On Plane Tickets</h1>
                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Get 10% Flat Discount</a>
                            <button onclick="setClipboard('abcdefgh10')" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Copy Code To Clipboard</button>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-6.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h6 class="section-title text-white mb-3 animated slideInDown">Coupon Code: abcdefgh15</h6>
                            <h1 class="display-3 text-white mb-4 animated slideInDown">Discover Huge Discounts On Plane Tickets</h1>
                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Get 15% Flat Discount</a>
                            <button onclick="setClipboard('abcdefgh15')" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Copy Code To Clipboard</button>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-7.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h6 class="section-title text-white mb-3 animated slideInDown">Coupon Code: abcdefgh25</h6>
                            <h1 class="display-3 text-white mb-4 animated slideInDown">Discover Huge Discounts On Plane Tickets</h1>
                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Get 25% Flat Discount</a>
                            <button onclick="setClipboard('abcdefgh25')" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Copy Code To Clipboard</button>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->





    <!-- Footer Start -->
    <jsp:include page="../includes/footer.jsp"/>
    <!-- Footer End -->
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
<jsp:include page="../includes/footer_js_links.jsp"/>

</body>

</html>