// --------------------------CLASE 2-----------------------------------------


/* CONCEPTOS Y OTRAS COSAS
Lo mas importante en Objetos son los MENSAJES, a la hora de empezar a
modelar es lo primero en lo que tenemos que pensar

Otro concepto igual de importante es el de POLIMORFISMO donde se necesitan
al menos 3 objetos (El objeto que envia el msj y 2 objetos que lo reciben).
El polimorfismo es un concepto que permite que diferentes objetos puedan 
recibir un mismo mensaje (mismo metodo) gracias a que comparten la misma 
interfaz aunque la implementacion de los metodos sea diferente en c/ uno. 

En Paradigmas tenemos que saber que TODO puede ser un objeto.

Los metodos con efecto los reconocemos porque modifican las referencias de 
los objetos, en cambio los de retonrno no lo hacen
CLAVE
-Si retorna -> es de pregunta/retorno
-Si no retorna -> es de efecto/accion

*,+,&&,|| tambien son mensajes pero de retorno    */



/* FECHAS
 Metodos para manejar con fechas:

> const hoy = new Date()
✓
> hoy
✓ 24/11/2017
> hoy.plusYears(1)                 // sumo un año
✓ 24/11/2018                      // devuelve una nueva fecha
> hoy.plusMonths(2)               // sumo 2 meses
✓ 24/1/2018
> hoy.plusDays(20)
✓ 14/12/2017
> hoy.isLeapYear()                // pregunto si el año es bisiesto
✓ false
> hoy.dayOfWeek()                // qué día de la semana es
✓ "friday"
> hoy.month()
✓ 11
> hoy.year()
✓ 2017
> const ayer = hoy.minusDays(1)
✓                              // resto un día para obtener el día de ayer
> ayer < hoy                   // comparo fechas
✓ true
> ayer - hoy                   // comparo fechas
✓ -1                          // diferencia en días entre ayer y hoy
> const haceUnMes = hoy.minusMonths(1)
✓
> ayer.between(haceUnMes, hoy)
✓ true                        // ayer está entre hace un mes y hoy
*/



/*  LAMDA/BLOQUES/CLOSURE EN OBJETOS
En funcional las lamda eran funciones anonimas pero aca en Objetos van a ser 
bloques que nos van a ayudar a:
-poder generar referencias a dichos bloques
-pasarlos como parámetro
-elegir en qué momento ejecutar una porción de código

1) Ejemplo de bloque sin parametro
> const abs4 = { => 4.abs() }        
✓
> abs4
✓ { => 4.abs() }
> abs4.apply()                        Con apply() la invocamos para aplicarla
✓ 4

2) Ejemplo de bloque con parametro (se pueden parametrizar)
>>> const abs = { numero => numero.abs() }
>>
✓
> abs
✓ { numero => numero.abs() }
>>> abs.apply(-8)                     pasamos el parametro mediante el apply
✓ 8

3) Bloques con dos parámetros 	
> { num1, num2 => num1.max(num2) }.apply(4, 2)
✓ 4
> { num1, num2 => num1 + num2 }.apply(4, 2)
✓ 6

O bien podemos currificarlo:
> { num1 => { num2 => num1 + num2 }}.apply(4)
✓ { num2 => num1 + num2 }   // devuelve un bloque

> { num1 => { num2 => num1 + num2 }}.apply(4).apply(2)
✓ 6

4) Contexto de los bloques
Un dato importante de los closures es que no solo acceden a sus parámetros, 
sino también a cualquier otra referencia en el contexto donde fueron definidas. 
Esto las vuelve realmente poderosas. Veamos un ejemplo muy sencillo:

> var to = "world"
✓
> const helloWorld = { "hello " + to }
✓
> helloWorld.apply()      		
✓ "hello world"
> to = "someone else"
✓
> helloWorld.apply()      	
✓ "hello someone else"

> var num = 5
✓
> const bloque = { otroNum => num + otroNum }
✓
> bloque.apply(6)      		
✓ 11
*/

/*
 ORDEN SUPERIOR
Tambien existen estas funciones que esperan bloques como parametros (retorno) 
object x {
    var property atributo = 3
    
    method incrementar() {
        atributo = atributo * atributo
}
}
object y {
    var property atributo = 1

    method incrementar() {
        atributo = atributo + 1
}
}


>const lista = [x,y]
> lista.filter({objeto => objeto.atributo() >2})
[x]
> lista.map({objeto => objeto.atributo()})
[3,1]
> lista.any ({objeto => objeto.atributo() == 3})
true

Y tambien tenemos un metodo que tiene efecto 

lista.forEach({objeto => objeto.incrementar()})

Importante si queremos usar metodos con efecto vamos a usar forEach solamente,
no map, filter, any, all  */


