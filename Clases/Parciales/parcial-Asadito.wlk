class Persona {
    var property posicion
    const property elementosCerca = []
    var property criterio      // para pasar los elementos pedidos
    var property preferenciaDeComida
    const property comidasIngeridas = [] 

    method primerElemento() = elementosCerca.first() 

    method agregarElemento(nuevoElemento) {
      elementosCerca.add(nuevoElemento)
    }
    method removerElemento(elemento) {
        elementosCerca.remove(elemento)
      
    }

    method quiereComer(plato) = preferenciaDeComida.puedeComer(plato) // falta ingerir las comidas que si acepta
    method estaPipon() = comidasIngeridas.any({comida => comida.esPesada()})

    method ingerir(plato){
        if(!(self.quiereComer(plato))){
            throw new DomainException(message="No se puede ingerir la comidad porque no es de tu preferencia")
        }
        comidasIngeridas.add(plato)
    }

    method laPasoBien() = self.comioAlgo() and self.condicionParticular()
    method condicionParticular()

    method comioAlgo() = !(comidasIngeridas.isEmpty())

}

object sordo{
    method pasame(elemento,persona,invitado) {
        persona.agregarElemento(invitado.primerElemento())
        invitado.removerElemento(invitado.primerElemento())
    }   
}
object impaciente {
    method pasame(elemento,persona,invitado) {
        invitado.elementosCerca().forEach{elemento => persona.agregarElemento(elemento)}
        invitado.elementosCerca().clear()
    }
}
object cambioLugar{
    var property lugarProvisional = null
    method pasame(elemento,persona,invitado) {
        lugarProvisional = persona.posicion()
        persona.posicion(invitado.posicion())
        invitado.posicion(lugarProvisional)
    }
}

object posta{
    method pasame(elemento,persona,invitado){
        persona.agregarElemento(elemento)
        invitado.removerElemento(elemento)
    }
}

//PUNTO 2 
class Bandeja{
    var property calorias
    var property tieneCarne

    method esPesada() = calorias > 500
}

const ligero = new Bandeja(calorias = 300, tieneCarne=true)  //ejemplo

object vegetariano{
    method puedeComer(plato) = !(plato.tieneCarne())
}

object dietetico{
    var property topeDeCalorias = 500

    method puedeComer(plato) = plato.calorias() < topeDeCalorias 
}

object alternado{
    var property aceptaLaComida = false 

    method puedeComer(plato)= self.alternar()

    method alternar(){
        self.aceptaLaComida(!aceptaLaComida)
        return aceptaLaComida
    }
}
//composite pattern     arbol y hojas
class Combinado{
    const property listaPreferencias = []

    method puedeComer(plato) = listaPreferencias.all({preferencia => preferencia.puedeComer()}) 
}

//PUNTO 3

// esta en persona el metodo pipon


//PUNTO 4
object osky inherits Persona(posicion=1,criterio=posta,preferenciaDeComida=alternado){

    override method condicionParticular()= true

}
object moni inherits Persona(posicion=1,criterio=posta,preferenciaDeComida=alternado){

    override method condicionParticular()= posicion == 11

}
object facu inherits Persona(posicion=1,criterio=posta,preferenciaDeComida=alternado){

    override method condicionParticular()= comidasIngeridas.any({comida=>comida.tieneCarne()})

}
object vero inherits Persona(posicion=4,criterio=posta,preferenciaDeComida=alternado){

    override method condicionParticular()= elementosCerca.size() <= 3
}


//PUNTO 5

// Polimorfismo lo use en las preferencias de comida, donde estas diferentes preferencias 
// entiende todas el mensaje puedeComer(), siendo muy util que lo hagan teniendo diferente
// implementacion, por ejemplo en la combinada que esta formada por pref. simples cuando se 
// se lanza el msj puedeComer() la combinada lo entiende y lo aplica a cada una de las pref.
// simple que la componen, siendo lo mas importante de las preferencias la interfaz

// Herencia lo utilize en el punto 4 donde aparte de las personas que son parte del asado
//existen personas especificas que tienen un cmportamiento diferente pero que tambien
//deben ser personas incluidas en el asado, la ventaja que tengo es de nuevo poder heredar
// la interfaz de class Persona y solo tener que modificar la implementacion especifica de cada
// uno, evitando asi la repeticion de codigo

//Composicion lo utilize en el punto 1 de los criterios para para pasar elementos de la mesa, donde
//cada criterio se encarga de su propia implementacion para pasar un elemento, aparte me fue util,
//usar composicion porque los criterios tienen que poder intercabiarse dinamicamente y ademas poder 
// agregar nuevos criterios a futuro, a lo cual la composicion al otorgarme flexibilidad a costa de 
// mas complejidad me parecio la mejor opcion
