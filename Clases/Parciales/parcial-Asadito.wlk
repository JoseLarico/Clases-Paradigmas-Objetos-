class Persona {
    var property posicion
    const property elementosCerca = []
    var property criterio 

    method primerElemento() = elementosCerca.first() 

    method agregarElemento(nuevoElemento) {
      elementosCerca.add(nuevoElemento)
    }
    method removerElemento(elemento) {
        elementosCerca.remove(elemento)
      
    }



}

object sordo{
    method pasame(persona,invitado) {
        persona.agregarElemento(invitado.primerElemento())
        invitado.removerElemento(invitado.primerElemento())
    }   
}

object impaciente {
    method pasame(persona,invitado) {
        
    }
  
}