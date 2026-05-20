import mensajeros.*
import destinos.*
object paquete {
  var estaPago = false
  var destino = brooklyn

  method precioTotal() = 50
  method registrarPago() {estaPago = true}
  method cancelarPago() {estaPago = false}
  method cambiarDestino(nuevoDestino) {destino=nuevoDestino}
  method puedeSerEntregado(unMensajero) {
    return estaPago && destino.dejaPasar(unMensajero)
  }
}

object paquetito {
  method estaPago() = true
  method puedeSerEntregado(unMensajero) = true
  method precioTotal() = 50
}

object paqueton {
  const property destinos = #{}
  var importePagado = 0
  method estaPago() = importePagado == self.precioTotal()
  method pagoParcial(unValor) {
    importePagado = (importePagado + unValor).min(self.precioTotal())
  }
  method precioTotal() = destinos.size() * 100
  method puedeSerEntregado(unMensajero) {
    return self.estaPago() && destinos.all ({ d => d.dejaPasar(unMensajero) })
  }
}

object paqueteExpress {
  var property estaPago = false
  var property destino = brooklyn
  method cambiarDestino(nuevoDestino) {destino=nuevoDestino}
  method precioTotal() = 150
  method registrarPago() { estaPago = true }
  method puedeSerEntregado(unMensajero) = estaPago && destino.dejaPasar(unMensajero) && unMensajero.pesoTotal() < 100
}