import example.*
object empresaMensajeria{
    const mensajeros = []
    const paquetesPendientes = []
    const paquetesEntregados = []
     method paquetesEntregados() = paquetesEntregados
     method paquetesPendientes() = paquetesPendientes

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
    method puedeEntregar(paquete,destino){
        return mensajeros.any({m=>m.puedeEntregar(paquete,destino)})
    }
    method todosLosMensajerosQuePuedenLlevar(paquete,destino){
        return mensajeros.filter({m=>m.puedeEntregar(paquete, destino)})
    }
    method tieneSobrepeso(){
        return self.promedioDeMensajeria() > 500
    }
    method promedioDeMensajeria(){
        return mensajeros.sum({m=>m.peso()}) / mensajeros.size()
    }
    method enviarPaquete(paquete,destino){
        if (mensajeros.any({m=>m.puedeEntregar(paquete, destino)}))
            paquetesEntregados.add(paquete)
        else paquetesPendientes.add(paquete)
    }
    method facturacionEmpresa(){
        return paquetesEntregados.sum({p=>p.precio()})
    }
    method enviarTodosLosPaquetes(conjuntoPaquetes, destino){
        conjuntoPaquetes.forEach({p=>self.enviarPaquete(p,destino)})
    }
    method enviarPaquetePendienteMasCaro(destino){
         self.enviarPaquete(self.encontrarPaquetePendienteMasCaro(), destino)
         paquetesPendientes.remove(self.encontrarPaquetePendienteMasCaro())
    }
    method encontrarPaquetePendienteMasCaro(){
        return paquetesPendientes.max({p=>p.precio()}) 
    }

}