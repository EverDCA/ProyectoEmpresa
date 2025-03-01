const API_KEY = "ff13ccfe7a1b80a7e767899382e4d763";
const API_URL = `https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}&language=es&page=1`;

const carouselContainer = document.getElementById("carouselContainer");
const carouselWrapper = document.getElementById("carouselWrapper");

let movies = [];
let position = 0;
let isPaused = false;
let speed = 0.9;

async function getMovies() {
    const response = await fetch(API_URL);
    const data = await response.json();
    movies = data.results.slice(0, 50);
    renderMovies();
    animateCarousel();
}

function renderMovies() {
    carouselContainer.innerHTML = "";
    movies.forEach(movie => createMovieCard(movie));
    movies.slice(0, 6).forEach(movie => createMovieCard(movie)); // Duplicar para efecto infinito
}

function createMovieCard(movie) {
    const movieCard = document.createElement("div");
    movieCard.className = "w-60 flex-shrink-0 rounded-xl shadow-lg bg-white overflow-hidden transform transition-transform duration-300 hover:scale-105";

    movieCard.innerHTML = `
        <div class='h-80 bg-gradient-to-r from-indigo-300 to-purple-400 flex justify-center items-center'>
            <img src="https://image.tmdb.org/t/p/w500${movie.poster_path}" alt="${movie.title}" class="w-full h-full object-cover rounded-t-xl">
        </div>
        <div class="p-4 text-center text-gray-800">
            <h2 class="text-lg font-bold">${movie.title}</h2>
            <div class="flex items-center justify-center gap-1">
                <img src="/static/img/star.svg" class="w-5 h-5">
                <p class="text-gray-500 font-semibold">${movie.vote_average}</p>
            </div>
        </div>
    `;

    carouselContainer.appendChild(movieCard);
}

function animateCarousel() {
    if (!isPaused) {
        position -= speed;
        if (Math.abs(position) >= movies.length * 260) {
            position = 0;
        }
        carouselContainer.style.transform = `translateX(${position}px)`;
    }
    requestAnimationFrame(animateCarousel);
}

// Pausar al pasar el mouse
carouselWrapper.addEventListener("mouseenter", () => isPaused = true);
carouselWrapper.addEventListener("mouseleave", () => isPaused = false);

// Iniciar
getMovies();
