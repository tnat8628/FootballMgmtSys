document.addEventListener('DOMContentLoaded', () => {
    const carouselElement = document.querySelector('#carouselExampleIndicators');
    if (carouselElement) {
        new bootstrap.Carousel(carouselElement, {
            interval: 3000, // Tự động trượt mỗi 3 giây
            ride: 'carousel'
        });
    }
});
