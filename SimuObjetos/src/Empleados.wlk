import Roles.*
import Tareas.*
import Frutas.*


//biclopes-->tareas-->estamina=10 / Ciclopes--->armas-->estamina= 9999
class Empleado {
	
	var rol
	var tarea
	var estamina
	
	constructor(_rol,_tarea,_estamina){
		
		rol = _rol
		tarea = _tarea
		estamina = _estamina	
	}
	
	method cambiarRol(_rol){
		
		rol = _rol
	}
	
	method rol(){
		
		return rol
	}
	
	method cambiarTarea(_tarea){
		
		tarea = _tarea
	}
	
	method tarea(){
		
		return tarea
	}
	
	method estamina(){
		
		return estamina
	}
	
	method fuerza(){
		
		return (estamina / 2) + 2 + rol.danio()//practica
	}
	
	method hacerTarea(unaTarea){
		
		unaTarea.arreglar(self,unaTarea)
		estamina -= unaTarea.complejidad() 
	}
	
	method comerFruta(unaFruta){
		
		estamina += unaFruta.puntos()
		
	}
	
	method recuperarEstamina(unaFruta){
		
		self.comerFruta(unaFruta)
	}
}

