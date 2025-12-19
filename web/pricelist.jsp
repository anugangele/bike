<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Rental - Bike List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .bike-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <input type="button" onclick="window.location.href='index.jsp'" class="btn btn-danger" value="Home Page">
        <h2 class="text-center mb-4">Available Bikes for Rent</h2>
        <div class="row">
            <!-- Bike 1 -->
            <div class="col-md-4">
                <div class="card bike-card">
                    <img src="./images/BAJAJ DOMINAR 250 BS6 2024 MODEL.png" alt="Bike 1">
                    <div class="card-body">
                        <h5 class="card-title">BAJAJ DOMINAR 250</h5>
                        <p class="card-text">Price: ?1500/day</p>
                        <p class="card-text">Booking Amount: ?500</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <!-- Bike 2 -->
            <div class="col-md-4">
                <div class="card bike-card">
                    <img src="./images/YAMAHA FASCINO.jpeg" alt="Bike 2">
                    <div class="card-body">
                        <h5 class="card-title">YAMAHA FASCINO</h5>
                        <p class="card-text">Price: ?1800/day</p>
                        <p class="card-text">Booking Amount: ?600</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <!-- Bike 3 -->
            <div class="col-md-4">
                <div class="card bike-card">
                    <img src="./images/TVS JUPITAR.jpg" alt="Bike 3">
                    <div class="card-body">
                        <h5 class="card-title">TVS JUPITAR</h5>
                        <p class="card-text">Price: ?2000/day</p>
                        <p class="card-text">Booking Amount: ?700</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Bike 1 -->
            <div class="col-md-4">
                <div class="card bike-card">
                    <img src="./images/Honda Activa.png" alt="Bike 1">
                    <div class="card-body">
                        <h5 class="card-title">Honda Activa</h5>
                        <p class="card-text">Price: ?1500/day</p>
                        <p class="card-text">Booking Amount: ?500</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <!-- Bike 2 -->
            <div class="col-md-4">
                <div class="card bike-card">
                    <img src="./images/HONDA SHINE 100 (BS6)2024 MODEL.png" alt="Bike 2">
                    <div class="card-body">
                        <h5 class="card-title">HONDA SHINE 100 (BS6)2024 MODEL</h5>
                        <p class="card-text">Price: ?1800/day</p>
                        <p class="card-text">Booking Amount: ?600</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <!-- Bike 3 -->
            <div class="col-md-4">
                <div class="card bike-card">
                    <img src="./images/HONDA ACTIVA 6G (BS6) 2024 MODEL.png" alt="Bike 3">
                    <div class="card-body">
                        <h5 class="card-title">HONDA ACTIVA 6G (BS6) 2024</h5>
                        <p class="card-text">Price: ?2000/day</p>
                        <p class="card-text">Booking Amount: ?700</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
        
        
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>