import Roles.*

class Tarea {
	
	
	method arreglar(empleado,unaTarea)
	
	method dificultad(unaTarea){
		
		return self.dificultadDeUnaTarea(unaTarea)
		
	}
		
	method dificultadDeUnaTarea(unaTarea)
	
}

class ArreglarMaquina inherits Tarea {
	
	var complejidad
	
	method complejidad(){
		
		return complejidad
	}
	
	override method arreglar(empleado,unaTarea){
		
		return empleado.estamina() >= complejidad 
	}
	
	override method dificultadDeUnaTarea(unaTarea){
		
		return complejidad  * 2
	}
		
}

class RolMucamaException inherits Exception {}

class DefenderSector inherits Tarea {
	
	var amenaza
	
	method amenaza(){
		
		return amenaza
	}
	
	override method arreglar(empleado,unaTarea){
		if(empleado.rol() == new Mucama()){
			
			throw new RolMucamaException("NO PUEDE SER MUCAMA")
		}
		if(empleado.rol() != new Soldado()){
			
			empleado.estamina() / 2
		}
		
		return empleado.fuerza() >= amenaza
		
	}
	
	override method dificultadDeUnaTarea(unaTarea){
//		La dificultad de esta tarea es el grado de
//		 amenaza para los Bíclopes y el doble para los Cíclopes.
	}
	
}

class LimpiarSector inherits Tarea {
	
	var dificultad = 10
	var tamanio = grande
	
	method cambiarDificultad(valor){
		
		dificultad = valor
	}
	
	override method arreglar(empleado,unaTarea){
	
		return empleado.estamina() >= 4 and tamanio == grande 
	}
	
	override method dificultadDeUnaTarea(unaTarea){
		
	}
}

object grande{
	
}

object chico{
	
	
}