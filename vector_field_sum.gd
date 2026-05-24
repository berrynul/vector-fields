extends VectorField
class_name VectorFieldSum

func _ready():
	add_to_group(field_group + "_sum")

#this is the vector field function f which is the sum of all vector fields
func f(xy: Vector2):
	var fields: Array = get_tree().get_nodes_in_group(field_group)
	var sum = Vector2(0,0)
	for P in fields:
		if P is VectorField:
			sum += P.f(xy)
	
	return sum
	
#this is used by square areas to determine the total vector encapsulated within the area
func sq_integ_sum(xy, L:float):
	var fields: Array = get_tree().get_nodes_in_group(field_group)
	var sum = Vector2(0,0)
	for P in fields:
		if P is VectorField:
			sum += P.sq_integ(xy, L)
	return sum
