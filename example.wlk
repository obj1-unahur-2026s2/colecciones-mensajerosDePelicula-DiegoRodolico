object paquete{
    var estaPago = true
    method puedeSerEntregado(unMensajero,unDestino){
        return unMensajero.puedeLlegar(unDestino) and self.estaPago() 
    }
    method estaPago() = estaPago
    method noEstaPago() {estaPago = false}
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
}
object bicicleta{
    method peso() = 5
}
object camion{
    const acoplado = 500
    var cantidadAcoplados = 0
    method modificarAcoplados(nuevaCantidad) {cantidadAcoplados = nuevaCantidad}
    method peso() = acoplado * cantidadAcoplados
}
object chuckNorris{
    method puedeLlegar(destino){return destino.puedePasar(self)}
    method peso() = 80
    method puedeHacerLLamada() = true
}
object neo{
    var credito = 0
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
}