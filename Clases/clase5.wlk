import testeoClase5.*
/*
Sistema = conjunto de objetos que colaboran para un objetivo común. 

*/

// CLASE 5   MANEJO DE ERRORES 
object monedero {
    var property plata = 100
    method poner(cantidad) { 
        self.validarMontoPositivo(cantidad)
        plata += cantidad
    }

method sacar(cantidad) { 
   self.validarMontoPositivo(cantidad)
   if (cantidad > plata) {
      throw new UserException(message = "Debe retirar menos de " + plata)
   } 
   plata = plata - cantidad
}

method validarMontoPositivo(cantidad) {                    //abstraemos el msj de error para montos negativos
	if (cantidad < 0) {
		throw new UserException(message = "La cantidad debe ser positiva")
	}
}
}

class UserException inherits Exception { }


//EJEMPLO DANI TAXISTA 
//vemos como mandar un msj de error expresivo para saber por cual razon salio la excepcion

object dani {
    const property viajes = []
    const edadMinimaPasajero = 60

    method destinoComodo(viaje) = viaje.destino() == "Korn"
    method edadPasajeroCorrecta(viaje) = viaje.pasajero().edad() > edadMinimaPasajero

	method puedeTomar(viaje) = self.destinoComodo(viaje) && self.edadPasajeroCorrecta(viaje) 

    method agregarViaje(viaje) {
        if (!self.destinoComodo(viaje)) {
            throw new Exception(message = "No puede tomar el viaje porque el destino " + viaje.destino() + " no es cómodo")
        }
        if (!self.edadPasajeroCorrecta(viaje)) {
            throw new Exception(message = "El pasajero debe tener " +  edadMinimaPasajero  + " años o más")
        }
        viajes.add(viaje)
    }
}

object viaje{
    var property destino = "Lugano" 
    method pasajero() = marcos
}

object marcos {
    method edad() = 70 
}

//TESTEO AVANZADO 
class Ciudad {
	const property consumo
}

object pepita {
	var energia = 100
	const ciudadesFavoritas = [ ] // Nuevo
    
    method energia() = energia

	method esFuerte() = energia > 50

	method volar(ciudad) { // Modificado para recibir una ciudad
		energia -= ciudad.consumo() + 10 
	}

	method comer(gramos) {
		energia += 4 * gramos
	}

	method cumplirDeseo() { // Nuevo
		const destino = ciudadesFavoritas.last()
		self.volar(destino)
		ciudadesFavoritas.remove(destino)
	}

	method agregarCiudad(ciudad) { // Nuevo
		ciudadesFavoritas.add(ciudad)
	}

	method esFavorita(ciudad) = ciudadesFavoritas.contains(ciudad)

}

// //Objetos que me ayudan a producir otros objetos especificos para test

class Persona {
    var plata = 0
    const queTengo = []

    method plata () = plata
    method estaDulce() = plata > 150
    method cobrarSueldo(){
        plata += 200
    }
    method comprar(algo){
        queTengo.add(algo)
        plata -= algo.precio()
    }
    method cosasQueTengo() = queTengo.size()
    method llevoGastado() = queTengo.sum{objeto=>objeto.precio()}      
}

class Comida {
    const calorias
    method precio() = calorias * 2 
}

class Auto {
    const property precio

    
}

