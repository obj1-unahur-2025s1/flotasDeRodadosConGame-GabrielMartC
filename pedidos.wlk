import rodados.*
import dependencias.*

class Pedido{
    var property distancia

    var property tiempoMax

    var property cantPasajeros

    const property coloresIncomp

    method velocidadRequerida() = distancia / tiempoMax

    method autoSatisfacePedido(unAuto){
        return self.velMaxAutoEsAlMenos10KmMayor(unAuto) && 
            unAuto.capacidad() >= cantPasajeros &&
            !coloresIncomp.contains(unAuto.color())
            
    }

    // method velMaxAutoEsAlMenos10KmMayor(unAuto) = unAuto.velocidadMaxima() >= self.velocidadRequerida()
    method velMaxAutoEsAlMenos10KmMayor(unAuto) = (unAuto.velocidadMaxima() - self.velocidadRequerida()) >= 10

    method agregarColorImcomp(unColor){
        coloresIncomp.add(unColor)
    }

    method acelerar() = (tiempoMax - 1).max(0)

    method relajar() = tiempoMax + 1

    method tieneComoColorIncompatible(unColor) = coloresIncomp.contains(unColor)
}