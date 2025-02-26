from flask import Flask, render_template, redirect
from flask_sqlalchemy import SQLAlchemy
from config import Config
from models.user import db
from routes.auth import auth_bp

app = Flask(__name__)
app.config.from_object(Config)  # Cargar configuración de la base de datos
db.init_app(app)  # Inicializar SQLAlchemy

# Registrar Blueprints
app.register_blueprint(auth_bp)

@app.route('/')
def index():
    return redirect('/cinesucre')

@app.route('/cinesucre')
def home():
    return render_template('index.html')

@app.route('/plans')
def plans():
    return render_template('plans.html')

if __name__ == '__main__':
    with app.app_context():
        db.create_all()  # Crea las tablas en la base de datos si no existen
    app.run(debug=True)
