# Proyecto 1: FSM

El proyecto cuenta con 2 subcarpetas:

1. **CSV utilizados**:

  En este espacio se encuentran los CSV utilizados en logic friday para obtener las ecuaciones minimizadas de las salidas y transiciones de estado asociadas a las FSM. Tambien se encuentra el documento de Excel utilizado donde estan recopiladas todas las tablas en distintas hojas, tanto de salidas como de estados futuros.

2. **ScriptsDelProyecto**:

  En este espacio se encuentran 3 subcarpetas asociadas a las FSM de forma individual y la union de ellas con la implementacion de los timmers.

  * *FSMdispensador* contiene los scripts en verilog asociados a la FSM del dispensador, asi como el testbench utilizado para generar los diagramas de timming del documento del proyecto.

  * *FSMselector* contiene los scripts en verilog asociados a la FSM del selector, asi como el testbench utilizado para generar los diagramas de timming del documento del proyecto.

  * *UnionFSM* en este se contiene los scripts en donde se unen ambas maquinas de estado finitos y se implementa de igual forma 3 timmers identicos con tiempos de activacion distintos los cuales utilizan un clock distinto al implementado en las maquinas. De igual forma contiene el testbench utilizado para generar los diagramas de timming utilizados en el documento del proyecto.
