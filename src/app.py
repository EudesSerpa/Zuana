import tkinter as tk
import tkinter.font as tkFont
from tkinter import messagebox
from functools import partial
from PIL import ImageTk, Image
import mysql.connector as mysql
import config_bd
import DateFormat
import LogicaNegocio
import SendEmail

class MainWindow():

    def __init__(self, window):
        self.pathIcon = './iconoApp/tierra.ico'
        
        self.styles = lambda pSize=10, pWeight='normal': tkFont.Font(family="Open Sans", size=pSize, weight=pWeight)
        self.dateCurrent = lambda: DateFormat.currentDateFormatted()

        self.root = window
        self.root.title('Sistema de puntos por compra')
        self.root.iconbitmap(self.pathIcon)
        self.root.geometry('+675+250')
        self.root.resizable(width=0, height=0)
        self.root.config(bg='lightgray')

        self.createWidgetsMainWindow()

    def createWidgetsMainWindow(self):
        #Frame Principal
        self.frame = tk.LabelFrame(self.root, text='')
        self.frame.grid(row=0, column=0, pady=5, padx=5)
        
        self.title = tk.Label(self.frame, text='BIENVENIDO', font=self.styles(pSize=30, pWeight='bold'))
        self.title.grid(row=1, column=0, columnspan=4, rowspan=2, pady=(50, 150), padx=10)
        
        buttonRedimir = tk.Button(self.frame, text='REDIMIR', width=20, command= partial(self.consultWindow, accion='Redimir', titleWindow="Redención de puntos"), cursor='hand2', font=self.styles(pSize=12), activebackground='lightgray')
        buttonRedimir.grid(row=3, column=1, pady=(0, 0), padx=(30, 0))
        
        buttonAsignar = tk.Button(self.frame, text='ASIGNAR', width=20, command= partial(self.consultWindow, accion='Asignar', titleWindow="Asignación de puntos"), cursor='hand2', font=self.styles(pSize=12), activebackground='lightgray')
        buttonAsignar.grid(row=3, column=3, pady=(0, 0), padx=(0, 30))
        
        buttonRegistrar = tk.Button(self.frame, text='REGISTRAR', width=10, command= partial(self.consultWindow, accion='Registrar', titleWindow="Registro de Cliente"), cursor='hand2', font=self.styles(), activebackground='lightgray')
        buttonRegistrar.grid(row=4, column=2, pady=(30, 50), padx=(30, 30))

    def consultWindow(self, accion, titleWindow='Consultar cliente', bloqButtons='disabled'):
        self.consultClient = tk.Toplevel()
        self.consultClient.title(titleWindow)
        self.consultClient.iconbitmap(self.pathIcon)
        self.consultClient.geometry('+791+190')
        self.consultClient.resizable(width=0, height=0)

        self.accionEmail = accion #Indicar la accion que se está realizando para enviar X archivo al email

        if(accion=='Redimir' or accion=='Asignar'):
            bloqEntrys = 'readonly'
            bloqEntryCC = bloqButtonsConsult = 'normal'
            bloqButtons = 'disabled'
        else:
            bloqEntrys = bloqButtons = 'normal'
            bloqEntryCC = bloqButtonsConsult = 'disabled'

        #---Frames para consultar cliente por CC
        #Frame Label - Entry
        frameConsult = tk.LabelFrame(self.consultClient, text='Consultar Cliente', font=self.styles(pSize=9))
        frameConsult.grid(row=1, column=1, pady=(30, 0), padx=20)

        self.ccEntryConsult = tk.StringVar(value='')

        tk.Label(frameConsult, text='C.C: ', font=self.styles(pSize=10)).grid(row=0, column=0, pady=(20, 20), padx=(15, 0))        
        self.cedula = tk.Entry(frameConsult, width=27, state=bloqEntryCC, textvariable=self.ccEntryConsult, font=self.styles(pSize=10))
        self.cedula.focus()
        self.cedula.grid(row=0, column=1, columnspan=2, pady=(20, 20), padx=(0, 15))
        #Frame Buttons
        frameButtonConsul = tk.Frame(frameConsult)
        frameButtonConsul.grid(row=2, column=0, columnspan=6)
        
        buttonConsult = tk.Button(frameButtonConsul, text='Consultar', width=12, state=bloqButtonsConsult, command=self.clientConsult, cursor='hand2', font=self.styles(), activebackground='lightgray')
        buttonConsult.grid(row=0, column=1, pady=20, padx=15)

        buttonQuitar = tk.Button(frameButtonConsul, text='Quitar', width=12, state=bloqButtonsConsult, command=lambda: self.cedula.delete(0, 'end'), cursor='hand2', font=self.styles(), activebackground='lightgray')
        buttonQuitar.grid(row=0, column=0, pady=20, padx=15)
        
        #---Frame para mostrar/ingresar info del cliente
        frameInfo = tk.LabelFrame(self.consultClient, text='Informacion Cliente', font=self.styles(pSize=9))
        frameInfo.grid(row=3, column=1, pady=(30, 10), padx=20)

        #Variables Entrys
        self.firstName = tk.StringVar()
        self.lastName = tk.StringVar() 
        self.secondSurname = tk.StringVar()
        self.cc = tk.StringVar(value='')
        # self.cc = tk.IntVar(value='')
        self.phone = tk.StringVar()
        self.email = tk.StringVar()
        self.points = tk.IntVar(value='')

        tk.Label(frameInfo, text='Nombre: ', font=self.styles()).grid(row=6, column=2, pady=(20, 0), padx=(20, 10), sticky='e')
        name_client = tk.Entry(frameInfo, width=20, state=bloqEntrys, textvariable=self.firstName, font=self.styles())
        name_client.grid(row=6, column=4, pady=(20, 0), padx=(0, 20))
        
        tk.Label(frameInfo, text='1° Apellido: ', font=self.styles()).grid(row=7, column=2, pady=10, padx=(20, 10), sticky='e')
        apellido1_client = tk.Entry(frameInfo, width=20, state=bloqEntrys, textvariable=self.lastName, font=self.styles())        
        apellido1_client.grid(row=7, column=4, pady=10, padx=(0, 20))
        
        tk.Label(frameInfo, text='2° Apellido: ', font=self.styles()).grid(row=8, column=2, pady=10, padx=(20, 10), sticky='e')
        apellido2_client = tk.Entry(frameInfo, width=20, state=bloqEntrys, textvariable=self.secondSurname, font=self.styles())       
        apellido2_client.grid(row=8, column=4, pady=10, padx=(0, 20))
        
        tk.Label(frameInfo, text='C.C: ', font=self.styles()).grid(row=9, column=2, pady=10, padx=(20, 10), sticky='e')
        cc_client = tk.Entry(frameInfo, width=20, state=bloqEntrys, textvariable=self.cc, font=self.styles())
        cc_client.grid(row=9, column=4, pady=10, padx=(0, 20))
        
        tk.Label(frameInfo, text='Telefono: ', font=self.styles()).grid(row=10, column=2, pady=10, padx=(20, 10), sticky='e')
        phone_client = tk.Entry(frameInfo, width=20, state=bloqEntrys, textvariable=self.phone, font=self.styles())
        phone_client.grid(row=10, column=4, pady=10, padx=(0, 20))
        
        tk.Label(frameInfo, text='Correo: ', font=self.styles()).grid(row=11, column=2, pady=10, padx=(20, 10), sticky='e')
        email_client = tk.Entry(frameInfo, width=20, state=bloqEntrys, textvariable=self.email, font=self.styles())
        email_client.grid(row=11, column=4, pady=10, padx=(0, 20))

        tk.Label(frameInfo, text='Puntos: ', font=self.styles()).grid(row=12, column=2, pady=(0,20), padx=(20,10), sticky='e')
        points_client = tk.Entry(frameInfo, width=20, state="readonly", textvariable=self.points, font=self.styles())
        points_client.grid(row=12, column=4, pady=(10, 20), padx=(0, 20))

        self.buttonAccion = tk.Button(self.consultClient, text=accion.upper(), width=10, state=bloqButtons, command=partial(self.actionsControl, action=accion), cursor='hand2', font=self.styles())
        self.buttonAccion.grid(row=13, column=1, pady=20, padx=15)

    def actionsControl(self, action):
        if (action == 'Registrar'):
            self.createClient()
        elif action == 'Asignar':
            self.pointsAssignment()
        else: 
            self.redeemPointsWindow()

    def clientConsult(self):
        try:
            cedula = int(self.ccEntryConsult.get())
            client = self.querysBD(query='select', destination='clients', parametros=(cedula, ))

            for dato in client:
                response = dato.fetchmany(size=1)[0] #Retorna una lista de tuplas, se toma la pos 0 para asignar la tupla
            
            cedula = response[0]
            if (cedula != None): 
                #Existe
                self.cedula.delete(0, 'end')

                #Verificar si el cliente no tiene puntos previos
                oldPoints = response[6]
                if (oldPoints == None):
                    oldPoints = (0, )

                    data = response[:6] + oldPoints
                    self.showInfo(data=data)
                else:
                    self.showInfo(data=response)

                self.buttonAccion.config(state='normal')
            else: 
                #No existe
                self.showInfo(data=('','','','','','',''))
                self.buttonAccion.config(state='disabled')
                self.notificationWindow(parent=self.consultClient, type='error', title='Cliente inexistente', text='Por favor, valide la información o registre al cliente.')
        except Exception as e:
            print(e)
            self.buttonAccion.config(state='disabled')
            self.cedula.delete(0, 'end')
            self.showInfo(data=('','','','','','',''))
            self.notificationWindow(parent=self.consultClient, type='error', title='Cédula inválida', text='Por favor, ingrese una CC válida.')

    def showInfo(self, data=()):
        self.cc.set(data[0])
        self.firstName.set(data[1])
        self.lastName.set(data[2])
        self.secondSurname.set(data[3])
        self.phone.set(data[4])
        self.email.set(data[5])
        self.points.set(data[6])

    # --- REGISTRO DE CLIENTES
    def createClient(self):
        try:
            if (self.validateClientData()):
                clientCC = str(int(self.cc.get()))
                name = (self.firstName.get().replace(' ', '')).capitalize()
                lastName = (self.lastName.get().replace(' ', '')).capitalize()
                secondSurname = (self.secondSurname.get().replace(' ', '')).capitalize()
                phone = self.phone.get().replace(' ', '')
                email = self.email.get().replace(' ', '')

                parametros = (clientCC, name, lastName, secondSurname, phone, email)
                response = self.querysBD(query='insert', destination='newClients', parametros=parametros)
            
                if (response == None):
                    self.showInfo(data=('','','','','','',''))
                    self.notificationWindow(parent=self.consultClient, type='informacion', title='Cliente creado', text='El cliente se ha registrado exitosamente.')
                    self.consultClient.destroy()
                elif (response == 'Duplicated'):
                    self.notificationWindow(parent=self.consultClient, type='error', title='Datos duplicados', text='Ya existe un cliente con algunos datos personales iguales. Por favor, verifique los datos.')
                else:
                    self.notificationWindow(parent=self.consultClient, type='error', title='Registro fallido', text='El cliente no pudo ser registrado. Por favor, contacte con el administrador.')
            else:
                self.notificationWindow(parent=self.consultClient, type='error', title='Datos inválidos', text='Por favor, verifique los datos.')
        except Exception as e:
            #print(e)
            self.notificationWindow(parent=self.consultClient, type='error', title='Datos inválidos', text='Por favor, verifique los datos.')

    def validateClientData(self):
        try:
            #Solo letras
            name = self.firstName.get().strip().isalpha() 
            lastName = self.lastName.get().strip().isalpha()
            secondSurname = self.secondSurname.get().strip().isalpha()
            #Solo digitos
            clientCC = self.cc.get().isdigit()
            phone = self.phone.get().strip().isdigit()
            #Longitudes y servidor de email
            sizePhone = len(self.phone.get().strip())
            email = self.email.get().strip().endswith("@gmail.com")
            sizeEmail = len(self.email.get().strip())

            if (name and lastName and secondSurname and clientCC and phone and email):
                if (sizePhone == 10 and sizeEmail > 10):
                    return True
                else:
                    return False
            else:
                return False
        except Exception as e:
            #print(e)
            return False

    # --- TRANSACCIÓN DE ASIGNACIÓN DE PUNTOS
    def pointsAssignment(self):
        self.purchaseData = tk.Toplevel(self.consultClient)
        self.purchaseData.title('Datos de la venta')
        self.purchaseData.iconbitmap(self.pathIcon)
        self.purchaseData.geometry('+755+390')
        self.purchaseData.resizable(width=0, height=0)
        
        #Variables Entry N°Factura y Total de la venta
        self.billNumberVar = tk.StringVar(value='')
        self.totalSaleVar = tk.StringVar(value='')
        #---Frames
        frameGlobal = tk.LabelFrame(self.purchaseData, text='')
        frameGlobal.grid(row=0, column=0, pady=5, padx=5)
        #Label/Entry purchase data
        frameData = tk.Frame(frameGlobal)
        frameData.grid(row=0, column=0, pady=(20, 10), padx=5)

        tk.Label(frameData, text='N° Factura: ', font=self.styles()).grid(row=0, column=0, pady=(15,0), padx=(0, 10), sticky='e')
        self.billNumber = tk.Entry(frameData, width=25, textvariable=self.billNumberVar, font=self.styles())
        self.billNumber.focus()
        self.billNumber.grid(row=0, column=1, pady=(15, 0), padx=(0, 20))
        
        tk.Label(frameData, text='Venta Total: ', font=self.styles()).grid(row=1, column=0, pady=(15,0), padx=(0, 10), sticky='e')
        self.totalSale = tk.Entry(frameData, width=20, textvariable=self.totalSaleVar, font=self.styles())
        self.totalSale.grid(row=1, column=1, pady=(15, 0), padx=(0, 20))
        #Options Buttons 
        frameButtons = tk.Frame(frameGlobal)
        frameButtons.grid(row=1, column=0, columnspan=2, pady=(10, 20), padx=(50,30))

        tk.Button(frameButtons, text='Quitar', width=15, command=self.deleteData, cursor='hand2', font=self.styles(), activebackground='lightgray').grid(row=0, column=0, pady=(20, 0), padx=(0, 30))
        tk.Button(frameButtons, text='Facturar', width=15, command=self.dataToBeBilled, cursor='hand2', font=self.styles(), activebackground='lightgray').grid(row=0, column=1, pady=(20, 0), padx=(30, 0))

    def dataToBeBilled(self):
        if (self.validateSalesData()):
            self.pointWindow = tk.Toplevel(self.purchaseData)
            self.pointWindow.title('Datos a facturar')
            self.pointWindow.iconbitmap(self.pathIcon)
            self.pointWindow.geometry('+755+390')
            self.pointWindow.resizable(width=0, height=0)

            tk.Label(self.pointWindow, text='POR FAVOR, VALIDE LA INFORMACIÓN A FACTURAR', font=self.styles()).grid(row=0, column=0, pady=(10, 0))

            #Frames
            #---Frames
            frameGlobal = tk.LabelFrame(self.pointWindow, text='')
            frameGlobal.grid(row=1, column=0, pady=5, padx=5)
            #Label/Entry purchase data
            frameData = tk.Frame(frameGlobal)
            frameData.grid(row=0, column=0, pady=(20, 10), padx=5)
            
            tk.Label(frameData, text='Número de Factura: ', font=self.styles()).grid(row=0, column=0, pady=(15,0), padx=(0, 10), sticky='e')
            tk.Label(frameData, text=f'{self.billNumberVar.get()}', font=self.styles(pSize=14)).grid(row=0, column=1, pady=(15, 0), padx=(0, 20))

            tk.Label(frameData, text='Total a facturar: ', font=self.styles()).grid(row=1, column=0, pady=(15,0), padx=(0, 10), sticky='e')
            tk.Label(frameData, text=f'{int(self.totalSaleVar.get())}', font=self.styles(pSize=14)).grid(row=1, column=1, pady=(15, 0), padx=(0, 20))
            
            tk.Label(frameData, text='Puntos a asignar: ', font=self.styles()).grid(row=2, column=0, pady=(15,0), padx=(0, 10), sticky='e')
            tk.Label(frameData, text=f'{self.pointsPerPurchase()}',font=self.styles(pSize=14, pWeight='bold')).grid(row=2, column=1, pady=(15, 0), padx=(0, 20))
            #Options Buttons 
            frameButtons = tk.Frame(frameGlobal)
            frameButtons.grid(row=1, column=0, columnspan=2, pady=(10, 20), padx=(50,30))

            tk.Button(frameButtons, text='Cancelar', width=15, command=lambda: self.pointWindow.destroy(), cursor='hand2', font=self.styles(), activebackground='lightgray').grid(row=0, column=0, pady=(20, 0), padx=(0, 30))
            tk.Button(frameButtons, text='Aceptar', width=15, command=self.bill, cursor='hand2', font=self.styles(), activebackground='lightgray').grid(row=0, column=1, pady=(20, 0), padx=(30, 0))
        else:
            self.notificationWindow(parent=self.purchaseData, type='error', title='Datos inválidos', text='Por favor, verifique los datos de la venta.')

    def bill(self):
        clientId = self.cc.get()
        numberBill = self.billNumberVar.get()
        totalSale = self.totalSaleVar.get()
        points = self.pointsPerPurchase()
        date = self.dateCurrent()

        parametros = (clientId, numberBill, totalSale, points, date)
        response = self.querysBD(query='insert', destination='sales', parametros=parametros)

        if (response == None):
            self.consultClient.destroy()

            self.notificationWindow(parent=self.root, type='informacion', title='Venta exitosa', text='La venta finalizada y puntos asignados con éxito.')
            
            responseServer = SendEmail.sendEmail(
                accion= self.accionEmail,
                nombre=self.firstName.get(),
                ventaTotal=totalSale,
                puntos=points,
                pAcumulados= points + self.points.get(),
                fecha=date
            )
            if (responseServer == 1):
                self.notificationWindow(parent=self.root, type='error', title='Email fallido', text='No se pudo enviar el email. Error con el servidor/conexión.')
        else:
            self.notificationWindow(parent=self.pointWindow, type='error', title='Venta fallida', text='La venta no se pudo realizar. Por favor, contacte con el administrador.')

    def validateSalesData(self):
        try:
            factura = self.billNumberVar.get().replace(' ', '').isalnum() #Acondicionar según requerimientos
            total = int(self.totalSaleVar.get())
            
            if (factura and total>0): 
                return True
            else:
                return False
        except Exception as e:
            #print(e)
            return False

    def pointsPerPurchase(self):
        return LogicaNegocio.PuntosxPesos(int(self.totalSaleVar.get()))

    def deleteData(self):
        self.billNumberVar.set('')
        self.totalSaleVar.set('')

    # --- TRANSACCIÓN DE REDENCIÓN DE PUNTOS
    def redeemPointsWindow(self):
        self.reedemList = tk.Toplevel()
        self.reedemList.iconbitmap(self.pathIcon)
        self.reedemList.title('Lista de servicios canjeables')
        self.reedemList.resizable(width=0, height=0)
        self.reedemList.geometry('+460+80')

        self.accumulatedPoints = tk.StringVar(value=f"Puntos del Cliente: {self.points.get()}")
        tk.Label(self.reedemList, textvariable=self.accumulatedPoints, font=self.styles(pSize=14, pWeight='bold')).grid(row=0, column=1, pady=20, padx=0)

        #Frames / Canvas / Scrollbar
        frameGlobal = tk.LabelFrame(self.reedemList, text='')
        frameGlobal.grid(row=1, column=0, columnspan=3, pady=(0, 10) , padx=10)
        
        canvasFrame = tk.Canvas(frameGlobal)
        canvasFrame.grid(row=0, column=0, pady=(5, 0), padx=(20, 0))
        scrollbar = tk.Scrollbar(frameGlobal, orient='vertical', command=canvasFrame.yview)
        scrollbar.grid(row=0, column=1, sticky='nsew')
        
        self.frameList = tk.Frame(canvasFrame)
        self.frameList.grid(row=0, column=0)
        self.frameList.bind("<Configure>", lambda event: canvasFrame.configure(scrollregion=canvasFrame.bbox("all")))

        canvasFrame.create_window((0, 0), window=self.frameList, anchor="nw")
        canvasFrame.configure(yscrollcommand=scrollbar.set, width=950, height=700)

        #Query
        services = self.querysBD(query='select', destination='services', parametros=(''))

        for service in services:
            serviceList = service.fetchall()

        #Ubicacion de las Imagenes / Descripciones
        cont = 0
        f = 0
        c = 0        
        for service in range(0, len(serviceList)):   
            if service % 2 == 0: #Izq |  
                c = 0
                if cont > 0:
                    f += 2
                    cont += 1
                cont += 1
            else:   # | Der
                c = 2
            self.serviceImages(ruta=serviceList[0][4], fila=f, columna=c)
            self.serviceDescription(serviceName=serviceList[service][1], points=serviceList[service][2], description=serviceList[service][3], fila=f, columna=c+1)
            
            tk.Button(self.frameList, text="Redimir", width=15, command=partial(self.serviceToBeRedeemed, codeService= serviceList[service][0], nameService=serviceList[service][1], servicePoints= serviceList[service][2]), cursor='hand2', font=self.styles()).grid(row=f+1, column=c+1, pady=10, padx=(0, 50))
    
    def serviceImages(self, ruta, fila, columna):
        serviceImage = Image.open(ruta)
        serviceImage = serviceImage.resize((250,250), Image.ANTIALIAS)
        serviceImage = ImageTk.PhotoImage(serviceImage)

        labelImage = tk.Label(self.frameList, image=serviceImage)
        labelImage.image = serviceImage
        labelImage.grid(row=fila, column=columna, rowspan=2, pady=10)
    
    def serviceDescription(self, serviceName, points, description, fila, columna):
        description = f"{serviceName}\r\n{description}\r\n\n\nPoints: {str(points)}"
        tk.Label(self.frameList, text=description, font=self.styles()).grid(row=fila, column=columna, pady=(10, 5), padx=(5, 50))

    def serviceToBeRedeemed(self, codeService, nameService, servicePoints):
        response = self.notificationWindow(parent=self.reedemList, type='confirmacion', title='Confirmación de elección', text=f'¿Desea redimir el servicio {codeService}?')
        if (response == 'yes'):
            if(self.comparePoints(servicePoints)):
                #Query
                date = self.dateCurrent()
                parametros = (self.cc.get(), codeService, date)
                response = self.querysBD(query='insert', destination='redemptions', parametros=parametros)
                
                if (response == None):
                    #Actualizacion de los puntos del cliente en el sistema
                    self.points.set(self.points.get() - servicePoints)
                    #   Visualizar los puntos actuales en la lista de servicios
                    self.accumulatedPoints.set(f"Puntos del Cliente: {self.points.get()}")
                    
                    self.notificationWindow(parent=self.reedemList, type='informacion', title='Servicio redimido', text=f'El servicio {codeService} se ha redimido satisfactoriamente.')
                    
                    responseServer = SendEmail.sendEmail(
                        accion= self.accionEmail,
                        nombre=self.firstName.get(),
                        servicio=nameService, #o por el codigo: codeService
                        puntos=servicePoints,
                        pAcumulados= self.points.get(),
                        fecha=date
                    )
                    if (responseServer == 1):
                        self.notificationWindow(parent=self.reedemList, type='error', title='Email fallido', text='No se pudo enviar el email. Error con el servidor/conexión.')
                else:
                    self.notificationWindow(parent=self.reedemList, type='error', title='Canje fallido', text='No se logró registrar el canje en la base de datos. Por favor, comuniquese con el administrador.')
            else:
                self.notificationWindow(parent=self.reedemList, type='error', title='Puntos insuficientes', text=f'El cliente no cuenta con los puntos necesarios para redimir el servicio {codeService}.')

    def comparePoints(self, servicePoints):
        clientPoints = self.points.get()
        if (clientPoints >= servicePoints):
            return True
        else:
            return False

    # --- PROPÓSITO GENERAL
    def querysBD(self, query, destination, parametros=()):
        try:
            conexion = config_bd.conexionBD()
            cursor = conexion.cursor(buffered=True)

            if (query == 'select'):
                if (destination == 'clients'):
                    # cursor.callproc('info_client_factura', parametros)
                    cursor.callproc('tra_consult', parametros)
                    response = cursor.stored_results()
                else: 
                    cursor.callproc('info_servicios')
                    response = cursor.stored_results()
            else: #Inserts 
                if (destination == 'redemptions'):
                    cursor.callproc('new_rendencion', parametros)
                    response = None
                elif (destination == 'sales'):
                    cursor.callproc('infoventa_factura', parametros)
                    response = None
                else:
                    cursor.callproc('create_client', parametros)
                    response = None
            
            return response
        except (Exception, mysql.Error) as e:
            #print(e)
            if (e.errno == 1062):
                return 'Duplicated'
            else:
                #Es un error general, pero se muestra en la app el que se haya especificado
                #Mirar los logs de consola permite ver qué error ocurró exactamente.
                return 'Error'
        finally:
            conexion.commit()
            cursor.close()
            conexion.close()

    def notificationWindow(self, parent, type, title, text=''):
        if(type=='informacion'):
            messagebox.showinfo(parent=parent, title=title, message=text)
        elif (type=='error'):
            messagebox.showerror(parent=parent, title=title, message=text)
        else:
            response = messagebox.askquestion(parent=parent, title=title, message=text)
            return response


def main():
    root = tk.Tk()
    app = MainWindow(root)
    root.mainloop()

if __name__ == '__main__':
    main()