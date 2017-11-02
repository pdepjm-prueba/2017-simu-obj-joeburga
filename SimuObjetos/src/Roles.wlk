
class Rol {
	
	var arma
	
	constructor(_arma){
		
		arma = _arma
	}
	
	method defender()
}

class Soldado inherits Rol {
	
	var danio
	
	override method defender(){
		self.usarArma()
	}
	
	method usarArma(){
		
		danio += 2 
	}
	
	method practica(){
		
	}
	
	method fuerza(){
		
		
	}
}

class Obrero inherits Rol {
	
	var herramientas
	
	
	
	
}

class Mucama inherits Rol {
	
	override method defender(){
		
	}
}