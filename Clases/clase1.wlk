// CLASE 1

/* --- Primera parte: qué te puedo cobrar

La materia la representamos como un String
- Nico: te cobra 50 pesos por cada letra de la materia que da.
  Ejemplos: por "historia" te cobra 8 * 50 = 400
  por "matemáticas" te cobra 11 * 50 = 550
  
- Carlono
  cobra una cantidad variable (por ahora es 300, se ajusta por inflación)

- Camila
  - si está de buen humor, te cobra 250 
  - si no, te cobra 700

  es de humor variable

- Lucas, es un alumno
  - tiene plata ($ 400) y tiene un profe preferido, que puede cambiar.
  - está feliz si su profe preferido le puede dar clases particulares de geografía
  - nico le cobra 450 (9 * 50), carlono le cobra 300, camila 250 ó 700.
  

  ----Segunda parte: 

- Sabemos las materias que estudia Lucas: [ "historia", "matematicas", "fisica" ]
- Queremos saber si un profe le cae bien un alumno
  - A Nico le cae bien los que estudian Física.
  - A Carlono le caen bien todos.
  - A Camila le caen bien los que estudian más de 3 materias.
Ahora aparece una alumna nueva: **Melanie**, qué necesitamos que sepa contestar 
  para incorporarla a nuestra solución.
*/


object nico {

  method cuantoCobras(materia) = materia.length() * 50 
  /* tiene un sist. de inferencia de tipos donde
  detecta que va a ser un parametro de tipo string


  method leCaeBien(alumno) = alumno.materiasQueEstudia().contains("fisica")

  esto hace que nico conozca la implementacion del alumno, lo cual hace que tengan
  un fuerte acomplamiento (MAL), tengo que saber lo minimo e indispensable*/
  
  //delego en el alumno como buscar la materia 
  method leCaeBien(alumno) = alumno.estudia("fisica")
  

}

/* lo mas importante de un objeto es su interfaz, osea los mensajes 
(metodos) que puede utilizar con el*/

object carlono {
  //referencias
  // const precioQueNoCambia = 800 
  var precio = 300

  //metodo con efecto (no retorna), las llaves son clave
  method precio(nuevoPrecio) {
    precio = nuevoPrecio
  }

  //metodo con retorno
  method cuantoCobras(materia) = precio 

  method leCaeBien(alumno) = true
}

object camila {
  var property estaDeBuenHumor = true

  //combiene expresarlo en 2 metodos diferentes antes que en 1 solo con parametro
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
  /*si quisiera pasar como paramatro de una funcion un metodo conviene
  usar self.metodo()
  camila no necesita el parametro materia en "cuantocobras()" pero lo ponemos para que
  pueda entender el mismo msj q los otros profes, se beneficia lucas
  */


  method leCaeBien(alumno) = alumno.estudiaMasDe(3)
}


object lucas {
  var property plata = 400
  var profePreferido = nico
  const property materiasQueEstudia = [ "historia", "matematicas", "fisica" ]

  method profePreferido(nuevoProfe) {
    profePreferido = nuevoProfe
  }

  method estaFeliz() = profePreferido.cuantoCobras("geografia") <= plata

  method estudia(materia) = materiasQueEstudia.contains(materia)

  method estudiaMasDe(minimo) = materiasQueEstudia.size() > minimo

}

object melanie {
  const property materiasQueEstudia = ["f2","am1","ssl"]
  
  method estudia(materia) = materiasQueEstudia.contains(materia)

  method estudiaMasDe(minimo) = materiasQueEstudia.size() > minimo
  
}

/* Es IMPORTANTE saber que metodos va a necesitar melanie para funcionar con los metodos
que tienen los objetos profes, en este caso solo estudia() y estudiaMasDe() */




/*CLAVE 
-Poder definir objetos que entienden los mismos msjs significa que los objetos son
POLIMORFICOS (concepto import. en objetos) y es la capacidad de un objeto de mandar msjs
a objetos con misma interfaz pero distinta implementacion 

-cuantoCobra() solo espera recibir un string, esa es su interfaz

-leCaeBien() para nico espera un tipo alumno por el msj q despues envia, pero para 
carlono puede entrar cualquier cosa

- el MethodLook up es quien se encarga de buscar los metodos de un msj
*/


/*FUNCIONES CLAVES
,length = largo de un string
.add(number) = agrega elementos a una lista
.remove(number) = remueve elementos de una lista
.contains(cosa) = si contiene ese elemento
.size() = largo de una lista

lista= [a,b,c]
unset = #{}                           a diferencia de una lista no tiene repetidos ni tampoco orden



*/