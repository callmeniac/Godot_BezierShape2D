@tool
class_name BezierShape2D
extends Path2D

@export var approximation = 5.
@export var closed = true
@export_category('Stroke')
@export var stroke = true
@export var stroke_color = Color.BLACK
@export var stroke_width = 5.
@export_category('Fill')
@export var fill = true
@export var fill_color = Color.WHITE

var line = Line2D.new()
var polygon = Polygon2D.new()
var polygon_colors = PackedColorArray()

func _ready():
	polygon_colors.append(fill_color)

		
func _process(delta):
	if property_list_changed:
		queue_redraw()


func _draw():
	var points = curve.tessellate(5, approximation)
	if curve.point_count > 2:
		if fill:
			polygon_colors.set(0, fill_color)
			draw_polygon(points, polygon_colors)
	if curve.point_count > 1:
		if stroke:
			draw_polyline(points, stroke_color, stroke_width)
