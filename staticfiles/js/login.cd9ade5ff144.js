function validateEmail() {
    const emailField = document.getElementById('id_email');
    const emailValue = emailField.value;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailPattern.test(emailValue)) {
        alert('Please enter a valid email address.');
        emailField.focus();
        return false;
    }
    return true;
}
