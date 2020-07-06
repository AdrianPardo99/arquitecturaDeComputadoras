##Archivos los cuales conforman el procesador con las siguientes caracteristicas##

__Lista de componentes__

* Pila de Hardware 
  * Datos entrada de 16 bits y un contador de programa de 16 bits 
  * Banderas 
    * UP (Aumenta Stack)
    * DW (Reduce Stack)
    * WPC (Modifica el contador de programa)

*  Memoria de datos
  * 16 bits de entrada y 25 bits de salida con constantes del set de instrucciones de ESCOMips

* Archivo de Registros 
  * Va de 0 a 15 distintos registros del procesador
  * Banderas
    * SHE (Habilita los barridos de bits de forma circular SRL en la lectura de SHAMT que se entiende como el número de posiciones)
    * DIR (En conjunto de SHE habilitados realiza SLL)
    * WR (Permite la escritura en el archivo de WriteRegister del bus WriteData)

* ALU (Arithmetic Logic Unit)
  * Dos entradas de 16 bits y una salida de 16 bits
  * Banderas de entrada las cuales permiten realizar operaciones aritmeticas (Combinación para trabajar)
    * Suma (0011)
    * Resta (0111)
    * AND (0000)
    * NAND (1101)
    * OR (0001)
    * NOR (1100)
    * XOR (0010)
    * XNOR (1010)
    * NOT (A=B -> 1101 NAND)

* Memoria de datos la cual permite almacenar en memoria de 1024\*16 el cual almacena lo que puedan contener los registro
  * Dos entradas de 16 bits las cuales acceden a la sección donde se almacenaran los datos
  * Bandera WD que permite que se lean los datos que se almacenaran

* Extensores de Signo/Dirección
  * Estos extensores permiten el modificar datos que seran procesados a traves de la ALU lo cual
    * Entrada de 12 bits y salida de 16 bits

* Unidad de Control
  * Este modulo permite liberar microinstrucciones las cuales permiten habilitar y hacer que tengan un claro funcionamiento los componentes de hardware, por otro lado esta va acompañada de varios submodulos.

* Muxes de microinstrucción
  * Estos sirven para tener un claro entendimiento de como viajan las rutas de datos las cuales permiten que entren y se lean las banderas de datos hacia algún modulo del procesador, que estos leen datos que liberan la microinstrucción
