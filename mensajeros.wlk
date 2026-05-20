import vehiculos.*
object roberto {
    //const vehiculosPosibles = [bicicleta, moto, auto]
    var property peso = 90 // asumo que puede cambiar su peso
    var vehiculo = bicicleta
    method pesoTotal() {
        return peso + vehiculo.peso()
    }

    method cambiarDeVehiculo(unVehiculo) {
        vehiculo = unVehiculo
    } 

    method puedeLlamar () = false

    //method peso() = peso // getter
    //method peso(unValor) {peso = unValor} // setter
}

object chuckNorris {
    method pesoTotal() = 80
    method puedeLlamar() = true
}

object neo {
    var credito = 0
    method pesoTotal() = 0
    method puedeLlamar() = credito > 0
    method cargarCredito(valor) {credito += valor}
    method consumirCredito(valor) {
        credito = (credito - valor).max(0)
        }
}

object pipe {
  method pesoTotal() = 75
  method puedeLlamar() = true
}