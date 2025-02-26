import os

class Config:
    SECRET_KEY = 'tu_clave_secreta'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/cinesucre'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
