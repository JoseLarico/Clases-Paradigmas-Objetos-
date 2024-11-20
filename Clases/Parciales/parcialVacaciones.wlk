// PARCIAL VACACIONES

//PUNTO 1
class Lugar{
    const property nombre

    method esDivertido() = self.nombreEsPar() and self.condicionParticular()
    method nombreEsPar() = nombre.size().even()
    method condicionParticular()  

    method esTranquilo()

    method esRaro() = nombre.size() > 10  
}

class Ciudad inherits Lugar {
    var property cantHabitantes 
    var property decibelesPromedio  
    const property atracciones = [] 

    override method condicionParticular() = self.muchasAtracciones() and self.esPoblada()
    method muchasAtracciones() = atracciones.size() > 3
    method esPoblada() = cantHabitantes > 100

    override method esTranquilo() = decibelesPromedio < 20

}

class Pueblo inherits Lugar {
    const property extension
    const property anioFundacion
    const property provincia
    const property provinciasLitoral = ["EntreRios", "Corrientes", "Misiones"] 
    const property provinciaTranquila = "LaPampa" 

    override method condicionParticular() = self.esAntingua() || self.esLitoral()
    method esAntingua() = anioFundacion < 1800
    method esLitoral() = provinciasLitoral.contains(provincia)

    override method esTranquilo() = provincia == provinciaTranquila

}

class Balneario inherits Lugar{
    const property metrosPlaya 
    var property marPeligroso
    var property tienePeatonal

    override method condicionParticular() = self.esGrande() and marPeligroso
    method esGrande() = metrosPlaya > 300 

    override method esTranquilo() = tienePeatonal
}


//PUNTO 2
object divertido {
    method cumpleCondiciones(lugar) = lugar.esDivertido() 
  
}
object tranquilo {
    method cumpleCondiciones(lugar) = lugar.esTranquilo() 
  
}
object raro {
    method cumpleCondiciones(lugar) = lugar.esRaro() 
  
}

class Combinado{
    const property criterios = []

    method cumpleCondiciones(lugar) = criterios.any({criterio => criterio.cumpleCondiciones(lugar)})      
}

class Persona{
    var property preferencia 
    const property precioMaximo  

    method aceptaVacaciones(lugar) = preferencia.cumpleCondiciones(lugar)
}

const ciudadDivertida = new Ciudad(nombre="lugano", cantHabitantes= 100, decibelesPromedio = 10,atracciones = ["rueda","mazo", "turbo","ania"])
const puebloDivertido = new Pueblo(nombre="jelo",extension= "100", anioFundacion= 2000,provincia="LaPampa")

const preferenciaCombinada = new Combinado(criterios=[divertido,raro,tranquilo])

const personaDivertida = new Persona(preferencia=divertido, precioMaximo=200)
const personaTranquila = new Persona(preferencia=tranquilo, precioMaximo=200)
const personaCombinada = new Persona(preferencia=preferenciaCombinada, precioMaximo=200)



//PUNTO 3

class Tour{
    var property fechaDeSalida
    const property personasRequeridas
    const property ciudades = []
    var property precioTour
    const property personasAnotadas = [] 

    method agregarPersona(persona){
        if(self.aceptaPrecio(persona) and self.aceptaLugares(persona) and self.hayLugar()){        //precioAdecuado() and lugaresAdecuados()
            personasAnotadas.add(persona)
        }
        //excepcion?? me detiene el programa, no podria dar de baja personas para agregar nuevas
    } 
    method hayLugar() = personasAnotadas.size() < personasRequeridas
    method aceptaPrecio(persona) = persona.precioMaximo() <= precioTour
    method aceptaLugares(persona) = ciudades.all({ciudad => persona.aceptaVacaciones(ciudad)})

    method darDeBaja(persona) = personasAnotadas.remove(persona)

    method montoPorTour() = self.personasAnotadas().size() * self.precioTour()
}

//PUNTO 4

class Reporte {
    const property listaDeTours = []
    const property anioActual  

    method toursPendientes() = listaDeTours.filter({tour => tour.hayLugar()})

    method montoTotalPorAnio() = self.toursDelAnio().sum({tour => tour.montoPorTour() })
    method toursDelAnio() = listaDeTours.filter({tour => tour.fechaDeSalida().year() == anioActual})


}
