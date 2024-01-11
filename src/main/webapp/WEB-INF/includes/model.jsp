<%--
  Created by IntelliJ IDEA.
  User: Sami
  Date: 12/26/2023
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.sami.airline_management_system_project.model.User" %>
<style>
    .editable-input {
        border: 1px solid #ced4da; /* Default border style */
    }

    .read-only-input {
        border: none; /* Remove border for read-only mode */
        background-color: transparent; /* Make background transparent for read-only mode */
    }
</style>
<div class="modal" id="profileModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">${sessionScope.loginUser.getUserName()}</h5>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <div style="position: relative">
                        <form id="uploadForm" enctype="multipart/form-data" action="upload-image" method="post">
                            <i id="pencilIcon" class="fas fa-pencil-alt"
                               style="position: absolute; top: 50%; left: 60%; transform: translate(-50%, -50%);background-color: #0c4128; border-radius: 50%; padding: 5px; cursor: pointer;"></i>
                            <input type="file" id="userCoverPhoto" name="userCoverPhoto" style="display:none"/>
                        </form>
                        <%--                        <img src="data:image/png;base64,${sessionScope.loginUser.getAvatar()}" alt="profile">--%>
                        <img src="data:image/jpeg;base64,${sessionScope.loginUser.getAvatar()}" alt="User Avatar"
                             style="border-radius: 50%; max-width: 100px">
                        <%--                        <img src="data:image/jpeg;base64,${sessionScope.loginUser.avatar}" alt="User Avatar"--%>
                        <%--                             style="border-radius: 50%; max-width: 100px">--%>

                    </div>
                    <h5 class="modal-title">${sessionScope.loginUser.getUserName()}</h5>
                    <form id="userDetailsForm" action="update_user_details_servlet" method="post"
                          enctype="multipart/form-data">
                        <table class="table table-success table-striped">
                            <tbody>
                            <tr>
                                <th scope="row">Fullname:</th>
                                <td><input type="text" name="fullname" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getFullName()}"/></td>
                            </tr>
                            <tr>
                                <th scope="row">Username:</th>
                                <td><input type="text" name="newUsername" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getUserName()}"/></td>
                                <input type="hidden" name="originalUsername"
                                       value="${sessionScope.loginUser.getUserName()}"/>
                            </tr>
                            <tr>
                                <th scope="row">Password:</th>
                                <td><input type="text" name="password" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getPassword()}"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Phone:</th>
                                <td><input type="text" name="mobileno" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getPhno()}"/></td>
                            </tr>

                            <tr>
                                <th scope="row">Email:</th>
                                <td>
                                    <input type="text" name="email_address" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getEmail_address()}"/>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">City:</th>
                                <td><input type="text" name="city" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getCity()}"/></td>
                            </tr>
                            <tr>
                                <th scope="row">State:</th>
                                <td><input type="text" name="state" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getState()}"/></td>
                            </tr>
                            <tr>
                                <th scope="row">Pin Code:</th>
                                <td><input type="text" name="pincode" readonly class="editable-input"
                                           value="${sessionScope.loginUser.getPincod()}"/></td>
                            </tr>

                            </tbody>

                        </table>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="editButton">Edit</button>
                            <input type="submit" class="btn btn-primary" id="saveButton" style="display: none;"
                                   value="Save"/>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>
    </div>
</div>

<script>

    document.getElementById("pencilIcon").addEventListener("click", function () {
        document.getElementById("userCoverPhoto").click();
    });

    document.getElementById("userCoverPhoto").addEventListener("change", function () {
        document.getElementById("uploadForm").submit();
    });
    document.addEventListener("DOMContentLoaded", function () {
        // Set initial state
        toggleEditable(false);
        // Toggle between read-only and editable states
        document.getElementById("editButton").addEventListener("click", function () {
            toggleEditable(true);
        });
        // Save button functionality
        document.getElementById("saveButton").addEventListener("click", function () {
            // Prevent form submission if the input fields are not editable
            if (document.querySelector('input[name="username"]').readOnly) {
                event.preventDefault();
            }
        });

        // Function to toggle between read-only and editable states
        function toggleEditable(isEditable) {
            const inputFields = document.querySelectorAll("table input");
            for (let i = 0; i < inputFields.length; i++) {
                inputFields[i].readOnly = !isEditable;
                inputFields[i].classList.toggle("read-only-input", !isEditable);
            }
            document.getElementById("saveButton").style.display = isEditable ? "inline-block" : "none";
            document.getElementById("editButton").style.display = isEditable ? "none" : "inline-block";
        }
    });
</script>