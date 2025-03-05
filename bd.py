from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Modelo para Usuarios
class Usuario(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)

# Modelo para Películas
class Pelicula(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(200), nullable=False)
    descripcion = db.Column(db.Text, nullable=True)
    poster_path = db.Column(db.String(200), nullable=False)
    vote_average = db.Column(db.Float, nullable=False)
    
class Empleado(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # Agregado autoincrement=True
    nombre = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    telefono = db.Column(db.String(20), nullable=True)
    cargo = db.Column(db.String(50), nullable=False)
    

