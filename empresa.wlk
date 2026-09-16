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
    method paquetePuedeSerEntregadoPorPrimerEmpleado(){
        //pensarlo
    }  
    method pesoUltimoMensajero(){
        //pensarlo
    }
}