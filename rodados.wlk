import colores.*
import wollok.game.*


class Corsa {
  // const pasoPor = [position]
  const registroPosiciones = [position] //ej: (3,5), (3.6), (3,7) y (4,7)

  var property color

  //ubicacion en un mapa de coord
  var position = new Position(x=0,y=0)

  var colorVisualActual = "autitoRojo2.png"

  //otra forma de agregar position
  // var position = game.at(0,0)

  method capacidad() = 4

  method velocidadMaxima() = 150

  method peso() = 1300

  method pasoPor(unaPosicion) = registroPosiciones.contains(unaPosicion)

  method pasoPorFila(numero) = registroPosiciones.any({pos => pos.x() == numero})

  method recorrioFilas(lista_de_numeros) = lista_de_numeros.all({fila => self.pasoPorFila(fila)})

  method position() = position
  method position(unaPosicion){
    position = unaPosicion
  }

  method image() = colorVisualActual

  method cambiarDeColor(unColor){
    color = unColor
    colorVisualActual = unColor.image()
  }

  method registrarPosicion(nuevaPosicion){
    // const nuevaPos = position.unaDireccion
    /*
      position.right(1)
      position.left(1)
      position.down(1)
      position.up(1)

    */

    registroPosiciones.add(nuevaPosicion)
  }

  method registroPosiciones() = registroPosiciones

  //para probar por consola
  method mostrarRegistroEnPantalla(){  
    game.say(self, console.println(self.registroPosiciones())) 
  }
}

class Kwid {
  var property tieneTanqueAdicional

  method capacidad() = if(tieneTanqueAdicional) 3 else 4

  method velocidadMaxima() = if(tieneTanqueAdicional) 120 else 110

  method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0

  method color() = "azul"
}

object trafic {
  var property interior = comodo
  var property motor = pulenta
  
  method capacidad() = interior.capacidad() 

  method velocidadMaxima() = motor.velocidad()

  method peso() = 4000 + interior.peso() + motor.peso()

  method color() = "blanco"
}

object comodo {
  method capacidad() = 5

  method peso() = 700
}

object popular {
  method capacidad() = 12

  method peso() = 1000
}

object pulenta {
  method peso() = 800

  method velocidad() = 130
}

object bataton {
  method peso() = 500

  method velocidad() = 80
}

class Especial{

  var property capacidad

  var property color

  //modificacion enunciado: velocidadMaxima no puede ser modificada
  // const property velocidadMaxima

  //otra forma
  const velocidadMaxima
  method velocidadMaxima() = velocidadMaxima.min(topeVelocidadMaxima.tope())

  var property peso
}

/*"tope" de velocidad maxima
  usar un objeto externo para hacer comparaciones(que puede cambiar), para todos los autos especiales
  que vayan a crearse
*/
object topeVelocidadMaxima{
  var property tope = 200 
}