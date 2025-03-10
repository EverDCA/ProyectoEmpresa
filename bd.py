from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Modelo para Usuarios
class Usuario(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    activo = db.Column(db.Boolean, default=True)  # Campo activo/inactivo

# Modelo Categoria
class Categoria(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(50), nullable=False, unique=True)
    descripcion = db.Column(db.String(200), nullable=True)
    activo = db.Column(db.Boolean, default=True)  # Campo activo/inactivo

    # Relación inversa para acceder a las películas de una categoría
    peliculas = db.relationship('Pelicula', backref='categoria', lazy=True)

# Modelo Pelicula
class Pelicula(db.Model):
    __tablename__ = 'pelicula'  # Asegúrate de que el nombre coincida con la tabla en la BD

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # Clave primaria única
    titulo = db.Column(db.String(200), nullable=False)
    descripcion = db.Column(db.Text, nullable=True)
    poster_path = db.Column(db.String(200), nullable=False)
    vote_average = db.Column(db.Float, nullable=False)
    categoria_id = db.Column(db.Integer, db.ForeignKey('categoria.id'), nullable=True)

    # Campo para estado activo/inactivo
    activo = db.Column(db.Boolean, default=True)


# Modelo Empleado
class Empleado(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    telefono = db.Column(db.String(20), nullable=True)
    cargo = db.Column(db.String(50), nullable=False)
    activo = db.Column(db.Boolean, default=True)  # Campo activo/inactivo

# Modelo Cliente
class Cliente(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)
    telefono = db.Column(db.String(20), nullable=True)
    direccion = db.Column(db.String(250), nullable=True)
    fecha_registro = db.Column(db.DateTime, default=db.func.current_timestamp())
    activo = db.Column(db.Boolean, default=True)  # Campo activo/inactivo
