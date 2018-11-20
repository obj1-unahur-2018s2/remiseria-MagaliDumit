import vehiculos.*

class Remiseria {
	var property flota = #{}
	
	
	method agregarAFlota(vehiculo) { vehiculo.add() }
	method quitarDeFlota(vehiculo) { vehiculo.remove() }
	method pesoTotalFlota() { 
		flota.sum ({ vehiculo => vehiculo.peso() })
	}
	method esRecomendable() {return
		flota.all({ vehiculo => vehiculo.velocidad() >= 100}) and
		flota.size() >= 3
	}
	method capacidadTotalYendoA(velocidad) { 
		//var flotaRapidos = #{}
		flota.all({ vehiculo => vehiculo.velocidad() >= velocidad }).sum({ vehiculo => vehiculo.capacidad() })
	} 
	
	method colorDelAutoMasRapido() {
		flota.max({ vehiculo => vehiculo.velocidad() }).color()
	}
	
}
  