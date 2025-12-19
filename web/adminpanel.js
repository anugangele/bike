document.addEventListener("DOMContentLoaded", function() {
    // Fetch dashboard stats and recent activities from backend
    fetchStats();
    fetchRecentActivities();
});

function fetchStats() {
    fetch('admin_backend.php?action=stats')
        .then(response => response.json())
        .then(data => {
            document.getElementById('total-bikes').textContent = data.totalBikes;
            document.getElementById('total-rentals').textContent = data.totalRentals;
            document.getElementById('total-customers').textContent = data.totalCustomers;
        })
        .catch(err => console.log("Error fetching stats:", err));
}

function fetchRecentActivities() {
    fetch('admin_backend.php?action=recent_activities')
        .then(response => response.json())
        .then(data => {
            const activitiesTable = document.getElementById('recent-activities');
            activitiesTable.innerHTML = '';  // Clear existing rows
            data.activities.forEach(activity => {
                const row = document.createElement('tr');
                row.innerHTML = `<td>₹{activity.activity}</td><td>₹{activity.date}</td>`;
                activitiesTable.appendChild(row);
            });
        })
        .catch(err => console.log("Error fetching activities:", err));
}
