extends Node2D



func _on_time_collider_area_entered(area: Area2D) -> void:
	if area.name == "SnakeBody":
		queue_free()
