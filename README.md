# Zuana
Aplicativo de sistema de puntos.


## Instalación
Puede realizar la instalación de dos formas: 
#### 1. Mediante Git: 
Puede descargarlo en el siguiente enlace: [GIT](https://git-scm.com/download/).
Una vez tenga Git, realizamos la clonación del repositorio:
Desde la consola digite el siguiente comando:
```bash
git clone https://github.com/EudesSerpa/Zuana.git
```
#### 2. Descargando el archivo ZIP o comprimido: 

Para ello, deberá hacer click en el botón "Code" y seleccionar dicha opción de descarga.


## Ejecutar aplicativo
Una vez realice alguno de los dos pasos anteriores, en la carpeta en donde clonó o descargó el repo aparecerá una nueva con nombre: Zuana o un archivo .zip con el mismo nombre con un agregado (-master), respectivamente. 
###### Navegue de la siguiente forma por medio de dicha carpeta:

Zuana/Zuana-master --> APP -> dist -> AppZuana -> AppZuana.exe. 

Este último es el ejecutable del aplicativo. Puede ejecutarlo directamente.

## Tener en cuenta
* El aplicativo está disponible para usar solo en S.O Windows.
* Para el correcto funcionamiento del sistema, debe contar con el Gestor de base de datos MySQL. Remítase a la sección de -Base de datos-.




## Base de datos
Como se ha mencionado anteriormente, el correcto funcionamiento del sistema depende de la existencia del gestor de base de datos MySQL.
### Descarga
1. Descargar server MySQL: [MySQL Server](https://downloads.mysql.com/archives/installer/).
2. Descargar MySQL Workbench: [MySQL Workbench](https://downloads.mysql.com/archives/workbench/).

Se recomienda para este aplicativo, descargar la versión 8.0.21 ya que fue la utilizada en el desarrollo de este.


### Instalación
Para su instalación se recomienda utilizar las opciones predeterminadas que traen los instaladores. 

A continuación se mencionarán las pantallas en las que deberá elegir una opción distinta a la que viene por defecto:
##### MySQL Server: 
* 1° Pantalla: elija la opción de "Server Only".
* 6° Pantalla: ingresar la contraseña para su usuario principal (root). Debe ingresar "3333" en este campo.


### Importar Base de datos
Para este paso, ya debería de haber instalado de forma correcta el servidor y la interfaz gráfica de MySQL, en ese orden.

Una vez dentro de MySQL Workbench:
1. Ingrese en la conexión por defecto que le aparece en la pantalla principal. Le pedirá la contraseña que ingresó en la instalación del servidor MySQL (la primera descarga e instalación) -> 3333. 

2. En la barra de herramientas superior seleccione: "Server" -> "Data import". O directamente en el menú de la parte izquierda en la sección "MANAGEMENT" -> "Data Import/Restore".

3. Seleccione la opción de "Import from Self-Contained File" y cargue el archivo "DumpZuanaDB.sql" que se encuentra en la carpeta "dump" que ha descargado del repo.

4. En la parte inferior derecha, presione "Start Import" para empezar a importar la base de datos que utiliza el aplicativo.

Una vez terminada la importación, ya tendrá lista la base de datos - data_cie - para ejecutar el aplicativo y que este funcione de forma correcta.
