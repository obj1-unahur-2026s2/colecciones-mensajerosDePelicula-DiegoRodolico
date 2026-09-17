import example.*
object empresaMensajeria{
    const mensajeros = []
    method contratarMensajero(nuevoMensajero){
        mensajeros.add(nuevoMensajero)
    }
    method despedirMensajero(mensajeroEchado){
        mensajeros.remove(mensajeroEchado)
    }
    method despedirTodosLosMensajeros(){
        mensajeros.removeAll()
    }
    method esGrande(){
        return mensajeros.size() >= 2
    }
    method paquetePuedeSerEntregadoPorPrimerEmpleado(destino){
        return paquete.puedeSerEntregado(self.primerEmpleado(), destino)
    }  
    method primerEmpleado(){
        return mensajeros.first()
    }
    method pesoUltimoMensajero(){
        return self.ultimoMensajero().peso()
    }
    method ultimoMensajero(){
        return mensajeros.last()
    }
}