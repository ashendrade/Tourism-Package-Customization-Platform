document.addEventListener('DOMContentLoaded', () => {
    const wrapper = document.querySelector('.wrapper');
    const loginLink = document.querySelector('.login-link');
    const registerLink = document.querySelector('.register-link');
    const btnpopup = document.querySelector('.btnLogin-popup');
    const iconClose = document.querySelector('.icon-close');
    const btnLogout = document.querySelector('.btnLogout');
    const profileLink = document.querySelector('.profile-link');

    const updateUI = (isLoggedIn) => {
        const reviewForm = document.querySelector('.login-only');
        if (isLoggedIn) {
            if (btnpopup) btnpopup.style.display = 'none';
            if (btnLogout) btnLogout.style.display = 'block';
            if (profileLink) profileLink.style.display = 'block';
            if (reviewForm) reviewForm.style.display = 'flex';
        } else {
            if (btnpopup) btnpopup.style.display = 'block';
            if (btnLogout) btnLogout.style.display = 'none';
            if (profileLink) profileLink.style.display = 'none';
            if (reviewForm) reviewForm.style.display = 'none';
        }
    };

    const user = localStorage.getItem('loggedInUser');
    updateUI(!!user);

    if (registerLink) {
        registerLink.addEventListener('click', () => wrapper.classList.add('active'));
    }
    if (loginLink) {
        loginLink.addEventListener('click', () => wrapper.classList.remove('active'));
    }
    if (btnpopup) {
        btnpopup.addEventListener('click', () => wrapper.classList.add('active-popup'));
    }
    if (iconClose) {
        iconClose.addEventListener('click', () => wrapper.classList.remove('active-popup'));
    }

    // LOGIN
    const loginBtn = document.querySelector('.form-box.login .btn');
    if (loginBtn) {
        loginBtn.addEventListener('click', async (e) => {
            e.preventDefault();
            const email = document.querySelector('.form-box.login input[type="email"]').value;
            const password = document.querySelector('.form-box.login input[type="password"]').value;
            try {
                const res = await fetch('/api/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ email, password })
                });
                const data = await res.json();
                if (data.success) {
                    localStorage.setItem('loggedInUser', data.username);
                    updateUI(true);
                    wrapper.classList.remove('active-popup');
                    alert('Welcome, ' + data.username + '!');
                    await loadReviews();
                } else {
                    alert(data.error);
                }
            } catch (err) {
                alert("Server error. Make sure your node server is running!");
            }
        });
    }

    // REGISTER
    const registerBtn = document.querySelector('.form-box.Register .btn');
    if (registerBtn) {
        registerBtn.addEventListener('click', async (e) => {
            e.preventDefault();
            const username = document.querySelector('.form-box.Register input[type="text"]').value;
            const email = document.querySelector('.form-box.Register input[type="email"]').value;
            const password = document.querySelector('.form-box.Register input[type="password"]').value;
            try {
                const res = await fetch('/api/register', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ username, email, password })
                });
                const data = await res.json();
                if (data.success) {
                    alert('Registered successfully! Please log in.');
                    wrapper.classList.remove('active');
                } else {
                    alert('Error: ' + data.error);
                }
            } catch (err) {
                alert("Server error. Make sure your node server is running!");
            }
        });
    }

    // LOGOUT
    if (btnLogout) {
        btnLogout.addEventListener('click', () => {
            localStorage.removeItem('loggedInUser');
            updateUI(false);
            loadReviews();
        });
    }

    // Load reviews on page load
    loadReviews();
});

// SUBMIT REVIEW
const submitReviewBtn = document.getElementById('submitReview');
if (submitReviewBtn) {
    submitReviewBtn.addEventListener('click', async () => {
        const name = document.getElementById('reviewName').value;
        const tour = document.getElementById('reviewTour').value;
        const rating = document.getElementById('reviewRating').value;
        const text = document.getElementById('reviewText').value;
        const currentUser = localStorage.getItem('loggedInUser');

        if (!name || !tour || !text) {
            alert('Please fill in all fields!');
            return;
        }

        const res = await fetch('/api/reviews', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name, tour, rating, text, postedBy: currentUser })
        });

        const data = await res.json();
        if (data.success) {
            alert('Review submitted!');
            location.reload();
        } else {
            alert('Error: ' + data.error);
        }
    });
}

// LOAD REVIEWS
async function loadReviews() {
    const swiperWrapper = document.querySelector('.review-slider .swiper-wrapper');
    const currentUser = localStorage.getItem('loggedInUser');

    // ✅ Destroy existing swiper first
    if (window.reviewSwiper) {
        window.reviewSwiper.destroy(true, true);
        window.reviewSwiper = null;
    }

    // ✅ Remove only previously dynamically added slides, keep hardcoded ones
    const dynamicSlides = swiperWrapper.querySelectorAll('.dynamic-slide');
    dynamicSlides.forEach(slide => slide.remove());

    try {
        const res = await fetch('/api/reviews');
        const reviews = await res.json();

        if (reviews && reviews.length > 0) {
            reviews.forEach((review, index) => {
                const stars = parseInt(review.rating);
                const starsHTML = Array.from({length: 5}, (_, i) =>
                    `<i class="${i < stars ? 'fas' : 'far'} fa-star"></i>`
                ).join('');

                let deleteBtn = '';
                if (currentUser && review.postedBy) {
                    if (review.postedBy.trim().toLowerCase() === currentUser.trim().toLowerCase()) {
                        deleteBtn = `<button class="delete-review-btn" onclick="deleteReview(${index})">🗑️ Delete</button>`;
                    }
                }

                // ✅ Mark dynamic slides with a class so we can remove them on reload
                swiperWrapper.innerHTML += `
                <div class="swiper-slide dynamic-slide">
                    <div class="review-card">
                        <div class="review-stars">${starsHTML}</div>
                        <p class="review-text">"${review.text}"</p>
                        <div class="review-profile">
                            <div class="review-info">
                                <h4>${review.name}</h4>
                                <p>${review.tour}</p>
                            </div>
                        </div>
                        ${deleteBtn}
                    </div>
                </div>`;
            });
        }
    } catch (e) {
        console.log('Could not load dynamic reviews:', e);
    }

    // ✅ Reinitialize swiper after all slides are in DOM
    window.reviewSwiper = new Swiper(".review-slider", {
        slidesPerView: 3,
        spaceBetween: 30,
        loop: true,
        autoplay: { delay: 3000 },
        breakpoints: {
            0: { slidesPerView: 1 },
            768: { slidesPerView: 2 },
            1024: { slidesPerView: 3 }
        }
    });
}

// DELETE REVIEW
async function deleteReview(index) {
    if (!confirm('Are you sure you want to delete this review?')) return;
    const currentUser = localStorage.getItem('loggedInUser');

    const res = await fetch(`/api/reviews/${index}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ currentUser: currentUser })
    });

    const data = await res.json();
    if (data.success) {
        alert('Review deleted!');
        location.reload();
    } else {
        alert('❌ ' + data.error);
    }
}