/* EJERCICIO TOM Y JERRY

1)Primera parte
Necesitamos modelar en Wollok a tom que es un gato.
Lo que nos interesa de tom es manejar su energía y su velocidad, que dependen de sus actividades 
de comer ratones y de correr. 
La persona que registra las actividades de tom, registra los ratones que come y la cantidad 
de tiempo que corre en segundos.

Cuando tom come un ratón aumenta su energía en 12 joules + el peso del ratón en 
gramos + 10 joules extra si el ratón está feliz.

La velocidad de tom es 5 metros x segundo + (energia medida en joules / 10). 
La velocidad que se toma es la que corresponde a la energía de Tom antes de empezar a 
correr, y no varía durante una carrera. 

Cuando tom corre, su energía disminuye en (0.5 x cantidad de metros que corrió). 
Observar que la cuenta está en joules consumidos por metro, pero cuando me dicen 
cuánto corrió, me lo dicen en segundos.

Nota: además de tom, hay otros objetos en juego, ¿cuáles son, qué mensaje tienen que entender?

Jerry es un ratón que tiene un peso que se encuentra relacionado a la cantidad 
de cosas que comió: El peso del ratón es de 30 gramos de base + el doble de la cantidad 
de letras que tiene cada alimento "pesado" que ingirió. Los alimentos "pesados" son 
los de más de 4 letras. Por ejemplo si comió "ensalada", "pan" y "churrasco" son 
30 (de base) + 16 (de ensalada) + 18 (de churrasco) = 64 gr.

Jerry está feliz si alguno de los alimentos que comió es "pan". 

Mickey es otro ratón que su peso es de 15 gramos y está feliz si el gato que lo 
quiere comer es su gato favorito Tom.

2) Segunda parte
Lograr que tom entienda el mensaje:
tom.meConvieneComerRatonA(unRaton, unaDistancia)
Se cumple si la energía que gana por comer al ratón es mayor a la que consume corriendo 
la distancia, que está medida en metros.



*/


object tom {
    var property energia = 100
    const property valorBaseEnergia = 12
    const property velBase = 5

    //la vel no es un atributo sino un valor calculado en base a un atributo -> debe ser metodo
    method velocidad() = velBase + (energia / 10) 
    
    // de este metodo de efecto voy a extraer el calculo para usarlo como un metodo de retorno
    method comerRaton(raton) {
    energia = energia + self.energiaGanada(raton)
    }
    method energiaGanada(raton) = valorBaseEnergia + raton.peso() + self.extraSiRatonFeliz(raton)

    //delego tambien la condicion para aumentar la energia si el raton esta feliz
    method extraSiRatonFeliz(raton) = if (raton.estaFeliz(self)) 10 else 0

    // de este metodo de efecto voy a extraer el calculo para usarlo como un metodo de retorno
    method correr(tiempo) {
        const metrosRecorridos = self.velocidad() * tiempo
        energia = energia - self.energiaPerdida(metrosRecorridos)
    }
    method energiaPerdida(metrosRecorridos) = 0.5 * metrosRecorridos

    //delego la cantidad de metros recorridos en otro metodo
    //method metrosRecorridos(tiempo) = self.velocidad() * tiempo

    //Importante el concepto de poder extrar preguntas de metodos con efecto
    method meConvieneComerRatonA(unRaton, unaDistancia) = self.energiaGanada(unRaton) > self.energiaPerdida(unaDistancia)
}

object jerry {
    const property alimentos = ["ensalada", "pan", "churrasco"]
    const property pesoBase = 30

    method peso() = pesoBase +  self.pesoExtra()

    /* aca la suma la hago personalizada gracias al bloque diciento que quiero sumar
    el largo de cada elemento por 2 una vez q ya se que son alimentos pesados*/
    method pesoExtra() =  self.alimentosPesados().sum({alimento => alimento.length()* 2})

    method alimentosPesados() = alimentos.filter({alimento => alimento.length() > 4})

    method estaFeliz(gato) = alimentos.contains("pan") 

}

object micky {

    var property pesoBase = 15
    var property gatoFavorito = tom 

    method peso() = pesoBase

    method estaFeliz(gato) = gatoFavorito == gato 
  
}