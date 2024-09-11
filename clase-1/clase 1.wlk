object nico {

  method cuantoCobras(materia) = materia.length() * 50 
  // tiene un sist de inferencia de tipos donde
  //detecta va a ser un parametro de tipo string
  
}

/* lo importante de un objeto es su interfaz, los mensajes 
(metodos) que puede utilizar con el*/

object carlono {
  //referencias
  const precioQueNoCambia = 800 
  var precio = 300

  //metodo con efecto (no retorna),las llaves son clave
  method precio(nuevoPrecio) {
    precio = nuevoPrecio
  }

  //metodo con retorno
  method cuantoCobras(materia) = precio 
  
}

object camila {
  var estaDeBuenHumor = true

  //combiene expresarlo en 2 metodos diferentes
  method enojarse() {
		estaDeBuenHumor = false
	}
	method alegrarse() {
		estaDeBuenHumor = true
	}
  /*
  method cambioDeHumor(nuevoHumor) {
    estaDeBuenHumor = nuevoHumor  
  }*/

  method cuantoCobras(materia) = if (estaDeBuenHumor) 250 else 750 


  
}