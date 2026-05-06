const swiper = new Swiper('.slide-container', {
    slidesPerView: 1,
    effect: "creative",
    creativeEffect: {
        prev: {
            translate: [0, 0, -400],
        },
        next: {
            translate: ["100%", 0, 0],
        },
    },
    loop: true,
    direction: "horizontal",
    autoplay: {
        delay: 8000,
        disableOnInteraction: false,
    },
    speed: 400,
    spaceBetween: 100,
});