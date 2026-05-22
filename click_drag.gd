extends Area2D

var is_hovering: bool = false
var is_dragging: bool = false

func _ready() -> void:
	mouse_entered.connect(func(): is_hovering = true)
	mouse_exited.connect(func(): is_hovering = false)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and is_hovering:
			is_dragging = true
		elif not event.pressed:
			is_dragging = false

func _process(_delta: float) -> void:
	if is_dragging:
		get_parent().global_position = get_global_mouse_position()
