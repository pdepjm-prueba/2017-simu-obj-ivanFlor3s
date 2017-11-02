class Empleado{
	var estamina
	var rol
	var herramientas = #{}
	constructor(unaEstamina,unRol){
		estamina = unaEstamina
		rol = unRol
	}
	
	method arreglar(unaMaquina){
		if (self.estaminaMayorAComplejidad(unaMaquina) && self.tieneLasHerramPara(unaMaquina)) unaMaquina.quedaArreglada()
		else throw new Exception("Su estamina es insuficiente")
	}
	method estaminaMayorAComplejidad(unaMaquina) = unaMaquina.complejidad() < self.estamina()
	method tieneLasHerramPara(unaMaquina){
		return unaMaquina.requiereHerram() == herramientas.filter({h=>unaMaquina.necesita(h)})
	}
	
	method estamina()
	method cambiarOficio(nuevoRol){
		rol.anularDanio()
		rol = nuevoRol
	}
	method fuerza() = self.estamina()/2 + 2 + rol.fuerzaDeRol()
	method fuerzaMayorA(unaCant) = self.fuerza() >= unaCant
	
	method defenderSector(gradoAmenaza){
		if (self.capazDeDefender(gradoAmenaza).negate()) 
		throw new Exception("Las mucamas no pueden defender")
	}
	method capazDeDefender(gradoAmenaza) = rol.puedeDefender() && self.fuerzaMayorA(gradoAmenaza)
}
class Biclope inherits Empleado{
	const ojos = 2
	override method estamina()= estamina .max(10)
	
}
class Ciclope inherits Empleado{
	const ojos = 1
	override method estamina() = estamina
	method aciertaDisparos(cantDisparos)= cantDisparos / 2
	
}

class Rol{
	var tipo
	var danioPorArma
	constructor(unTipo,unDanio){
		danioPorArma = unDanio
		tipo = unTipo
	}
	method fuerzaDeRol() = 0
	method anularDanio(){}
	method puedeDefender() = true
}

class Soldado inherits Rol{

	method usarArma(){
		danioPorArma +=2
	}
	override method fuerzaDeRol() = danioPorArma
	override method anularDanio(){
		danioPorArma = 0
	}
}

class Obrero inherits Rol{
}
class Mucama inherits Rol{
	override method puedeDefender() = false
}