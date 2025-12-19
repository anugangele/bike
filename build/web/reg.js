

    let hasError = false;

    // Full Name Validation
    let name = document.getElementById('name').value;
    if (name === "") {
        document.getElementById('nameError').textContent = "Full Name is required.";
        document.getElementById('nameError').style.display = 'block';
        hasError = true;
    }

    // Email Validation with Regex
    let email = document.getElementById('email').value;
    let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!email.match(emailPattern)) {
        document.getElementById('emailError').textContent = "Please enter a valid email address.";
        document.getElementById('emailError').style.display = 'block';
        hasError = true;
    }

    // City Validation
    let city = document.getElementById('city').value;
    if (city === "") {
        document.getElementById('cityerror').textContent = "City is required.";
        document.getElementById('cityerror').style.display = 'block';
        hasError = true;
    }

    // Phone Validation (Basic format checking for numbers only)
    let phone = document.getElementById('phone').value;
    let phonePattern = /^[0-9]{10}$/;
    if (!phone.match(phonePattern)) {
        document.getElementById('phoneError').textContent = "Please enter a valid 10-digit phone number.";
        document.getElementById('phoneError').style.display = 'block';
        hasError = true;
    }

    // Aadhar Number Validation
    let aadhar = document.getElementById('aadhar').value;
    let aadharPattern = /^[0-9]{12}$/;
    if (!aadhar.match(aadharPattern)) {
        document.getElementById('AadharError').textContent = "Aadhar number must be 12 digits.";
        document.getElementById('AadharError').style.display = 'block';
        hasError = true;
    }

    // License Number Validation
    let license = document.getElementById('license').value;
    if (license === "") {
        document.getElementById('licenseError').textContent = "License number is required.";
        document.getElementById('licenseError').style.display = 'block';
        hasError = true;
    }

    

    // If no errors, simulate form submission
    if (!hasError) {
        // Simulating form submission (you can use AJAX here)
        alert("Registration Successful!");

        // You can reset the form here if you like:
        document.getElementById('registrationForm').reset();

        // Optionally, show a success message
        showSuccessMessage();
    }


// Real-time Validation (for fields like phone, email, etc.)
document.getElementById('phone').addEventListener('input', function() {
    let phone = document.getElementById('phone').value;
    let phonePattern = /^[0-9]{10}$/;
    if (!phone.match(phonePattern)) {
        document.getElementById('phoneError').textContent = "Phone number must be 10 digits.";
        document.getElementById('phoneError').style.display = 'block';
    } else {
        document.getElementById('phoneError').style.display = 'none';
    }
});

document.getElementById('email').addEventListener('input', function() {
    let email = document.getElementById('email').value;
    let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!email.match(emailPattern)) {
        document.getElementById('emailError').textContent = "Please enter a valid email.";
        document.getElementById('emailError').style.display = 'block';
    } else {
        document.getElementById('emailError').style.display = 'none';
    }
});

// Display success message after successful submission
function showSuccessMessage() {
    let successMessage = document.createElement('div');
    successMessage.classList.add('success');
    successMessage.textContent = "Registration Completed Successfully! You can now rent a bike.";
    document.querySelector('.container').appendChild(successMessage);
    
    // Remove success message after 5 seconds
 
}
