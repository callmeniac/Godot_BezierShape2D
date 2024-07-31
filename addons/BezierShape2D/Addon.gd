@tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("BezierShape2D", "Path2D", preload("BezierShape2D.gd"), preload("icon.svg"))
