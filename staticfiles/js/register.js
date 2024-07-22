document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('signupForm');
    const password1 = form.querySelector('[name=password1]');
    const passwordHelp = document.getElementById('passwordHelp');

    // Show help text when user starts typing
    password1.addEventListener('focus', function() {
        passwordHelp.style.display = 'block';
    });

    // Hide help text when user finishes typing
    password1.addEventListener('blur', function() {
        passwordHelp.style.display = 'none';
    });

    // Check for password validity and update help text
    password1.addEventListener('input', function() {
        const passwordValue = password1.value;
        const minLength = 8;
        const isValid = passwordValue.length >= minLength;
        
        if (passwordValue.length > 0) {
            if (isValid) {
                passwordHelp.innerText = 'Password is strong.';
                passwordHelp.style.color = 'green';
            } else {
                passwordHelp.innerText = `Password must be at least ${minLength} characters long.`;
                passwordHelp.style.color = 'red';
            }
        } else {
            passwordHelp.innerText = 'Password must be at least 8 characters long.';
            passwordHelp.style.color = '#6c757d';
        }
    });

    form.addEventListener('submit', function(event) {
        let valid = true;

        // Remove previous error messages
        document.querySelectorAll('.form-field .errorlist').forEach(element => element.remove());

        // Client-side validation
        const formData = new FormData(form);
        const email = formData.get('email');
        const password1 = formData.get('password1');
        const password2 = formData.get('password2');

        if (!email) {
            valid = false;
            const emailInput = form.querySelector('[name=email]');
            const errorElement = document.createElement('div');
            errorElement.className = 'errorlist';
            errorElement.innerText = 'This field is required.';
            emailInput.parentNode.appendChild(errorElement);
        } else if (!/\S+@\S+\.\S+/.test(email)) {
            valid = false;
            const emailInput = form.querySelector('[name=email]');
            const errorElement = document.createElement('div');
            errorElement.className = 'errorlist';
            errorElement.innerText = 'Enter a valid email address.';
            emailInput.parentNode.appendChild(errorElement);
        }
        
        if (!password1) {
            valid = false;
            const password1Input = form.querySelector('[name=password1]');
            const errorElement = document.createElement('div');
            errorElement.className = 'errorlist';
            errorElement.innerText = 'This field is required.';
            password1Input.parentNode.appendChild(errorElement);
        } else if (password1.length < 8) {
            valid = false;
            const password1Input = form.querySelector('[name=password1]');
            const errorElement = document.createElement('div');
            errorElement.className = 'errorlist';
            errorElement.innerText = 'Password must be at least 8 characters long.';
            password1Input.parentNode.appendChild(errorElement);
        }
        
        if (password1 !== password2) {
            valid = false;
            const password2Input = form.querySelector('[name=password2]');
            const errorElement = document.createElement('div');
            errorElement.className = 'errorlist';
            errorElement.innerText = 'Passwords do not match.';
            password2Input.parentNode.appendChild(errorElement);
        }

        if (!valid) {
            event.preventDefault();  // Prevent form from being submitted
        }
    });
});
