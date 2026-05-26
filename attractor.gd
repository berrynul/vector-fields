extends VectorField
@export var magnitude = 100
@export_enum("-1:-1", "1:1")  var polarity = -1

var gp = Vector2(0,0)

	
func phi(u, v):
	return u * atan(v/u) + 0.5 * v * log(u*u + v*v)
	pass	
	
func psi(u, v):
	return v * atan(u/v) + 0.5 * u * log(u*u + v*v)
	pass	

func sq_integ(xy: Vector2, L: float):
	var d: Vector2 = xy - gp
	
	var h = L/2
	var u1 = d.x - h
	var v1 = d.y - h
	var u2 = d.x + h
	var v2 = d.y + h

	var Ix = (magnitude * polarity * (phi(u2,v2) - phi(u1,v2) 
	- phi(u2,v1) + phi(u1,v1)))
	var Iy = (magnitude * polarity * (psi(u2,v2) - psi(u1,v2) 
	- psi(u2,v1) + psi(u1,v1)))
	
	return Vector2(Ix, Iy)

func _process(_delta: float) -> void:
	gp = global_position
	
	
func f(xy: Vector2):
	
	var value = ((magnitude * polarity)/pow((xy - gp).length(), 2) * (xy - gp))
	return value
