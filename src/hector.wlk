import wollok.game.*

object hector {

	var property position = new Position(x = 3, y = 3)
	const property image = "player.png"
	
	method sembrar(unCultivo) {
		if (self.hayUnCultivo()) {
			self.error("no se puede plantar acá")	
		}
		//game.addVisualIn(unCultivo, self.position())
		game.addVisual(unCultivo)		
	}
	
	method hayUnCultivo() {
		return game.getObjectsIn(self.position()).size() > 1
	}
	
	method regar() {
		if (not self.hayUnCultivo()) {
			self.error("no hay nada para regar")
		}
		game.colliders(self).forEach({c => c.regar()})
	}

}


object aspersor {
	
	var property position
	method image() = "aspersor.png"
	
	method regar() {
		const positions = [self.position().up(1), self.position().right(1), self.position().down(1), self.position().left(1)]
		const cultivos = positions.map({p => game.getObjectsIn(p)}).flatten()  
		cultivos.forEach({c => c.regar()})
	}
	
}

