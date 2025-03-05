import requests
from app import app
from bd import db, Pelicula

API_KEY = "ff13ccfe7a1b80a7e767899382e4d763"
API_URL = f"https://api.themoviedb.org/3/movie/popular?api_key={API_KEY}&language=es&page="

def fetch_movies():
    peliculas = []
    for page in range(1, 4):  # 3 páginas para un total de 60 películas (20 por página)
        response = requests.get(API_URL + str(page))
        data = response.json()
        peliculas.extend(data['results'])
        if len(peliculas) >= 50:
            break
    return peliculas[:50]

def save_movies_to_db():
    peliculas = fetch_movies()
    with app.app_context():
        for movie in peliculas:
            nueva_pelicula = Pelicula(
                titulo=movie['title'],
                descripcion=movie['overview'],
                poster_path=movie['poster_path'],
                vote_average=movie['vote_average']
            )
            db.session.add(nueva_pelicula)
        db.session.commit()
        print("Películas insertadas correctamente!")

if __name__ == "__main__":
    save_movies_to_db()
