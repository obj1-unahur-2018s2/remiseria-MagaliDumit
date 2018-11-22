# Remisería
Hacer un modelo de remiserias. Vamos a trabajar con la flota de vehículos de cada remisería.

De cada vehículo nos van a interesar: capacidad (o sea, cantidad de pasajeros que pueden transportar), velocidad máxima, color y peso.

## Considerar estos vehículos:

`Chevrolet Corsa`, La capacidad  es 4 pasajeros en los 3, la velocidad máxima  de 150 km/h y pesan 1300 kg

Autos `standard` que funcionan a gas, uno de color `gris`y otro verde. Cada uno de ellos puede tener puesto, o no, un tanque adicional. La capacidad de un auto a gas es de 4 pasajeros si no tiene puesto el tanque adicional, o 3 pasajeros si sí lo tiene puesto. La velocidad máxima es 120 km/h con, o 110 km/h sin, tanque adicional. El peso es 1200 kg, más 150 kg adicionales si tiene tanque adicional.

Una `Trafic`, que es reconfigurable, porque se le puede cambiar el interior y el motor. La capacidad de la Trafic es la de su interior, la velocidad máxima la que indique su motor, el peso es 4000 kg más lo que pesen interior y motor, y es de color blanco.

Prever dos interiores, uno cómodo (capacidad 5, peso 700 kg) y otro popular (capacidad 12, peso 1000 kg). Y dos motores, uno pulenta (velocidad máxima 130 km/h, peso 800 kg) y otro batatón (velocidad máxima 80 km/h, peso 500 kg).
Autos que son todos distintos entre sí, de cada uno hay que especificar capacidad, velocidad máxima, peso y color.

Autos que son todos distintos entre sí, de cada uno hay que especificar capacidad, velocidad máxima, peso y color.

## Remiserias 

Cada `remisería` debe aceptar los siguientes mensajes:

`agregarAFlota(vehiculo)` y `quitarDeFlota(vehiculo)`.

`pesoTotalFlota()`, la suma del peso de cada vehículo agregado a la flota.

`esRecomendable()`, es verdadero si la remisería tiene al menos 3 vehículos, y además, todos los vehículos registrados en la remisería pueden ir al menos a 100 km/h.

`capacidadTotalYendoA(velocidad)`, la cantidad total de personas que puede transportar la remisería, considerando solamente los autos de su flota cuya velocidad máxima sea mayor o igual a la velocidad indicada.

`colorDelAutoMasRapido()`, eso.

Se pide:

- Implementar las clases y objetos que hagan falta para modelar autos y remiserías según lo que se describió.

- Armar un test en el que hay dos remiserías.
En el test, definir un auto llamado cachito, (o sea, poner var cachito = ...), que sea un Corsa rojo.
Los autos de la primer remisería son: cachito; dos Corsa más, uno negro y el otro verde; un auto standard a gas con el tanque adicional puesto; y un auto distinto que tiene: capacidad 5, velocidad máxima 160 km/h, peso 1200 kg, color beige.
Los autos de la segunda remisería son: cachito; tres autos standard a gas, uno con el tanque adicional puesto y dos sin, y la Trafic, configurada con el interior cómodo y el motor batatón.
Sí, cachito está en la flota de las dos remiserías, acepta encargos de las dos.
Hacer asserts sobre cada una, respecto del peso total, si es recomendable o no, la capacidad total yendo a 140 km/h, y el color del auto más rápido.

## Viajes
Agregar al modelo los viajes. De cada viaje nos interesa: los kilómetros, el tiempo máximo de viaje en horas, la cantidad de pasajeros, y también un conjunto de colores incompatibles, o sea, que los pasajeros rechazan hacer el viaje en autos de esos colores.

- Agregar la capacidad de preguntar si un auto puede hacer un viaje, enviándole un mensaje al viaje, claro, con el auto como parámetro. Para que un auto pueda hacer un viaje se tienen que dar tres condiciones: que la velocidad máxima sea al menos 10
km/h mayor a la velocidad promedio que necesita el viaje (que es kilómetros dividido tiempo máximo); que la capacidad del auto dé para la cantidad de pasajeros del viaje; y que el auto no sea de un color incompatible para el viaje.
Usando esto, agregarle a las remiserías un método para que puedan responder qué autos pueden hacer un viaje.

- Agregar el registro de los viajes hechos por cada remisería. Para esto, agregarle a la clase que define el comportamiento de las remiserías, el método `registrarViaje(viaje,auto)`, que agregue el viaje a una colección de viajes hechos, y le asigne el auto al viaje. Agregarle al viaje un atributo que sea el auto que lo hizo.
Nota: no conviene que sea el auto quien se acuerde de los viajes que hizo, porque si un auto trabaja con dos remiserías, se complica distinguir qué viajes hizo con cada una.

A partir de esto, agregar lo que haga falta para poder preguntarle a una remisería:

  - cuántos viajes hizo un auto (para esa remisería, claro).
  - cuántos viajes hizo la remisería de más de una cantidad de kilómetros.
  - cuántos lugares libres en total hubo en los viajes que hizo la remisería. 
    P.ej. si la remisería hizo un viaje de 2 pasajeros usando un auto de capacidad 5, ese viaje tuvo 3 lugares libres.
  - cuánto pagarle a un auto, de acuerdo a los viajes que hizo para esa remisería.
    Cada remisería establece un valor por kilómetro, y un mínimo para cada viaje.
    Por ejemplo, si una remisería establece 3 pesos por km y 30 de mínimo por viaje, entonces un viaje de 7 km lo paga 30  pesos (porque 3 x 7 = 21 no llega a 30), y un viaje de 25 km lo paga 75 pesos (3 x 25 = 75 supera el mínimo de 30).


## Practica Colecciones

Para una remisería resolver
- dado un color, la cantidad de autos de ese color.
  P.ej. remiseriaCachito.cantidadDeAutosDeColor("rojo")
- dada una cantidad de pasajeros, si hay o no al menos un auto que pueda llevar exactamente esa cantidad.
  P.ej. remiseriaCachito.hayAutosDeCapacidadExacta(5)
- el conjunto de colores de los autos
  P.ej. remiseriaCachito.colores()
  Devuelve una lista de String, p.ej. ["verde", "rojo", "negro"]
- el promedio de las velocidades máximas. 
  P.ej. remiseriaCachito.promedioDeVelocidadesMaximas()
  Si la remisería tiene 3 autos con velocidad máxima 100, 110 y 150, entonces tiene que devolver 120.
  Se calcula así: suma de todas las velocidades máximas de cada vehículo, dividido cantidad de vehículos. En el ejemplo, (100 + 110 + 150) / 3 = 120
- dado un vehículo, un conjunto de los vehículos similares a ese.
  P.ej. si tengo
   miCorsita = new ChevroletCorsa("rojo")
  entonces tiene que andar esto
  remiseriaCachito.vehiculosSimilaresA(miCorsita)
  Para que un vehículo se considere similar al que viene por parámetro, tienen que pasar dos cosas
  - las velocidades máximas no pueden diferir en más de 10 km/h. O sea, la velocidad máxima de un auto tiene que estar entre (vel.máxima del otro - 10) y (vel. máxima del otro + 10).
  - tienen que ser del mismo color


