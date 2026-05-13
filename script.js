document.addEventListener('DOMContentLoaded', () => {

    const wrapper = document.querySelector('.wrapper');
    const loginLink = document.querySelector('.login-link');
    const registerLink = document.querySelector('.register-link');
    const btnpopup = document.querySelector('.btnLogin-popup');
    const iconClose = document.querySelector('.icon-close');
    const btnLogout = document.querySelector('.btnLogout');

    registerLink.addEventListener('click', () => {
        wrapper.classList.add('active');
    });

    loginLink.addEventListener('click', () => {
        wrapper.classList.remove('active');
    });

    btnpopup.addEventListener('click', () => {
        wrapper.classList.add('active-popup');
    });

    iconClose.addEventListener('click', () => {
        wrapper.classList.remove('active-popup');
    });

    // Login button
    document.querySelector('.form-box.login .btn').addEventListener('click', () => {
        btnpopup.style.display = 'none';
        btnLogout.style.display = 'block';
        wrapper.classList.remove('active-popup');
    });

    // Register button
    document.querySelector('.form-box.Register .btn').addEventListener('click', () => {
        btnpopup.style.display = 'none';
        btnLogout.style.display = 'block';
        wrapper.classList.remove('active-popup');
    });

    // Logout button
    btnLogout.addEventListener('click', () => {
        btnpopup.style.display = 'block';
        btnLogout.style.display = 'none';
    });

});

// Review slider
var reviewSwiper = new Swiper(".review-slider", {
    slidesPerView: 3,
    spaceBetween: 30,
    loop: true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
    },
    breakpoints: {
        0: {
            slidesPerView: 1,
        },
        768: {
            slidesPerView: 2,
        },
        1024: {
            slidesPerView: 3,
        },
    },
});