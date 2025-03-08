from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Modelo para Usuarios
class Usuario(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)

# Modelo para Películas
# Modelo Categoria
class Categoria(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(50), nullable=False, unique=True)
    descripcion = db.Column(db.String(200), nullable=True)
    
    # Relación inversa para acceder a las películas de una categoría
    peliculas = db.relationship('Pelicula', backref='categoria', lazy=True)

# Modelo Pelicula
class Pelicula(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(200), nullable=False)
    descripcion = db.Column(db.Text, nullable=True)
    poster_path = db.Column(db.String(200), nullable=False)
    vote_average = db.Column(db.Float, nullable=False)
    
    # Campo para la clave foránea (relación con Categoria)
    categoria_id = db.Column(db.Integer, db.ForeignKey('categoria.id'), nullable=True)

    
class Empleado(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # Agregado autoincrement=True
    nombre = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    telefono = db.Column(db.String(20), nullable=True)
    cargo = db.Column(db.String(50), nullable=False)
    
    
class Cliente(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)
    telefono = db.Column(db.String(20), nullable=True)
    direccion = db.Column(db.String(250), nullable=True)
    fecha_registro = db.Column(db.DateTime, default=db.func.current_timestamp())

