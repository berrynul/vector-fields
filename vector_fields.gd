extends Node2D
class_name VectorField
@export_enum("electric") var field_group: String 

func _ready():
	add_to_group(field_group)


	
	
