extends Node2D

@export var grid_size: Vector2i = Vector2i(50, 30)
@export var cell_size: float = 32.0
@export var reference_magnitude: float = 50   # vector length that draws at max visual size
@export var object : Node2D 
func _ready():
	if object == null:
		object = get_parent()
	
func _process(_delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	var max_arrow_length := cell_size * 0.45
	var max_width := 0.5
	var max_head_size := 1
	
	for y in grid_size.y:
		for x in grid_size.x:
			var sample_pos := (Vector2(x, y) - Vector2(20, 10)) * cell_size
			var vec: Vector2 = object.f(sample_pos)
			var magnitude := vec.length()
			
			if magnitude < 0.01:
				continue
			
			# one strength value drives everything
			var t = clamp(magnitude / reference_magnitude, 0.0, cell_size)
			var direction := vec / magnitude   # cheaper than .normalized()
			
			draw_arrow(
				sample_pos,
				sample_pos + direction * max_arrow_length,
				Color.WHITE,
				max_width * t
			)
	
	
func draw_arrow(from: Vector2, to: Vector2, color: Color, 
				width: float = 2.0) -> void:
	var total_length := from.distance_to(to)
	if total_length < 0.1:
		return
	
	var head := width * 3.0   # one knob: head is always 3x line width
	
	var dir := (to - from) / total_length
	var perp := Vector2(-dir.y, dir.x)
	
	# line: full length, untouched by head_size
	draw_line(from, to, color, width, true)
	
	# triangle: base at `to`, tip extends forward by `head`
	draw_colored_polygon([
		to + dir * head,                 # tip (forward of `to`)
		to + perp * head * 0.5,          # left wing (at `to`)
		to - perp * head * 0.5,          # right wing (at `to`)
	], color)
