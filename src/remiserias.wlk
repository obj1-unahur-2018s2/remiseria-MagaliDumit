import vehiculos.*

class Remiseria {
	var property flota = #{}
	var property viajesHechos = #{}
	var property minRecorrido = 0
	var property valorKms = 0
	
	method agregarAFlota(vehiculo) { flota.add(vehiculo) }
	method quitarDeFlota(vehiculo) { flota.remove(vehiculo) }
	method pesoTotalFlota() { return
		flota.sum ({ vehiculo => vehiculo.peso() })
	}
	
	method esRecomendable() {return
		flota.all({ vehiculo => vehiculo.velocidad() >= 100}) and
		flota.size() >= 3
	}
	 
	method capacidadTotalYendoA(velocidad) { return
		//var flotaRapidos = #{}
		flota.filter({ vehiculo => vehiculo.velocidad() >= velocidad }
		).sum({vehiculo => vehiculo.capacidad()})
	} 
	
	method colorDelAutoMasRapido() {
		return flota.max({ vehiculo => vehiculo.velocidad() }).color()
	}
	
	method registrarViaje(viaje,auto) {return
		if (!viaje.puedeRealizarViajeA(auto))
		 {self.error("no se cumplen las condiciones para realizar eeste viaje")} 
		 else
		 viajesHechos.add(viaje,auto)
	} 
	method cuantosViajesRealizo(auto) {
		//return viajesHechosAuto.count(self.registrarViaje(viaje,auto))
	}  
	 
	method pago(auto) {
		  
	}
 	
 	method cantidadCon(color) {
 		flota.filter({ vehiculo => vehiculo.color() }).size()
 	}
 	
 	method hayAutosDeCapacidadExacta(cantidad) {return
 		flota.filter({ vehiculo => vehiculo.capacidad()-1 == cantidad }) /*el -1 representa el chofer */
 	}
 	
 	method  colores() {
 		return flota.map({vehiculo => vehiculo.color()}).asSet()
 	}
 	method promedioDeVelocidadesMaximas() {return
 		flota.sum({ vehiculo => vehiculo.velocidad() }) / flota.size()
 	}
 	method autosSimilares(auto) {return
 		flota.filter({vehiculo => vehiculo.color() == auto.color()
 		}).filter({vehiculo => vehiculo.velocidad().between(auto.velocidad()+10 , auto.velocidad() -10) })
 	}
} 
   
   
class Viajes{
	var property kms = 0
	var property maximoHs = 0
	var property cantidadPasajeros = 0
	var property coloresIncompatibles = #{}
	method velocidadPromedio() { 
		return kms/ maximoHs
	}
	method puedeRealizarViajeA(auto) {
		return auto.velocidad() >= self.velocidadPromedio() +10  
		and auto.capacidad()-1 >=  self.cantidadPasajeros()/*el -1 representa el chofer */
		and auto.color() != self.coloresIncompatibles()
	}
} 
