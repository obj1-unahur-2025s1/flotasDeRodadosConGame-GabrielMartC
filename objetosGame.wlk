import wollok.game.*
import rodados.*
//COLORES
object rojo{
    method image() = "autitoRojo2.png"
}

object verde{
    method image() = "autitoVerde.png"
}

object azul{
    method image() = "autitoAzul.png"
}


//OBSTACULO
class Pared{
    var resistencia = 10
    var image = "paredLadrillos3.jpg"

    method position() = game.center()

    method image(){
        if(resistencia.between(8, 10)){
            image = "paredLadrillos3.jpg"
        }
        else if(resistencia.between(4, 7)){
            image = "paredLadrillos2.jpg"
        }
        else{ //resistencia esta entre 1 y 4
            image = "paredLadrillos1.jpg"
        }
        return image
    }

    method resistencia() = resistencia 
    method perderResistencia(){
        resistencia = 0.max(resistencia - 1)
    }

    method reaccionAColisionCon_(unObjeto){
        self.perderResistencia()
        unObjeto.moverUltDirecOpuesto()
    }

    method mostrarResEnCons(){  
        console.println(resistencia)
    }



}


//DIRECCIONES
object norte {
    method coordenada(posicionAutoAct) = posicionAutoAct.up(0)
    method opuesto() = sur
}


object sur {
    method coordenada(posicionAutoAct) = posicionAutoAct.down(0)
    method opuesto() = norte

}


object este {
    method coordenada(posicionAutoAct) = posicionAutoAct.right(0)
    method opuesto() = oeste

}


object oeste {
    method coordenada(posicionAutoAct) = posicionAutoAct.left(0)
    method opuesto() = este

}