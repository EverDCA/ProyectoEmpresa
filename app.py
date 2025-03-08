from flask import Flask, render_template, redirect, request, flash, url_for, session, jsonify
from config import Config
from bd import db, Usuario, Pelicula, Empleado,Categoria,Cliente  # Importar el modelo Empleado
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

#CRUD CATEGORIAS
# Crear Categoría (Nuevo)
@app.route('/categorias/nueva', methods=['GET', 'POST'])
def crear_categoria():
    if request.method == 'POST':
        try:
            nombre = request.form['nombre']
            descripcion = request.form.get('descripcion', '')  # Descripción opcional

            nueva_categoria = Categoria(nombre=nombre, descripcion=descripcion)
            db.session.add(nueva_categoria)
            db.session.commit()

            flash('Categoría creada exitosamente', 'info')
            return redirect('/categorias')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al crear categoría: {str(e)}', 'danger')
    return render_template('nuevaCategoria.html')


# Leer Categorías (Lista)
@app.route('/categorias', methods=['GET'])
def listar_categorias():
    categorias = Categoria.query.all()
    return render_template('categorias.html', categorias=categorias)


# Actualizar Categoría (Editar)
@app.route('/categorias/<int:id>/editar', methods=['GET', 'POST'])
def editar_categoria(id):
    categoria = Categoria.query.get_or_404(id)

    if request.method == 'POST':
        try:
            categoria.nombre = request.form['nombre']
            categoria.descripcion = request.form.get('descripcion', '')  # Descripción opcional

            db.session.commit()
            flash('Categoría actualizada exitosamente', 'success')
            return redirect('/categorias')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al actualizar categoría: {str(e)}', 'danger')

    return render_template('editarCategoria.html', categoria=categoria)


# Eliminar Categoría
@app.route('/categorias/<int:id>/eliminar', methods=['POST'])
def eliminar_categoria(id):
    try:
        categoria = Categoria.query.get_or_404(id)
        db.session.delete(categoria)
        db.session.commit()
        flash('Categoría eliminada exitosamente', 'success')
    except Exception as e:
        db.session.rollback()
        flash(f'Error al eliminar categoría: {str(e)}', 'danger')

    return redirect('/categorias')

#CRUD EMPLEADOS
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

            flash('Empleado creado exitosamente', 'info')
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

# CRUD CLIENTES






# Crear Cliente (Nuevo)
@app.route('/clientes/nuevo', methods=['GET', 'POST'])
def crear_cliente():
    if request.method == 'POST':
        try:
            nombre = request.form['nombre']
            email = request.form['email']
            telefono = request.form.get('telefono', '')  # Opcional
            direccion = request.form.get('direccion', '')  # Opcional

            nuevo_cliente = Cliente(nombre=nombre, email=email, telefono=telefono, direccion=direccion)
            db.session.add(nuevo_cliente)
            db.session.commit()

            flash('Cliente creado exitosamente', 'success')
            return redirect('/clientes')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al crear cliente: {str(e)}', 'danger')
    return render_template('nuevoCliente.html')

# Leer Clientes (Lista)
@app.route('/clientes', methods=['GET'])
def listar_clientes():
    clientes = Cliente.query.all()
    return render_template('clientes.html', clientes=clientes)

# Actualizar Cliente (Editar)
@app.route('/clientes/<int:id>/editar', methods=['GET', 'POST'])
def editar_cliente(id):
    cliente = Cliente.query.get_or_404(id)
    
    if request.method == 'POST':
        try:
            cliente.nombre = request.form['nombre']
            cliente.email = request.form['email']
            cliente.telefono = request.form.get('telefono', '')  # Opcional
            cliente.direccion = request.form.get('direccion', '')  # Opcional
            
            db.session.commit()
            flash('Cliente actualizado exitosamente', 'success')
            return redirect('/clientes')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al actualizar cliente: {str(e)}', 'danger')
    
    return render_template('editarCliente.html', cliente=cliente)

# Eliminar Cliente
@app.route('/clientes/<int:id>/eliminar', methods=['POST'])
def eliminar_cliente(id):
    try:
        cliente = Cliente.query.get_or_404(id)
        db.session.delete(cliente)
        db.session.commit()
        flash('Cliente eliminado exitosamente', 'success')
    except Exception as e:
        db.session.rollback()
        flash(f'Error al eliminar cliente: {str(e)}', 'danger')

    return redirect('/clientes')



# CRUD PELÍCULAS



# Crear Película (Nuevo)
@app.route('/peliculas/nueva', methods=['GET', 'POST'])
def crear_pelicula():
    categorias = Categoria.query.all()  # Obtener categorías para el select
    if request.method == 'POST':
        try:
            titulo = request.form['titulo']
            descripcion = request.form.get('descripcion', '')  # Opcional
            poster_path = request.form['poster_path']
            vote_average = float(request.form['vote_average'])
            categoria_id = request.form.get('categoria_id')
            
            nueva_pelicula = Pelicula(
            titulo=titulo,
            descripcion=descripcion,
            poster_path=poster_path,
            vote_average=vote_average,
            categoria_id=int(categoria_id) if categoria_id else None
)

            db.session.add(nueva_pelicula)
            db.session.commit()

            flash('Película creada exitosamente', 'success')
            return redirect('/peliculas')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al crear película: {str(e)}', 'danger')
    return render_template('nuevaPelicula.html', categorias=categorias)


# Actualizar Película (Editar)
@app.route('/peliculas/<int:id>/editar', methods=['GET', 'POST'])
def editar_pelicula(id):
    pelicula = Pelicula.query.get_or_404(id)
    categorias = Categoria.query.all()  # Obtener categorías para el select

    if request.method == 'POST':
        try:
            pelicula.titulo = request.form['titulo']
            pelicula.descripcion = request.form.get('descripcion', '')  # Opcional
            pelicula.poster_path = request.form['poster_path']
            categoria_id = request.form.get('categoria_id')
            pelicula.categoria_id = int(categoria_id) if categoria_id else None  # Opcional

            db.session.commit()
            flash('Película actualizada exitosamente', 'success')
            return redirect('/peliculas')
        except Exception as e:
            db.session.rollback()
            flash(f'Error al actualizar película: {str(e)}', 'danger')

    return render_template('editarPelicula.html', pelicula=pelicula, categorias=categorias)

# Eliminar Película
@app.route('/peliculas/<int:id>/eliminar', methods=['POST'])
def eliminar_pelicula(id):
    try:
        pelicula = Pelicula.query.get_or_404(id)
        db.session.delete(pelicula)
        db.session.commit()
        flash('Película eliminada exitosamente', 'success')
    except Exception as e:
        db.session.rollback()
        flash(f'Error al eliminar película: {str(e)}', 'danger')

    return redirect('/peliculas')



#PAGINACION

# Películas (Lista con paginación)
@app.route('/peliculas', methods=['GET'])
def listar_peliculas():
    # Obtener el número de página actual de los parámetros de la URL (por defecto es 1)
    page = request.args.get('page', 1, type=int)
    # Definir cuántas películas mostrar por página
    per_page = 5  # Puedes ajustar este valor según necesites

    # Consultar las películas con paginación
    peliculas_paginadas = Pelicula.query.paginate(page=page, per_page=per_page)

    # Pasar los resultados paginados a la plantilla
    return render_template('peliculas.html', peliculas=peliculas_paginadas)







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
