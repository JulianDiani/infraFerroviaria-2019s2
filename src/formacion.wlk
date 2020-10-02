import vagones.*
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
	method vagonMasPesado(){
		return vagones.max({vagon=>vagon.pesoMaximo()})
	}
	method vagonMasLiviano(){
		return vagones.min({vagon=>vagon.pesoMaximo()})
	}
	method dispersionDePesos(){
		return self.vagonMasPesado().pesoMaximo()- self.vagonMasLiviano().pesoMaximo()
	}
	method cantidadDeBanios(){
		return vagones.filter({vagon=>vagon.tieneBanios()}).size()
	}
	method mantenimientoGeneral(){
		vagones.forEach({vagon=>vagon.mantenimiento()})
	}
	method vagonConMasPasajeros(){
		return vagones.max({vagon=>vagon.cantidadDePasajeros()})
		}
	method vagonConMenosPasajeros(){
		return vagones.min({vagon=>vagon.cantidadDePasajeros()})	
	}
	
	method estaEquilibrada(){
		return (self.vagonConMasPasajeros().cantidadDePasajeros())-(self.vagonConMenosPasajeros().cantidadDePasajeros())<20
	}
	method estaOrganizada(){
		var vagonesConPasajeros=[]
		var vagonesSinPasajeros=[]
		var orden=[]
		vagones.forEach({vagon=>if(vagon.cantidadDePasajeros()>0){vagonesConPasajeros.add(vagon)}else
			{vagonesSinPasajeros.add(vagon)}})
			orden.addAll(vagonesConPasajeros)
			orden.addAll(vagonesSinPasajeros)
			return orden==vagones
	}
}