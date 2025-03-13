const API_URL = "/api/peliculas";
const carouselContainer = document.getElementById("carouselContainer");
const carouselWrapper = document.getElementById("carouselWrapper");

let movies = [];
let position = 0;
let isPaused = false;
let speed = window.innerWidth < 640 ? 0.5 : 0.9;

async function getMovies() {
    const response = await fetch(API_URL);
    const data = await response.json();
    movies = data.slice(0, 15);
    renderMovies();
    requestAnimationFrame(animateCarousel); // Iniciar animación solo después de cargar
}

function renderMovies() {
    carouselContainer.innerHTML = "";
    movies.forEach(movie => createMovieCard(movie));
    movies.slice(0, 6).forEach(movie => createMovieCard(movie)); // Para efecto infinito
}

function createMovieCard(movie) {
    const movieCard = document.createElement("div");
    movieCard.className = "w-40 sm:w-60 flex-shrink-0 rounded-xl shadow-lg bg-white overflow-hidden transition-transform duration-300 hover:scale-105";

    movieCard.innerHTML = `
        <div class='h-64 sm:h-80 bg-gradient-to-r from-indigo-300 to-purple-400 flex justify-center items-center'>
            <img src="https://image.tmdb.org/t/p/w500${movie.poster_path}" alt="${movie.titulo}" class="w-full h-full object-cover rounded-t-xl">
        </div>
        <div class="p-4 text-center text-gray-800">
            <h2 class="text-sm sm:text-lg font-bold">${movie.titulo}</h2>
            <div class="flex items-center justify-center gap-1">
                <img src="/static/img/star.svg" class="w-4 sm:w-5 h-4 sm:h-5">
                <p class="text-gray-500 font-semibold">${movie.vote_average}</p>
            </div>
        </div>
    `;

    carouselContainer.appendChild(movieCard);
}

function animateCarousel() {
    if (!isPaused) {
        position -= speed;

        const maxScroll = -carouselContainer.scrollWidth / 2; // Limitar desplazamiento
        if (position <= maxScroll) position = 0;

        carouselContainer.style.transform = `translateX(${position}px)`;
    }
    requestAnimationFrame(animateCarousel);
}

// Pausar animación al pasar el mouse
carouselWrapper.addEventListener("mouseenter", () => isPaused = true);
carouselWrapper.addEventListener("mouseleave", () => isPaused = false);

getMovies();
