extends Node2D

var base_field: Callable = f 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func f(xy: Vector2):
	var value = Vector2(xy.y, xy.x)
	
	return value
