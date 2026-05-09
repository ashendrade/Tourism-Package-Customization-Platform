const API_BASE = '/api';
const MOCK_USER_ID = 'user123';

document.addEventListener('DOMContentLoaded', () => {
    loadPackages();
});

async function loadPackages() {
    try {
        const response = await fetch(`${API_BASE}/packages`);
        const packages = await response.json();
        renderPackages(packages);
    } catch (error) {
        console.error('Error loading packages:', error);
        document.getElementById('package-list').innerHTML = '<p>Failed to load packages. Please ensure the backend is running.</p>';
    }
}

function renderPackages(packages) {
    const container = document.getElementById('package-list');
    if (!packages || packages.length === 0) {
        container.innerHTML = '<p class="no-data">No packages available at the moment. Please check if the data/packages.txt file is correctly populated on the server.</p>';
        console.warn('No packages received from the server.');
        return;
    }
    console.log(`Rendering ${packages.length} packages.`);
    container.innerHTML = packages.map(pkg => `
        <div class="card">
            <h3>${pkg.name}</h3>
            <p><strong>Destination:</strong> ${pkg.destination}</p>
            <p><strong>Hotel:</strong> ${pkg.hotelType}</p>
            <p><strong>Duration:</strong> ${pkg.duration} Days</p>
            <button class="btn-primary" onclick="openBookingModal('${pkg.id}', '${pkg.name}')">Book Now</button>
        </div>
    `).join('');
}

function showSection(sectionId) {
    document.getElementById('packages-section').style.display = sectionId === 'packages' ? 'block' : 'none';
    document.getElementById('bookings-section').style.display = sectionId === 'bookings' ? 'block' : 'none';
    
    if (sectionId === 'bookings') {
        loadBookings();
    }
}

async function loadBookings() {
    try {
        const response = await fetch(`${API_BASE}/bookings/user/${MOCK_USER_ID}`);
        const bookings = await response.json();
        renderBookings(bookings);
    } catch (error) {
        console.error('Error loading bookings:', error);
    }
}

function renderBookings(bookings) {
    const container = document.getElementById('booking-list');
    if (bookings.length === 0) {
        container.innerHTML = '<p>No bookings found.</p>';
        return;
    }
    container.innerHTML = bookings.map(b => `
        <div class="list-item">
            <div>
                <h4>Booking ID: ${b.id}</h4>
                <p>Package ID: ${b.packageId} | Date: ${b.bookingDate}</p>
            </div>
            <div>
                <span class="status status-${b.status.toLowerCase()}">${b.status}</span>
                ${b.status === 'PENDING' ? `<button onclick="processPayment('${b.id}')" style="margin-left:10px;">Pay Now</button>` : ''}
            </div>
        </div>
    `).join('');
}

let selectedPackage = null;

function openBookingModal(id, name) {
    selectedPackage = { id, name };
    document.getElementById('modal-details').innerHTML = `
        <p>You are booking: <strong>${name}</strong></p>
        <p>Customer ID: ${MOCK_USER_ID}</p>
    `;
    document.getElementById('booking-modal').style.display = 'block';
}

function closeModal() {
    document.getElementById('booking-modal').style.display = 'none';
}

document.getElementById('confirm-booking-btn').onclick = async () => {
    const bookingData = {
        id: 'B' + Math.floor(Math.random() * 10000),
        userId: MOCK_USER_ID,
        packageId: selectedPackage.id,
        bookingDate: new Date().toISOString().split('T')[0],
        status: 'PENDING'
    };

    try {
        const response = await fetch(`${API_BASE}/bookings`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(bookingData)
        });

        if (response.ok) {
            alert('Booking created! Please proceed to payment in "My Bookings".');
            closeModal();
            showSection('bookings');
        }
    } catch (error) {
        console.error('Error creating booking:', error);
    }
};

async function processPayment(bookingId) {
    const paymentData = {
        id: 'P' + Math.floor(Math.random() * 10000),
        amount: 500.0, // Fixed mock amount
        status: 'PENDING',
        method: 'CREDIT_CARD',
        bookingId: bookingId
    };

    try {
        const response = await fetch(`${API_BASE}/payments/pay`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(paymentData)
        });

        if (response.ok) {
            alert('Payment Successful!');
            loadBookings();
        }
    } catch (error) {
        console.error('Error processing payment:', error);
    }
}
