// CLASE 30/10

// --------------------------------COMPOSICION = GOD STRAT = STRATEGY------------------------------------------------

class Parcial {
    const property cantidadPreguntas
    method esDificil() = cantidadPreguntas > 5 
}

class Alumno {
    const property notas = []
    const tipoAlumno = estudioso

    method rendir(nota){
        notas.add(nota)
    }

    method aproboUltimoExamen() = notas.last() >= 6

    method estudiaParaParcial(parcial,alumno) =  tipoAlumno.estudiaPara(parcial, self) 
}

object estudioso {
    method estudiaPara(parcial,alumno) = true 
}

object vago {
    method estudiaPara(parcial,alumno) = !alumno.aproboUltimoExamen() 
}

object hijoDelRigor {
  method estudiaPara(parcial,alumno) = parcial.esDificil() 
}

//necesito minimo 2 objetos para saber una solucion (alumno vago estudia), es mas complejo 
//de resolver, pero gana que los 3 objetos de tipo de alumno son flexibles, puedo cambiar
// su estado en cualquier momento













//Herencia = RIGIDA
// composicion = flexible

// ----------------------------------TEMPLADE METHOD------------------------------
// el template method permite definir el esqueleto de un algoritmo general para un conjunto de
//objetos polimorficos y le da a cada subclase la posbilidad de redefinir una parte de ese algoritmo

// una serie es interesante si su presupuesto es mas de 5 millones y tiene menos de 5 temp
// una peli es intertesante si el presupuesto es mas de 5 millones y fue estrenada este año

//tenemos un comportamiento comun y un comportamientos particulares => herencia y super de una

class Contenido{
    const presupuesto

    method esInteresante() = self.altoPresupuesto() && self.condicionParticular()

    method altoPresupuesto() =  presupuesto > 5   //condicion general

    method condicionParticular()  // metodo abstracto
}
// estoy diciendo que ser interesante es tener alto presupuesto y algo mas
// ese algo mas lo redefino en cada subclase
class Serie inherits Contenido{
    const temporadas

    override method condicionParticular() = temporadas < 5   
    //particular de serie
}

class Pelicula inherits Contenido{
    const calendario = calendarioReal
    const anioEstreno

    override method condicionParticular() = anioEstreno == calendario.anioActual()
    //particular de peli
}
// lo que hago aca es delegar la fecha actual en un objeto externo para despues en los test
// poder tener control sobre el anio que quiera que sea el de estreno (puedo manejar el hoy)
object calendarioReal{
    method anioActual() = new Date().year()
}

//este patron es el TEMPLATE METHOD, busca armar un metodo template que yo tengo que completar
// para evitar la repeticion del codigo con super y aparte no tengo que acordarme de volver a
// a poner el super para poner la primera condicion de es interesnate (presupuesto)
























//template method vs god strat
