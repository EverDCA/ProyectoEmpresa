from flask import Flask, render_template, redirect, request, flash, url_for, session, jsonify
from config import Config
from bd import db, Usuario, Pelicula, Empleado  # Importar el modelo Empleado
from werkzeug.security import generate_password_hash, check_password_hash
app = Flask(__name__)
app.config.from_object(Config)

app.secret_key = 'Ever123'  # Necesario para los mensajes flash
# Inicializa la base de datos con la app
db.init_app(app)

# Ruta principal
@app.route('/')
def index():
    return redirect('/cinesucre')

@app.route('/cinesucre')
def home():
    return render_template('index.html')

@app.route('/api/peliculas')
def api_peliculas():
    peliculas = Pelicula.query.limit(50).all()
    peliculas_json = [
        {
            'titulo': pelicula.titulo,
            'descripcion': pelicula.descripcion,
            'poster_path': pelicula.poster_path,
            'vote_average': pelicula.vote_average
        } for pelicula in peliculas
    ]
    return jsonify(peliculas_json)

# Login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        usuario = Usuario.query.filter_by(email=email).first()
        
        if usuario and check_password_hash(usuario.password, password):
            session['user_id'] = usuario.id  # Guarda el ID del usuario en la sesión
            flash('Inicio de sesión exitoso', 'success')
            return redirect('/interface')
        else:
            flash('Correo o contraseña incorrectos', 'danger')

    return render_template('login.html')

# Registro
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

# Recuperar contraseña
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

# Planes
@app.route('/plans')
def plans():
    return render_template('plans.html')

# Página protegida (solo usuarios logueados)
@app.route('/interface')
def interface():
    if 'user_id' not in session:
        flash('Debes iniciar sesión para acceder a esta página.', 'warning')
        return redirect('/login')
    return render_template('interface.html')



# Crear Empleado (Nuevo)
@app.route('/empleados/nuevo', methods=['GET', 'POST'])
def crear_empleado():
    if request.method == 'POST':
        try:
            nombre = request.form['nombre']
            email = request.form['email']
            telefono = request.form['telefono']
            cargo = request.form['cargo']

            nuevo_empleado = Empleado(nombre=nombre, email=email, telefono=telefono, cargo=cargo)
            db.session.add(nuevo_empleado)
            db.session.commit()

            flash('Empleado creado exitosamente', 'success')
            return redirect('/empleados')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al crear empleado: {str(e)}', 'danger')
    return render_template('nuevoEmpleado.html')

# Leer Empleados (Lista)
@app.route('/empleados', methods=['GET'])
def listar_empleados():
    empleados = Empleado.query.all()
    return render_template('empleados.html', empleados=empleados)

# Actualizar Empleado (Editar)
@app.route('/empleados/<int:id>/editar', methods=['GET', 'POST'])
def editar_empleado(id):
    empleado = Empleado.query.get_or_404(id)
    
    if request.method == 'POST':
        try:
            empleado.nombre = request.form['nombre']
            empleado.email = request.form['email']
            empleado.telefono = request.form['telefono']
            empleado.cargo = request.form['cargo']
            
            db.session.commit()
            flash('Empleado actualizado exitosamente', 'success')
            return redirect('/empleados')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al actualizar empleado: {str(e)}', 'danger')
    
    return render_template('editarEmpleado.html', empleado=empleado)

# Eliminar Empleado
@app.route('/empleados/<int:id>/eliminar', methods=['POST'])
def eliminar_empleado(id):
    try:
        empleado = Empleado.query.get_or_404(id)
        db.session.delete(empleado)
        db.session.commit()
        flash('Empleado eliminado exitosamente', 'success')
    except Exception as e:
        db.session.rollback()
        flash(f'Error al eliminar empleado: {str(e)}', 'danger')

    return redirect('/empleados')



# Cerrar sesión
@app.route('/logout')
def logout():
    session.pop('user_id', None)
    flash('Has cerrado sesión exitosamente.', 'info')
    return redirect('/login')





# Iniciar la aplicación
if __name__ == '__main__':
    with app.app_context():
        db.create_all()  # Crea las tablas si no existen
    app.run(debug=True)
