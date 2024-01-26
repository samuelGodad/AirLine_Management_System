
    // JavaScript function to show an error message and focus on the login form
    function showErrorAndFocus(errorMessage) {
    // var errorMessage = '<%= request.getAttribute("errorMessage") %>'; // Get the error message from JSP
    if (errorMessage && errorMessage.trim() !== '' && errorMessage !== 'null') {
        // Error message is present, display it in the div
        document.getElementById('errorMessage').innerText = errorMessage;
        // Focus on the admin_name input field (adjust the ID if needed)
        const inputField = document.getElementById('adminname') || document.getElementById('u_name')|| document.getElementById('username');
        if (inputField) {
            inputField.focus();
        }
    }
}
    // Call the function on page load
    window.onload = function() {
    var errorMessage = '<%= request.getAttribute("errorMessage") %>';
    if (errorMessage && errorMessage.trim() !== '' && errorMessage !== 'null') {
    showErrorAndFocus();
}
};
