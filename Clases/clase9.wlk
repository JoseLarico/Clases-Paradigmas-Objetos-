// CLASE 6/11

// complejidad minima : tiempo * 25
// complejidad media : (tiempo*25) + 5%
// complejidad maxima: 
//                   si tiempo =< 10 dias => (tiempo*25) + 7%
//                   tiempo > 10 dias =>  (tiempo *25) + 7% + 10 x cada dia despues del decimo

// tarea con + 3 subtareas => 4% overhead

// Costo impositivo  
// -3%  A
// -5%  B

// Porcentaje completitud
// -sin subtareas 0% a 100%
// -con subtareas promedio

// Atraso
// -tarea complejidad minima: 5 dias
// - tarea complejidad media: 10 % del tiempo
// - tarea complejidad maxima : 20% del tiempo + 8 dias




// lo mas importante es la interfaz (mensajes), con eso es importante
//composing para estructuras jerarquicas
class Tarea {
    var property tiempo 
    var property complejidad  

    method costo() = self.costoBase() + self.costoPorOverhead() + self.costoImpositivo()        
    //pasarle esto en vez de tiempo lo que gano es mas adaptibilidad y tambien no romper la interfaz

    method costoBase() = complejidad.costoBase(self)

}
class Complejidad {
    method costo(tarea) = self.costoBase(tarea)+ self.extra(tarea) 

    method extra(tarea) 
    // si lo pongo = 0 alguien puede venir e instaciar una complejidad
    
    method costoBase(tarea) = tarea.tiempo() * 25
}


object complejidadMinima inherits Complejidad {
    override method extra(tarea) = 0
}

object complejidadMedia inherits Complejidad{
    override method extra(tarea)= self.costoBase(tarea) * 0.05
}

object complejidadMaxima inherits Complejidad{
    override method extra(tarea)= self.costoBase(tarea) * 0.07 + 10 * 0.max(tarea.tiempo()-10)
}

//un metodo mas cohesivo es que tiene menos responsabilidades

//composicion = flexibilidad
//herencia = rigidez

// usamos hasta ahora composicion-strategy, y template method 

//template method utiliza una plantilla



//composite 
class tareaSimple inherits Tarea{

    method costoPorOverhead() = 0
    method porcentajeCompletitud() = porcentajeCompletitud

    
}