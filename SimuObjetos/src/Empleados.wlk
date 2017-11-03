import Roles.*
import Tareas.*
import Frutas.*


class Empleado {
	
	var rol
	var tareasRealizadas = #{}
	var estamina = 50
	
	method cambiarRol(_rol){
		
		rol = _rol
	}
	
	method rol(){
		
		return rol
	}
	
	method tareas(){
		
		return tareasRealizadas
	}
	
	method estamina(){
		
		return estamina
	}
	
	/*Conocer la experiencia de un empleado, que se obtiene a partir de la cantidad de tareas
	realizadas multiplicada por la sumatoria de sus dificultades. */
	
	method experiencia(){
		
		return tareasRealizadas.size() * self.dificultadAcumulada()
	}
	
	method dificultadAcumulada(){
		
		return tareasRealizadas.sum({tarea => tarea.dificultad(self)})
	}
	// punto 1
	
	method comerFruta(unaFruta){
		
		estamina += unaFruta.puntos()
		
	}
	
	method recuperarEstamina(unaFruta){
		
		self.comerFruta(unaFruta)
	}
	
	method fuerza(){
		
		return (estamina / 2) + 2
	}
	
	method fuerzaPorRol(){
		
		return rol.fuerzaExtra()
	}
	
	method hacerTarea(unaTarea){
		if(not unaTarea.puedoHacerla(self)){
			throw new NoPuedoHacerlaException()
		}
		
		tareasRealizadas.add(unaTarea)
		rol.hacerPor(self,unaTarea)
		 
	}
	
	method tieneHerramientas(listaHerramientas){
		
		return rol.tieneEstasHerramientas(listaHerramientas)
	}
	
	method perderEstamina(puntos){
		
		estamina -= puntos 
	}
	
	method puedoDefender(){
		
		return rol.puedeDefender()
	}
	
	method perderMitadEstamina(){
		
		estamina = estamina / 2
	}
	
	method estaminaMayorA(_estamina){
		
		return estamina > _estamina
	}
	
	method esSoldado(){
		
		return rol.esSoldado()
	}
	
	method incrementarDanio(puntos){
		
		return rol.aumentarDanio(puntos)
	}
}

class Biclope inherits Empleado {
	
	method factorDebilidad(){
		
		return 1
	}
}

class Ciclope inherits Empleado {
	
	method factorDebilidad(){
		
		return 2
	}
	
	override method fuerza(){
		
		return (super() + self.fuerzaPorRol()) / 2
	}
}

class NoPuedoHacerlaException inherits Exception {}
