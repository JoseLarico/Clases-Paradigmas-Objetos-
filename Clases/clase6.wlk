// CLASE 16-10

// --------------------------------------TEMA- HERENCIA---------------------------------------------
//EJEMPLO DE AVES, GOLONDRINAS, PETRELES, TORCAZAS
class Ave { //super clase
    var property energia =50
    method volar(kilometros){
        energia -= kilometros + 10
    }
    method comer (gramos){
        energia += gramos * 4 
    }
    method dormir()
}

class Golondrina inherits Ave { //sub clase
    override method dormir(){
        energia =100
    }
}
// BAD SMELL dejarlo vacio a menos que sea un requerimiento
//por ejemplo que me pidan que solo existen solo 3 tipos, pero diferente seria si me piden el comportamiento
// de 3 aves y a parte existen el resto de aves que comparten comportamiento 

class Petrel inherits Ave{
    var property kilometrosRecorridos = 0
    override method volar (kilometros){
        super(kilometros)                         //el orden del super no importa, sigue haciendo los kilometros recorridos abajo
        kilometrosRecorridos += kilometros
    }
    override method dormir(){energia+=1}
}
const golondrina = new Golondrina ()

//DIAGRAMA DE CLASES = Util para ser mas expresivo y comunicar tu codigo con otra personas

//La herencia va desde el comportamiento general en las SUPER CLASES hasta el comportamiento especifico que va en las SUB CLASES

object pepita inherits Golondrina(energia=100){
    override method comer (gramos){
        energia *= gramos
    }
}
//muy util para definir el comportamiento de un objeto unico e irrepetible

class Torcaza inherits Ave{
    override method comer(gramos){
        self.volar(1)
        super(gramos)
    }
    override method dormir(){
        energia += 10
    }
}


// EJEMPLO PERSONAS Y PROPINAS

class Persona{
    method cuantoPagar(importe)= importe + self.propina(importe)
    method propina(importe) 
}

class PersonaAlegre inherits Persona{
    override method propina(importe)= importe * 0.2
}

class PersonaEnojada inherits Persona{
    override method propina(importe)= 0
}

class PersonaIndiferente inherits Persona{
    var property cantidadBolsillo         
    // "cantBolsillo" comportamiento unico de la persona indiferente, no debe estar en la SUPER CLASE
    override method propina(importe)= cantidadBolsillo
}

//Esta solucion si el cambio de humor fuera un requerimiento no estaria bueno, sino utilizar el humor como un atributo

class Persona2{
    var property criterio
    method cuantoPagar(importe)= importe + criterio.propina(importe)
}

object alegre{                             //conviene objeto pq no tiene estado que definir
    method propina(importe)= importe * 0.2
}

object enojada{
    method propina(importe)= 0
}

class Indiferente2{                           
    //el indiferente debe ser una clase pq varia la cantidadBolsillo diferente para cada persona que vaya a exixtir
    var property cantidadBolsillo         
    method propina(importe)= cantidadBolsillo
}



// ------------------------------------------TEMA - INMUTABILIDAD, IDENTIDAD---------------------------------------
class Point {
    const property x
    const property y

    method + (otroPoint)= new Point (x=x+otroPoint.x(),y=y+otroPoint.y())
}

//Inmutable es mas testeable que mutable 

//objetos que representan valores = strings, numeros
//VALUE OBJECTS pueden ser apuntados al mismo objeto no importa
//son importantes para modelar valores que no importa si se repita el objeto que tienen como atributo
//pero las dagas por ejemplo como objeto no esta bueno que se repita la flecha hacia 2 dagas y se modifiquen 
//conjuntamente

class Persona3{
    var property nombre
}

const pedro=new Persona3(nombre="pedro")
const pelusa=new Persona3(nombre="pelusa")
const amiwi = pelusa

class Mail{
    const property asunto
    const property emisor
    const property receptor

    //no se puede redefinir el === pero si el ==
    override method == (otroMail)= asunto == otroMail.asunto() && emisor == otroMail.emisor() && receptor == otroMail.receptor()
}

const invitacion11Oct= new Mail(asunto="asado?",emisor="jc@gmail.com",receptor="fd@gmail.com")
const unMail= invitacion11Oct
//Hago una referencia unMail al mismo objeto invitacion11Oct, lo que cambie en unMail tendra efecto en el estado de invitacion11Oct


//=== identidad  "apuntas al mismo objeto"
//== igualdad   "apuntan al mismo objeto"
//= asignacion   ""

const invitacion18Oct = new Mail(asunto="asado?",emisor="jc@gmail.com",receptor="fd@gmail.com")
//diferente objeto que apunta hacia las mismas referencias que invitacion11Oct, el efecto en invitacion18Oct no afectara a invitacion11Oct

/* 
1) Antes de redefinir ==
> invitacion11Oct === unMail
true
> invitacion11Oct == unMail
true
> invitacion11Oct === invitacion18Oct
false
> invitacion11Oct == invitacion18Oct
false


2) Despues de Redefinir == ahora las preguntas devuelven 
> invitacion11Oct === invitacion18Oct
false
> invitacion11Oct == invitacion18Oct
true
*/^

//Comentar un cacho de codigo ctrl k+c
//Descomentar un cacho de codigo ctrol k+u