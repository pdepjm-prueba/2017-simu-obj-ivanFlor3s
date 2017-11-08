import Roles.*
import queAcabasDeVerLisa.*
class Arreglar{
	var complejidad
	var herramNecesarias
	constructor(unaComplej,unasHerramsNec){
		complejidad = unaComplej
		herramNecesarias = unasHerramsNec
	}
	method puedeHacersePor(unEmpleado){
		if(unEmpleado.tieneLasHerram(herramNecesarias) && unEmpleado.estaminaSuficiente(complejidad).negate()) throw new Exception("Minion incompetente")
	}
	method esRealizadoPor(unEmpleado){
		unEmpleado.perderEnergia(complejidad)
	}
	method dificultad(unEmpleado) = complejidad * 2
}

class DefenderSector{
	var gradoAmenaza
	constructor(unGrado){
		gradoAmenaza = unGrado
	}
	
	method puedeHacersePor(unEmpleado){
		if (unEmpleado.puedeDefender() && unEmpleado.fuerzaSuficiente(gradoAmenaza).negate()) throw new Exception("empleado afeminado")
	}
	method esRealizadoPor(unEmpleado){
		unEmpleado.ganarPractica()
		unEmpleado.perderEstaminaPorDefender()
	}
	method dificultad(unEmpleado) = gradoAmenaza * unEmpleado.factorDebilidad()
}

class LimpiarSector{
	var tamanioSector
	constructor(unTamanio){
		tamanioSector = unTamanio
	}
	method puedeHacersePor(unEmpleado){
		if(tamanioSector.puedeLimpiarzePor(unEmpleado).negate()) throw new Exception("empleado nuevamente incompetente")
	}
	method esRealizadoPor(unEmpleado){
		unEmpleado.perderEstamina(tamanioSector.estaminaRequerida())
	}
	method dificultad(unEmpleado) = 10
}

object sectorGrande{
	var estaminaReq =4
	method puedeLimpiearzePor(unEmpleado){
		return unEmpleado.estaminaMayor(estaminaReq)}
	method estaminaRequerida() = estaminaReq
}

object sectorChico{
	var estaminaReq =1
	method puedeLimpiearzePor(unEmpleado){
		return unEmpleado.estaminaMayor(estaminaReq)
	}
	method estaminaRequerida() = estaminaReq
	
}