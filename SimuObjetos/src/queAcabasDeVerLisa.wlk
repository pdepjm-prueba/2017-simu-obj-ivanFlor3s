import Tareas.*
import Roles.*
class Empleado{
	var estamina
	var tareasRealizadas = #{}
	var herramientas
	var rol
	constructor (unaEstamina,unasHerram,unRol){
		estamina = unaEstamina
		herramientas = unasHerram
		rol = unRol
	}
	method comer(unaFruta){
		unaFruta.serComida(self)
	}
	method recuperarEstamina(unaCantidad){
		estamina += unaCantidad
	}
	method realizarTarea(unaTarea){
		// relacion rol tarea 
		unaTarea.puedeHacerla(self)
		unaTarea.esRealizadaPor(self)
		tareasRealizadas.add(unaTarea)
	}
	method tieneLasHerram(unasHerram){
		return unasHerram == herramientas.filter({h=>unasHerram.contains(h)})
	}
	method estaminaSuficiente(unaComplejidad){
		return estamina >= unaComplejidad	
	}
	method perderEstamina(unaCantidad){
		estamina -= unaCantidad
	}
	method puedeDefender() = rol.permiteDefender()
	
	method fuerzaSuficiente(unaCant) = unaCant <= self.fuerza()
	
	method fuerza() = (estamina / 2) + 2 + rol.bonusFuerza() 
	
	method ganarPractica() = rol.aumentarDanio()
	
	method perderEnergia(unaCant){
		estamina -= unaCant * rol.bonusPorMucama()
	}
	method perderEstaminaPorDefensa(){
		if (rol.acostumbradoComb() . negate()) estamina /= 2    
	} 
	method factorDebilidad()
	
	method estaminaMayor(unaCant) = unaCant < estamina
	
	method experiencia() = tareasRealizadas.size() * tareasRealizadas.sum({t=>t.dificultad(self)})
}

class Biclope inherits Empleado{
	override method factorDebilidad() = 1
}

class Ciclope inherits Empleado{
	override method factorDebilidad() = 2
	override method fuerza() = super() / 2
}





object manzana{
	method serComida(unEmpleado) = unEmpleado.recuperarEstamina(5)
}
