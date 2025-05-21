import rodados.*

class Dependencia{
    const flota = []
    var property empleados = 0

    method agregarAFlota(unRodado) = flota.add(unRodado)

    method quitarDeFlota(unRodado) = flota.remove(unRodado)

    method pesoTotalFlota() = flota.sum({r => r.peso()})

    method estaBienEquipada() = self.tieneAlMenos_Rodados(3) && self.todosVanAlMenosA100Km()

    method tieneAlMenos_Rodados(cantidad) = flota.size() >= cantidad

    method todosVanAlMenosA100Km() = flota.all({ r => r.velocidadMaxima() >= 100})

    method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({r => r.capacidad()})

    method rodadosDeColor(unColor) =  flota.filter({r => r.color() == unColor})

    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()

    method rodadoMasRapido() = flota.max({r => r.velocidadMaxima()})

    method capacidadFaltante() = (empleados - self.capacidadDeLaFlota()).max(0)

    method capacidadDeLaFlota() = flota.sum({r => r.capacidad()})

    method esGrande() = empleados >= 40 && self.tieneAlMenos_Rodados(5)
}