object paquete{
    var estaPago = true
    method puedeSerEntregado(unMensajero,unDestino){
        return unMensajero.puedeLlegar(unDestino) and self.estaPago() 
    }
    method estaPago() = estaPago
    method noEstaPago() {estaPago = false}
    method precio() = 50
}
object paquetito{
    var estaPago = true
    method estaPago() = estaPago
    method puedeSerEntregado(unMensajero,unDestino){
        return true
    }
    method precio() = 0
}
object paquetonViajero{
    const destinos = []
    var montoPagado = 0
    method precio() {
        return destinos.size() * 100
    }
    method pagoParcial(monto){montoPagado = montoPagado + monto}
    method estaPago(){
        return montoPagado >= self.precio()
    }
    method puedeSerEntregado(unMensajero,unDestino){
        return self.estaPago() and destinos.all({ destino => unMensajero.puedeLlegar(destino) })
    }

}
object brooklyn{
    method puedePasar(unMensajero) {
        return unMensajero.peso() >= 1000
    }
}
object matrix{
    method puedePasar(unMensajero) {
      return unMensajero.puedeHacerLLamada()
    }
}
object roberto{
    var transporte = bicicleta
    var peso = 90
    method puedeLlegar(destino){ return destino.puedePasar(self)}
    method cambiarTransporte(nuevoTransporte){transporte = nuevoTransporte}
    method peso() = transporte.peso() + peso
    method puedeHacerLLamada() = false
    method puedeEntregar(estePaquete, destino){return self.puedeLlegar(destino) and estePaquete.puedeSerEntregado(self, destino)}
}
object bicicleta{
    method peso() = 5
}
object camion{
    const acoplado = 500
    var cantidadAcoplados = 1
    method modificarAcoplados(nuevaCantidad) {cantidadAcoplados = nuevaCantidad}
    method peso() = acoplado * cantidadAcoplados
}
object chuckNorris{
    method puedeLlegar(destino){return destino.puedePasar(self)}
    method peso() = 80
    method puedeHacerLLamada() = true
    method puedeEntregar(estePaquete, destino){return self.puedeLlegar(destino) and estePaquete.puedeSerEntregado(self, destino)}
}
object neo{
    var credito = 1
    method puedeLlegar(destino){return destino.puedePasar(self)}
    method cargarCredito() {credito  = credito + 1}
    method hacerLlamada() {credito  = credito - 1}
    method peso() = 0
    method puedeHacerLLamada() {
        if (credito > 0){
            return true
        }
        return false
    }
    method puedeEntregar(estePaquete, destino){return self.puedeLlegar(destino) and estePaquete.puedeSerEntregado(self, destino)}
}
