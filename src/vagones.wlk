class Formacion{
	var locomotoras=[]
	var vagones=[]
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	method cantMaxPasajeros(){
		return vagones.sum({vagon=>vagon.cantidadDePasajeros()})
	}
	method vagonesPopulares(){
		return vagones.filter({vagon=>vagon.cantidadDePasajeros()>50}).size()
	}
	method esCarguera(){
		return vagones.all({vagon=>vagon.cargaMaxima()>=1000})
	}
	method dispercionDePesos(){
		return vagones.max({vagon=>vagon.pesoMaximo()})-vagones.min({vagon=>vagon.pesoMaximo()})
	}
	method cantidadDeBanios(){
		return vagones.filter({vagon=>vagon.tieneBanio()}).size()
	}
	method mantenimientoGeneral(){
		vagones.forEach({vagon=>vagon.mantenimiento()})
	}
}

class VagonDePasajeros{
	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	var pasajerosPorMt
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
		maderasSueltas.max(0,maderasSueltas-2)
	}
	
}
class VagonesDormitorio{
	var property compartimientos
	var property camasPorCompartimiento
	const property tieneBanios=true
	const cargaMaxima=1200
	method cantidadDePasajeros(){
		return compartimientos*camasPorCompartimiento
	}
	method pesoMaximo(){return 4000+(self.cantidadDePasajeros()*80)+cargaMaxima}
	method mantenimiento(){}
	
}
