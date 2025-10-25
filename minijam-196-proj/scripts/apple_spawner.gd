extends Node2D

var Apple = preload("res://scenes/Apple.tscn")

func _physics_process(delta: float) -> void:
	Spawn()
	
func Spawn():
	var A = Apple.instantiate()
	A.position = Vector2(1600/(32*randi_range(1, 50)), 1600/(32*randi_range(1, 50)))
	add_child(A)
