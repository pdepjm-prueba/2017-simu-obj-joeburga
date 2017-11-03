import Roles.*

class ArreglarMaquina {
	
	var complejidad = 100
	var herramientasRequeridas = #{}
	
	method complejidad(){
		
		return complejidad
	}
	/* El requerimiento para poder arreglar una máquina es tener tanta estamina como 
	 * complejidad tenga la	máquina y tener las herramientas necesarias para arreglarla (nótese 
	 * que si la máquina no requiere de	ninguna herramienta, cualquier empleado con estamina 
	 * suficiente puede arreglarla). */
	 
	method puedoHacerla(empleado){
		
		return empleado.tieneHerramientas(herramientasRequeridas) and empleado.estamina() >= complejidad 
	}
	
	method hacetePor(empleado){
		
		empleado.perderEstamina(complejidad)
	}
	
	method dificultad(empleado){
		
		return complejidad * 2
	}
		
}



class DefenderSector {
	
	var gradoAmenaza = 5
	
	method puedoHacerla(empleado){
		
		return empleado.puedoDefender() and empleado.fuerza() >= gradoAmenaza
		
	}
	
	method hacetePor(empleado){
		if(empleado.esSoldado()){
			
			empleado.incrementarDanio(2)
			
		}else{
			
			empleado.perderMitadEstamina()
		}
		
	}
	
	
	method dificultad(empleado){
//		La dificultad de esta tarea es el grado de
//		 amenaza para los Bíclopes y el doble para los Cíclopes.
		return gradoAmenaza * empleado.factorDebilidad()
	}
	
}

class LimpiarSector {
	
	var dificultad = 10
	var tamanio = grande
	
	method cambiarDificultad(valor){
		
		dificultad = valor
	}
	
	method cambiarTamanio(_tamanio){
		
		tamanio = _tamanio
	}
	
	method puedoHacerla(empleado){
	
		return empleado.estaminaMayorA(tamanio.estaminaNecesaria())
	}
	
	method hacetePor(empleado){
		
		empleado.perderEstamina(tamanio.estaminaNecesaria())
	}
	
	method dificultad(empleado){
		
		return dificultad
	}
}


object grande {
	
	method estaminaNecesaria(){
		
		return 4
	}
}

object otroTamanio {
	
	method estaminaNecesaria(){
		
		return 1
	}
}

class RolMucamaException inherits Exception {}