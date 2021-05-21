"""
    ENVIO DE EMAIL CON INFORMACION DE TRANSACCION
        POR MEDIO DEL PROTOCOLO SMTP (PROTOCOLO PARA LA TRANSFERENCIA SIMPLE DE CORREO)
            EN MODO TLS (SEGURIDAD DE LA CAPA DE TRANSPORTE)
"""
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib as smtp
import ssl

def sendEmail(accion, nombre='Cliente', servicio='X', ventaTotal=0, puntos=0, pAcumulados=0, fecha='29/03/1998 12:00 p.m'):
    placeholders = {
        '{nombreCliente}': nombre,
        '{nombreServicio}': servicio,
        '{puntosAR}': puntos,
        '{puntosTotales}': pAcumulados,
        '{totalVenta}': ventaTotal,
        '{fechaCompra}': fecha
    }
    
    msg = MIMEMultipart()
    
    if (accion == 'Asignar'):
        with open("./mensajes/asignacion.txt", "r", encoding='utf-8') as archivo:

            mensaje = archivo.read()
            #Remplazar los placeholders por sus respectivos valores para cada cliente
            for elements in placeholders.items():
                if(mensaje.find(elements[0]) != -1):
                    mensaje = mensaje.replace(elements[0], str(elements[1]))
    else:
        with open("./mensajes/redencion.txt", "r", encoding='utf-8') as archivo:

            mensaje = archivo.read()
            for elements in placeholders.items():
                if(mensaje.find(elements[0]) != -1):
                    mensaje = mensaje.replace(elements[0], str(elements[1]))

    #Credenciales de sesion del remitente
    msg['From'] = "pruebapythongml@gmail.com"
    password = "prueba333"

    msg['To'] = "pruebapythongml+receptor@gmail.com"
    msg['Subject'] = "Tu Zupermercado te informa"
    
    #Convertir mensaje en un objeto MIMEText sin formato / Renderizar el mensaje
    msg.attach(MIMEText(mensaje, 'plain', 'utf-8'))

    #Conexion al servidor de gmail con TLS y envio del mensaje
    try:
        server = smtp.SMTP('smtp.gmail.com', 587)
        context = ssl.create_default_context()
        server.starttls(context=context)
    except (smtp.SMTPHeloError, smtp.SMTPConnectError, smtp.socket.gaierror, smtp.SMTPNotSupportedError) as failResponseServer:
        print("ERROR: El Servidor no responde.")
        messagesFaileds(mensaje=mensaje, dest=msg['To'])
        return 1

    #Login / Envio de email
    try:
        server.login(msg['From'], password)
        server.sendmail(msg['From'], msg['To'], msg.as_string())
    except (smtp.SMTPHeloError, smtp.SMTPAuthenticationError, smtp.SMTPNotSupportedError, smtp.SMTPException, smtp.SMTPRecipientsRefused, smtp.SMTPSenderRefused, 
        smtp.SMTPDataError, smtp.SMTPNotSupportedError) as fails:
        print("ERROR: El servidor no permite la conexión.")
        messagesFaileds(mensaje=mensaje, dest=msg['To'])        
        return 1
    finally:
        server.quit()
        server.close()

def messagesFaileds(mensaje, dest):
    with open("./mensajes/noEnviados.txt", "a+", encoding='utf-8') as archivo:
        archivo.write(dest)
        archivo.write("\r\n")
        archivo.write(mensaje)
        archivo.write("\r\n\n\n")
