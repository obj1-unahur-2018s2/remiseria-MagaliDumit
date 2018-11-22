import vehiculos.*

class Remiseria {
	var property flota = #{}
	
	
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
	
	method puedeRealizarViajeA(viajes,auto) { return auto.velocidad() >= viajes.velocidadPromedio() +10 
		and auto.capacidad() >=  viajes.cantidadPasajeros()
		and auto.color() != viajes.coloresIncompatibles()
	}
	
	method registrarViaje(viaje,auto) {
		
	}

}
  
  
class Viajes{
	var property kms = 0
	var property maximoHs = 0
	var property cantidadPasajeros = 0
	var property coloresIncompatibles = #{}
	method velocidadPromedio() { return kms/ maximoHs}
	method puedeRealizarViaje(auto) { auto.puedeRealizarViajeA(self)}
}  