
class Rol {
	
	method esSoldado(){
		
		return false
	}
	
	
	method puedeDefender(){
		
		return true
	}
	
	method fuerzaExtra(){
		
		return 0
	}
	
	method tieneEstasHerramientas(listaHerramientas){
		return listaHerramientas.isEmpty()
	}
	
	method hacerPor(empleado,unaTarea){
		
		unaTarea.hacetePor(empleado)
	}

	method aumentarDanio(puntos){
		
	}
}

class Soldado inherits Rol {
	
	var danio = 20
		
	override method fuerzaExtra(){
		
		return danio
	}
	
	override method esSoldado(){
		
		return true
	}
	
	override method aumentarDanio(puntos){
		
		danio += puntos
	}
}

class Obrero inherits Rol {
	
	var herramientas
	
	constructor(_listaHerramientas){
		
		herramientas = _listaHerramientas
	}
		
	override method tieneEstasHerramientas(listaHerramientas){
		
		return herramientas.all({herramienta => herramientas.contains(herramienta)})
	}
	
}

class Mucama inherits Rol {
	
		
	override method puedeDefender(){
		
		return false
	}

}

class Capataz inherits Rol {
	/*Agregar un nuevo rol: El Capataz. Los capataces tienen a cargo a otros empleados. 
	 * Cuando se le pide a un capataz que haga algo, él se lo delega a su subordinado 
	 * más experimentado de los que puedan realizar la tarea. Si no hay ninguno que pueda 
	 * hacerla, debe hacerla él. */
	var empleadosACargo
	
	constructor(_empleadosACargo){
		
		empleadosACargo = _empleadosACargo
	}
	method empleadosQuePuedenHacerTarea(unaTarea){
		
		return empleadosACargo.filter{empleado => unaTarea.puedoHacerla(empleado)}
	}
	
	method empleadoMasExperimentadoAlHacerTarea(unaTarea){
		
		return self.empleadosQuePuedenHacerTarea(unaTarea).max{empleado => empleado.experiencia()}
	}
	
	override method hacerPor(empleado,unaTarea){
		if(self.empleadosQuePuedenHacerTarea(unaTarea).isEmpty()){
			
			unaTarea.hacetePor(empleado)
			
		}else{
			
			unaTarea.hacetePor(self.empleadoMasExperimentadoAlHacerTarea(unaTarea))
		}
	}
	
	
}