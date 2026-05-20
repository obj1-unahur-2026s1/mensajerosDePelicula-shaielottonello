import mensajeros.* 
import paquetes.*

object empresa {
    const mensajeros = [] // set=conjunto, list=lista
    const property paquetesPendientes = []
    const property paquetesEnviados = []

    method mensajeros() = mensajeros
    method contratarUnMensajero(unMensajero) {
        mensajeros.add(unMensajero)
    }
    method despedirUnMensajero(unMensajero) {
        mensajeros.remove(unMensajero)
    }
    method despedirATodos() {
        mensajeros.clear()
    }
    method agregarListaDeMensajeros(listaDeMensajeros) {
        mensajeros.addAll(listaDeMensajeros)
    }
    // empresa.agregarListaDeMensajeros([roberto, chuckNorris, neo])
    method eliminarListaDeMensajeros(listaDeMensajeros) {
        mensajeros.removeAll(listaDeMensajeros)
    }
    method esGrande() {
        return mensajeros.size() > 2
    }
    method puedeSerEntregadoPorElPrimerMensajero(unPaquete) {
        return unPaquete.puedeSerEntregado(self.primerEmpleado())
    }
    method primerEmpleado() = mensajeros.first()
    method pesoDelUltimoMensajero() {
        return self.ultimoEmpleado().pesoTotal()
    }
    method ultimoEmpleado() = mensajeros.last()

    method puedeSerEntregadoPorLaEmpresa(unPaquete) {
        return mensajeros.any({ m => unPaquete.puedeSerEntregado(m) })
    }

    method mensajerosHabilitadosParaEntregar(unPaquete) {
        return mensajeros.filter({ m => unPaquete.puedeSerEntregado(m) })
    }

    method tieneSobrepeso() {
        const pesoTotalEmpresa = mensajeros.sum({ m => m.pesoTotal() })
        return (pesoTotalEmpresa / mensajeros.size()) > 500
    }

    method enviarUnPaquete(unPaquete) {
        const habilitados = self.mensajerosHabilitadosParaEntregar(unPaquete)
        if (habilitados.isEmpty()) {
            paquetesPendientes.add(unPaquete)
        } else {
           paquetesEnviados.add(unPaquete)
        }
    }

    method facturacion() {
        return paquetesEnviados.sum({ p => p.precioTotal() })
    }

    method enviarLoteDePaquetes(listaDePaquetes) {
        listaDePaquetes.forEach({ p => self.enviarUnPaquete(p) })
    }

    method paqueteMasCaro() {
        return paquetesPendientes.max({ p => p.precioTotal() })
    }

    method enviarPendienteMasCaro() {
        if (!paquetesPendientes.isEmpty()) {
            const masCaro = self.paqueteMasCaro()
            const habilitados = self.mensajerosHabilitadosParaEntregar(masCaro)
            if (!habilitados.isEmpty()) {
                paquetesEnviados.add(masCaro)
                paquetesPendientes.remove(masCaro)
            }
        }
    }
}