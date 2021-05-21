"""
    LOGICA DE NEGOCIO

    Por defecto: 
        1 punto por cada $1000 pesos
"""

def PuntosxPesos(total_venta):
    """
    Realiza la proporcionalidad entre puntos ganados por pesos gastados
    +   Argumento:
            - Total de la venta realizada.
    """
    puntos = 1
    pesos = 1000

    return int((total_venta * (puntos / pesos)))