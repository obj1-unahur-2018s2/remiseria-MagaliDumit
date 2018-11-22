import remiserias.*

class Autos {
	var property capacidad = 0
	var property velocidad = 0
	var property peso = 0
	var property color = ""
	
	
}


class Corsa inherits Autos{
	
	method capacidad(){ return 4 }
	method velocidad() { return 150 } 
	method peso() { return 1300 }
	
	}
	
class Standard inherits Autos {
	var property tanqueAdicional = true
	
	method capacidad(){ return
		if ( tanqueAdicional ) {return 3}
		else {return 4}
	}
	
	method velocidad() { return
		if ( tanqueAdicional ) {return 120}
		else {return 110}
	} 
	
	method peso() { return
		if ( tanqueAdicional ) {return 1350}
		else {return 1200}
	} 
	 
	}
	
class Trafic {
	
	var property interior = interiorComodo 
	
	var property motor = motorPulenta
	//interiorComodo= interiorComodo.peso(),interiorComodo.capacidad()
	 
	method color() {return "blanco"}
	method capacidad() { return interior.capacidad() }
	method velocidad() {return  motor.velocidad() }
	method peso() { return interior.peso() + motor.peso()  + 4000 }
}	 
	
	
	
object interiorComodo {
	method peso() { return 700 } 
	method capacidad() {return 5 }
}

object interiorPopular{
	method peso() { return 1000 }
	method capacidad() {return 12 }
}

object motorPulenta { 
	method peso() { return 800}
	method velocidad() { return 130 }
}	

object motorBataton{
	method peso() { return 500 }
	method velocidad() { return 80 }
}




