import personajes.*

object empresaMensajeria {
	const mensajeros = []
	const paquetesPendientes = []
	const paquetesEnviados = []
	method mensajeros() = mensajeros
	method contratarMensajero(mensajero) = mensajeros.add(mensajero)
	method despedirMensajero(mensajero) = mensajeros.remove(mensajero)
	method despedirTodosLosMensajeros() = mensajeros.clear()
	method mensajeriaEsGrande() = mensajeros.size() > 2
	method puedeEntregarPaquete(unPaquete) = !mensajeros.isEmpty() and mensajeros.first().puedeEntregar(unPaquete)
	method pesoDeUltimoMensajeroContratado() = mensajeros.last().peso()
	method puedenEntregar(unPaquete) = mensajeros.any({mensajero => mensajero.puedeEntregar(unPaquete)})
	method todosPuedenEntregar(unPaquete) = mensajeros.all({mensajero => mensajero.puedeEntregar(unPaquete)})
	method mensajeriaEnSobrePeso() = mensajeros.sum({mensajero => mensajero.peso()}).div(mensajeros.size()) > 500
	method agregarPaqueteAListaDeEnviados(unPaquete){
		paquetesEnviados.add(unPaquete)
	}
	method paquetesPendientes() = paquetesPendientes
	method paquetesEnviados() = paquetesEnviados
	method agregarPaqueteAListaDePendientes(unPaquete){
		paquetesPendientes.add(unPaquete)
	}
	method enviarPaquete(unPaquete){
		if(self.puedenEntregar(unPaquete)){
			self.agregarPaqueteAListaDeEnviados(unPaquete)
		}
		else{
			self.agregarPaqueteAListaDePendientes(unPaquete)			
		}
	}
	method facturacionTotal() = paquetesEnviados.sum({unPaquete => unPaquete.precio()})
	method enviarTodosLosPaquetes(conjunto){
		conjunto.asList().forEach({unPaquete => self.enviarPaquete(unPaquete)})
	}
	method enviarPaquetePendienteMasCaro(){
		self.enviarPaquete(paquetesPendientes.max({unPaquete => unPaquete.precio()}))
		paquetesPendientes.remove(paquetesPendientes.max({unPaquete => unPaquete.precio()}))
	}
}

