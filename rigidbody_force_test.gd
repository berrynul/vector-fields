extends RigidBody2D
@export var intended_force = Vector2(0,1)



func _process(_delta: float) -> void:
	
	
	apply_force(intended_force)
	
