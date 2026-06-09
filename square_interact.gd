extends RigidBody2D
class_name SquareInteract
var v_field_sum: VectorFieldSum
var gp = Vector2(0,0)

var acceleration = Vector2(0,0)
var velocity = Vector2(0,0)
var internal_fields 
var force = 0
var external_forces = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	internal_fields = get_node("Internals").get_children()
	mass = 20
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gp = global_position
	
	#physics stack
	apply_force(field_force("electric", 60))
	get_node("RayCast2D").target_position = field_force("electric", 60)

	pass

#There should only be one field of each type existing at any time
func field_force(field_type: String, L:float):
	var F = get_tree().get_nodes_in_group(field_type + "_sum")
	
	return F[0].sq_integ_sum(gp, L, internal_fields)
