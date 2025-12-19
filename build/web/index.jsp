<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Rental Service</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <header>
        <h1>Bike Rental</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
               
                <li><a href="pricelist.jsp">Pricing</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="reg.html">Registration</a></li>
            </ul>
        </nav>
    </header>
    <section class="bike-selection" >
        <h2>Select Your Bike</h2>
        <div class="bike-card">
            <img src="./images/BAJAJ DOMINAR 250 BS6 2024 MODEL.png" alt="Mountain Bike">
            <h3>Mountain Bike</h3>
            <p>?15/day</p>
            <button onclick="alert('Login first')" class="btn btn-primary">Rent Now</button>
        </div>
        <div class="bike-card">
            <img src="./images/HONDA ACTIVA 6G (BS6) 2024 MODEL.png" alt="Road Bike">
            <h3>Road Bike</h3>
            <p>?20/day</p>
            <button class="btn btn-primary" onclick="alert('Login first')">Rent Now</button>
        </div>
         
        
         <div class="bike-card">
            <img src="./images/HONDA ACTIVA 6G (BS6) 2024 MODEL.png" alt="Road Bike">
            <h3>Road Bike</h3>
            <p>?20/day</p>
            <button onclick="alert('Login first')" class="btn btn-primary">Rent Now</button>
        </div>
         <div class="bike-card">
            <img src="./images/HONDA ACTIVA 6G (BS6) 2024 MODEL.png" alt="Road Bike">
            <h3>Road Bike</h3>
            <p>?20/day</p>
            <button onclick="alert('Login first')" class="btn btn-primary">Rent Now</button>
        </div>
    </section>

   
    <footer>
        <p>© 2025 Bike Rental</p>
    </footer>

    <script src="script.js"></script>
</body>
</html>
