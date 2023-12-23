document.querySelector('form').addEventListener('submit', function(event) {
    const inputs = this.querySelectorAll('input[required]');
    for (let i = 0; i < inputs.length; i++) {
        if (!inputs[i].value) {
            event.preventDefault();
            inputs[i].focus();
            break;
        }
    }
});