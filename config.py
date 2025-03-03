import os

class Config:
    SECRET_KEY = 'tu_clave_secreta'  # Clave secreta para las sesiones
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/cinesucre'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
