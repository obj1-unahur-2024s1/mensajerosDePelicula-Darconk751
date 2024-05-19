import mensajeria.*

object bicicleta{
	method peso() = 5
}

object camion{
	var cantidadDeAcoplados = 0
	method cantidadDeAcoplados() = cantidadDeAcoplados
	method nuevaCantidadDeAcoplados(nuevaCantidadDeAcoplados){
		cantidadDeAcoplados = nuevaCantidadDeAcoplados
	}
	method peso(){
		return 500 * self.cantidadDeAcoplados()
	}
}

object roberto {
	var transporteEnElQueViaja = camion
	var peso = 90
	method peso(){
		return peso + transporteEnElQueViaja.peso()
	}
	method cambiarPeso(pesoNuevo){
		peso = pesoNuevo
	}
	method transporteEnElQueViaja() = transporteEnElQueViaja
	method cambiarTransporteEnElQueViaja(nuevoTransporte){
		transporteEnElQueViaja = nuevoTransporte
	}
	method puedeLlamar() = false
	method puedeEntregar(unPaquete) = unPaquete.estaPago() 
}

object chuckNorris{
	method peso() = 80
	method puedeLlamar() = true
	method puedeEntregar(unPaquete) = unPaquete.estaPago() 
}

object neo {
	var tieneCredito = true
	method tieneCredito() = tieneCredito
	method nuevoEstadoDelCredito(){
		tieneCredito = !tieneCredito
	}
	method peso() = 0
	method puedeLlamar() = tieneCredito
	method puedeEntregar(unPaquete) = unPaquete.estaPago() 
}

object puenteDeBrooklyn{
	method puedePasar(mensajero) = mensajero.peso() <= 1000
}

object laMatrix{
	method puedePasar(mensajero) =  mensajero.puedeLlamar()
}

object paquete{
	method estaPago() = self.precio() == 50
	method precio() = 50
}

object paquetito {
	method precio() = 0
	method estaPago() = self.precio() == 0
}

object paquetonViajero {
	var totalPagado = 0
	const destinos = [puenteDeBrooklyn, laMatrix]
	method totalPagado() = totalPagado
	method pagarParteDelTotal(cantidad){
		totalPagado = self.precio().min(totalPagado + cantidad)
	}
	method destinos() = destinos
	method destinos(nuevoDestinoAgregado){
		destinos.add(nuevoDestinoAgregado)
	}
	method estaPago() = self.precio() == self.totalPagado()
	method precio() = 100 * destinos.size()
}