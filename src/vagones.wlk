class VagonDePasajeros{
	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	var pasajerosPorMt=0
	method cantidadDePasajeros(){
		if(ancho<=3){
			pasajerosPorMt=8
		}
		else{pasajerosPorMt=10}
		return if(estaOrdenado){pasajerosPorMt*largo}else{(pasajerosPorMt*largo)-15}
	}
	method cargaMaxima(){
		return if(tieneBanios){300}else{800}
	}
	method pesoMaximo(){
		return 2000+(self.cantidadDePasajeros()*80)+self.cargaMaxima()
	}
	method mantenimiento(){
		if(not estaOrdenado){estaOrdenado=true}
	}
	
}

class VagonDeCarga{
	var property cargaMaximaIdeal
	var property maderasSueltas
	const property cantidadDePasajeros=0
	const property tieneBanios=false
	method cargaMaxima(){
		return cargaMaximaIdeal-(maderasSueltas*400)
	}
	method pesoMaximo(){
		return 1500+self.cargaMaxima()
	}
	method mantenimiento(){
		if(maderasSueltas>2){
			maderasSueltas-=2
		}else{maderasSueltas=0}
	}
	
}
class VagonDormitorio{
	var property compartimientos
	var property camasPorCompartimiento
	const property tieneBanios=true
	const property cargaMaxima=1200
	method cantidadDePasajeros(){
		return compartimientos*camasPorCompartimiento
	}
	method pesoMaximo(){return 4000+(self.cantidadDePasajeros()*80)+cargaMaxima}
	method mantenimiento(){}
	
}
