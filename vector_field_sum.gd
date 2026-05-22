extends Node2D

var vector_sum: Callable



func f(xy: Vector2):
	var fields: Array = get_children()
	var sum = Vector2(0,0)
	for P in fields:
		print("test")
		if P is VectorField:
			sum += P.f(xy)
	
	return sum
