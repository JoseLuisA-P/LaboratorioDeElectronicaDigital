# Comportamiento de la maquina y sus estados acorde a los botones y timmers

## SELECTOR

### Botones del selector:

  - **C**: se refiere a la seleccion de cafe.

  - **T**: se refiere a la seleccion de te.

  - **L**: se refiere a la seleccion de leche.

  - **A**: se refiere a la seleccion de agua.

  - **N**: se refiere a la seleccion de ningun extra.

  - **V**: se refiere a la seleccion de vainilla como extra.

### Salida del selector:

  -  **SA**: es la salida del selector y es de 4 bits. En formato little endian. Esta comienza en 0000 al inicio.

### **Comportamiento de la salida del selector ante los botones**:

Para realizar la seleccion se tiene que seguir el siguiente orden.

1. Cafe o Te.

2. Leche o Agua.

3. Ningun extra o con Vainilla extra.

      ***se tiene que realizar la seleccion en orden para un correcto funcionamiento***

#### Valores de SA ante las elecciones:

  - El valor de SA[0] toma el valor de b'0 cuando se seleccion Cafe y toma el valor de b'1 cuando se selecciona Te.

  - El valor de SA[1] toma el valor de b'0 cuando se selecciona Leche y el valor de b'1 cuando se selecciona 1.

  - El valor de SA[2] toma el valor de b'0 cuando se elige Ningun extra y el valor de b'1 cuando se elige vainilla.

  - El valor de SA[3] toma el valor de b'1 cuando se han realizado las 3 elecciones, de lo contrario conserva el valor de b'0.

## DISPENSADOR

### Botones y entradas del dispensador:

  - **E**: este boton permite que la maquina de dispensador comience a dispensar.
  - **CIN**: esta entrada indica el estado de los insumos que dispensa la maquina, de no encontrarse en las condiciones necesarias no permite que se dispense la bebida.

### Timmers:

  - **A, B y C**: estas son entradas de 3 timmers con conteos distintos los cuales indican el momento de detener el despacho a la FSM. *A y B* son manejados por 2 bits, *C* es manejado por un bit.

### Salidas del dispensador:

  - **M1**: salida de los motores del despacho de cafe o te, es de 2 bits.
  - **M2**: salida de los motores del despacho de liquidos, es de 2 bits.
  - **M3**: salida del motor para dispensar un extra, es de 1 bit.
  - **Li**: salida para indicar el fin del dispensado y el reinicio de las maquinas, es de 1 bit.
  - **LCD**: salida para indicar un mensaje en la LCD mientras se dispensa, es de 3 bits.


#### Comportamiento de las salidas:

  - **M1**: toma el valor de b'01 en el estado S1, toma el valor de b'10 en el estado S2, de lo contrario tiene el valor de 00.

  - **M2**: toma el valor de b'01 en el estado S4, toma el valor de b'10 en el estado S5, de lo contrario tiene el valor de b'00.

  - **M3**: tiene el valor de b'1 en el estado S8, de lo contrario es b'0.

  - **Li**: tiene el valor de b'1 en el estado S7 o S9, de lo contrario es b'0. Esta salida esta conectada a el RESET de las maquinas y timmers por medio de logica combinacional, por lo cual al instante de activarse se reinician todas las FSM y timmers.

  - **IND**:

      - S0: Toma el valor de b'000

      - S1: Toma el valor de b'001

      - S2: Toma el valor de b'010

      - S3: Toma el valor de b'111

      - S4: Toma el valor de b'011

      - S5: Toma el valor de b'100

      - S6: Toma el valor de b'111

      - S7: Toma el valor de b'111

      - S8: Toma el valor de b'101

      - S9: Toma el valor de b'111
