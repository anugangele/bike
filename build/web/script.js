// Function to handle bike selection
function selectBike(bike, pricePerDay) {
    // Set the selected bike type in the rental form
    document.getElementById('bike').value = bike;
    // Reset rental days input to prompt user to enter how many days they want to rent
    document.getElementById('days').value = '';
    // Store price per day for future use (used for total price calculation)
    document.getElementById('rental-form').dataset.pricePerDay = pricePerDay;
    // Optionally, show a message to the user
    alert(`You have selected ${bike} for ₹${pricePerDay}/day. Please enter the number of rental days.`);
}

// Handle form submission
document.getElementById('rental-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form from submitting normally

    // Get user input values
    const name = document.getElementById('name').value;
    const days = parseInt(document.getElementById('days').value);
    const bike = document.getElementById('bike').value;
    const pricePerDay = parseInt(this.dataset.pricePerDay);

    // Basic validation for form fields
    if (!name || !days || !bike) {
        alert("Please fill out all fields.");
        return; // Stop further execution if any field is missing
    }

    // Ensure that the number of rental days is positive
    if (days <= 0) {
        alert("Please enter a valid number of rental days.");
        return;
    }

    // Calculate the total price
    const totalPrice = pricePerDay * days;

    // Show confirmation with rental details
    alert(`Thank you, ₹{name}! You have rented the ₹{bike} for ₹{days} days. Total price: ₹₹{totalPrice}`);
});

// Optional: Add real-time total price calculation as user types in the rental days
document.getElementById('days').addEventListener('input', function() {
    const days = parseInt(this.value);
    const pricePerDay = parseInt(document.getElementById('rental-form').dataset.pricePerDay);
    if (days && pricePerDay) {
        const totalPrice = pricePerDay * days;
        const totalPriceDisplay = document.getElementById('total-price');
        if (!totalPriceDisplay) {
            const priceDiv = document.createElement('div');
            priceDiv.id = 'total-price';
            priceDiv.style.marginTop = '10px';
            priceDiv.innerText = `Total Price: ₹₹{totalPrice}`;
            document.querySelector('.rental-form').appendChild(priceDiv);
        } else {
            totalPriceDisplay.innerText = `Total Price: ₹₹{totalPrice}`;
        }
    }
});
