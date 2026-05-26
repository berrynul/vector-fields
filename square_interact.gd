extends Area2D
class_name SquareInteract
var v_field_sum: VectorFieldSum
var gp = Vector2(0,0)
@export var mass = 20
var acceleration = Vector2(0,0)
var velocity = Vector2(0,0)
var L



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gp = global_position
	
	#physics stack
	acceleration = field_force("electric", 60)/mass
	velocity += acceleration * delta
	
	position += velocity * delta  
	pass

#There should only be one field of each type existing at any time
func field_force(field_type: String, L:float):
	var F = get_tree().get_nodes_in_group(field_type + "_sum")
	
	return F[0].sq_integ_sum(gp, L)
