"""
    FORMATEO DE LA FECHA ACTUAL
"""
from datetime import datetime

def currentDateFormatted():
    date = datetime.now()
    date = date.strftime('%Y-%m-%d %X')
    return date