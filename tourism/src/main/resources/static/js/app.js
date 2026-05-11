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
    document.getElementById('transactions-section').style.display = sectionId === 'transactions' ? 'block' : 'none';
    
    if (sectionId === 'bookings') {
        loadBookings();
    } else if (sectionId === 'transactions') {
        loadTransactions();
    }
}

async function loadTransactions() {
    try {
        // Corrected port to 5000 and added userId filter
        const response = await fetch(`http://localhost:5000/api/history?userId=${MOCK_USER_ID}`);
        if (!response.ok) throw new Error('Failed to fetch transaction history');
        
        const transactions = await response.json();
        const tableBody = document.getElementById('transaction-body');
        
        if (!transactions || transactions.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="5" style="text-align:center;">No transactions found.</td></tr>';
            return;
        }

        // Map fields to match MongoDB schema (t._id and t.createdAt)
        tableBody.innerHTML = transactions.map(t => `
            <tr>
                <td>${t._id}</td>
                <td>${t.bookingId}</td>
                <td>${new Date(t.createdAt).toLocaleDateString()}</td>
                <td>$${t.amount.toFixed(2)}</td>
                <td><span class="status status-${t.status.toLowerCase()}">${t.status}</span></td>
            </tr>
        `).join('');

    } catch (error) {
        console.error('Error loading transactions:', error);
        const tableBody = document.getElementById('transaction-body');
        if (tableBody) {
            tableBody.innerHTML = `<tr><td colspan="5" style="text-align:center; color:red;">Error: ${error.message}</td></tr>`;
        }
    }
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
    if (!selectedPackage) return;

    const payBtn = document.getElementById('confirm-booking-btn');
    const originalText = payBtn.innerText;
    payBtn.innerText = 'Redirecting to Payment...';
    payBtn.disabled = true;

    try {
        // Step 1: Create a pending booking in our backend
        const bookingData = {
            id: 'B' + Math.floor(Math.random() * 10000),
            userId: MOCK_USER_ID,
            packageId: selectedPackage.id,
            bookingDate: new Date().toISOString().split('T')[0],
            status: 'PENDING'
        };

        const bookingResponse = await fetch(`${API_BASE}/bookings`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(bookingData)
        });

        if (!bookingResponse.ok) throw new Error('Failed to create local booking');

        // Step 2: Securely call Node.js backend for Stripe Session
        const stripeResponse = await fetch('http://localhost:5000/api/create-checkout-session', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                customerId: MOCK_USER_ID,
                packageId: selectedPackage.id,
                bookingId: bookingData.id,
                amount: 500.0, // Should ideally be fetched from backend
                packageName: selectedPackage.name
            })
        });

        const result = await stripeResponse.json();
        
        if (stripeResponse.ok && result.url) {
            window.location.href = result.url;
        } else {
            throw new Error(result.error || 'Failed to initiate Stripe session');
        }

    } catch (error) {
        console.error('Checkout Error:', error);
        alert('Checkout failed: ' + error.message);
    } finally {
        payBtn.innerText = originalText;
        payBtn.disabled = false;
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
