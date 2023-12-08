<%--
  Created by IntelliJ IDEA.
  User: Sami
  Date: 12/7/2023
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid bg-dark text-light footer wow fadeIn" data-wow-delay="0.1s">
    <div class="container pb-5">
        <div class="row g-5">
            <div class="col-md-6 col-lg-4">
                <div class="bg-primary rounded p-4">
                    <a href="${pageContext.request.contextPath}/">
                        <h1 class="text-white text-uppercase mb-3">AirReserve</h1>
                    </a>
                    <p class="text-white mb-0">
                        The website and backend mechanism are designed and developed by <a class="text-dark fw-medium" href="https://www.facebook.com/AlphaTanmoy/">Tanmoy Das</a> hope it's attractive and can be a demo of an actual airline system.
                    </p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <h6 class="section-title text-start text-primary text-uppercase mb-4">Contact</h6>
                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Baguihati, Brainware</p>
                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+251 80117654</p>
                <p class="mb-2"><i class="fa fa-envelope me-3"></i>godadsamuel@gamail.com</p>
                <div class="d-flex pt-2">
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-5 col-md-12">
                <div class="row gy-5 g-4">
                    <div class="col-md-6">
                        <h6 class="section-title text-start text-primary text-uppercase mb-4">Company</h6>
                        <a class="btn btn-link" href="about">About Us</a>
                        <a class="btn btn-link" href="contact">Contact Us</a>
                        <a class="btn btn-link" href="about#team">Our Team</a>
                    </div>
                    <div class="col-md-6">
                        <h6 class="section-title text-start text-primary text-uppercase mb-4">Services</h6>
                        <a class="btn btn-link" href="login_page">Already a User</a>
                        <a class="btn btn-link" href="register">New Registration</a>
                        <a class="btn btn-link" href="admin_login">Admin Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="${pageContext.request.contextPath}/"> AirReserve </a>, All Right Reserved. Designed By <a class="border-bottom">Tanmoy Das</a>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="footer-menu">
                        <a href="${pageContext.request.contextPath}/">Home</a>
                        <a href="about">About</a>
                        <a href="booking_error_msg">Booking</a>
                        <a href="availability">Check Status</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
