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
		flota.all({ vehiculo => vehiculo.velocidad() >= velocidad }
		).sum().capacidad() 
	} 
	
	method colorDelAutoMasRapido() {
		return flota.max({ vehiculo => vehiculo.velocidad() }).color()
	}
	
}
  