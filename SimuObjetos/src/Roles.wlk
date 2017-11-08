import queAcabasDeVerLisa.*
import Tareas.*

class Rol {
	method permiteDefender() = true
	method bonusFuerza() = 0
	method aumentarDanio(){}
	method bonusPorMucama() = 1
	
}
class Mucama inherits Rol{
	override method permiteDefender() = false
	override method bonusPorMucama() = 0
}
class Obrero inherits Rol{
	var herramientas
	constructor(unasHerram){
		herramientas = unasHerram
	}
}
class Soldado inherits Rol{
	var danio
	override method aumentarDanio(){
		danio += 2
	}
	override method bonusFuerza() = danio * 3
}
class Capataz inherits Rol{
	var subordinados
	constructor (unosSub){
		subordinados = unosSub
	}
	method comoActua(){
		
	}
	method delegarTarea(tarea){
		
	}
}