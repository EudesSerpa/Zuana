'''
    CREDENCIALES DE CONEXION A LA BBDD
'''
import mysql.connector
from mysql.connector import errorcode

config = {
    'user': 'root',
    'password': '3333',
    'host': 'localhost',
    'database': 'data_cie',
    'raise_on_warnings': True
}

def conexionBD():    
    try:
        conexion = mysql.connector.connect(**config)
    except mysql.connector.Error as fail:
        if fail.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Usuario o password incorrectos")
        elif fail.errno == errorcode.ER_BAD_DB_ERROR:
            print("La Base de Datos no existe")
        else:
            print(fail)
    else:
        return conexion