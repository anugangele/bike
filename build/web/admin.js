document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();
    clearErrors();

    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    let valid = true;

    if (username === "") {
        showError("usernameError", "Username is required.");
        valid = false;
    }
    if (password === "") {
        showError("passwordError", "Password is required.");
        valid = false;
    }

    if (valid) {
        if (username === "admin" && password === "admin123") {
            alert("Login Successful!");
            
            window.location.href = "dashboard.html"; 
        } else {
            alert("Invalid username or password.");
        }
    }
});

function showError(id, message) {
    document.getElementById(id).textContent = message;
    document.getElementById(id).style.display = "block";
}

function clearErrors() {
    let errorMessages = document.getElementsByClassName("error");
    for (let msg of errorMessages) {
        msg.style.display = "none";
    }
}
