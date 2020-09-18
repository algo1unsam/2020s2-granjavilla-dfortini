class Maiz {

	var property position
	var esAdulta = false

	method image() = if (esAdulta) "corn_adult.png" else "corn_baby.png"

	method regar() {
		esAdulta = true
	}

}

class Trigo {

	var property position
	var crecimiento = 0

	method image() {
		return "wheat_" + crecimiento + ".png"
	}

	method regar() {
		crecimiento++
		if (crecimiento > 3) crecimiento = 0
	}

}

class Tomaco {

	var property position

	method image() {
		return "tomaco_baby.png"
	}

	method regar() {
		if (self.position().y() == 9) {
			self.position(self.position().down(9))
		} else {
			self.position(self.position().up(1))
		}
	}

}

