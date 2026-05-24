extends VectorField
@onready var control_node = get_node("ClickDrag")
@export var magnitude = 20000
@export_enum("-1:-1", "1:1")  var polarity = -1

var gp = Vector2(0,0)


func _ready():

	
	pass


func _process(_delta: float) -> void:
	gp = control_node.global_position
	
	
func f(xy: Vector2):
	
	var value = ((magnitude * polarity)/pow((xy - gp).length(), 2) * Vector2(-(xy - gp).y, (xy - gp).x))
	return value
