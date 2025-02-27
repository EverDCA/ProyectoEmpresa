from flask import Flask, render_template, redirect, request, flash, url_for
from config import Config
from bd import db, Usuario
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.config.from_object(Config)

# Inicializa la base de datos con la app
db.init_app(app)

# Rutas principales
@app.route('/')
def index():
    return redirect('/cinesucre')

@app.route('/cinesucre')
def home():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        usuario = Usuario.query.filter_by(email=email).first()
        
        if usuario and check_password_hash(usuario.password, password):
            flash('Inicio de sesión exitoso', 'success')
            return redirect('/cinesucre')
        else:
            flash('Correo o contraseña incorrectos', 'danger')

    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])
        
        nuevo_usuario = Usuario(username=username, email=email, password=password)
        db.session.add(nuevo_usuario)
        db.session.commit()
        
        flash('Registro exitoso, ahora inicia sesión', 'success')
        return redirect(url_for('login'))
    
    return render_template('register.html')

@app.route('/recover', methods=['GET', 'POST'])
def recover():
    if request.method == 'POST':
        email = request.form['email']
        usuario = Usuario.query.filter_by(email=email).first()
        
        if usuario:
            flash('Se ha enviado un enlace de recuperación al correo', 'info')
        else:
            flash('El correo no está registrado', 'warning')

    return render_template('recover.html')

@app.route('/plans')
def plans():
    return render_template('plans.html')

@app.route('/interface')
def interface():
    return render_template('interface.html')

# Iniciar la aplicación
if __name__ == '__main__':
    with app.app_context():
        db.create_all()  # Crea las tablas si no existen
    app.run(debug=True)
