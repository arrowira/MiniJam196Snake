extends Node2D

var Apple = preload("res://scenes/Apple.tscn")
@export var spawnSpeed = 1
var t = 0
func _physics_process(delta: float) -> void:
	t+=1
	if t%spawnSpeed ==0:
		Spawn()
	
func Spawn():
	var A = Apple.instantiate()
	A.position = Vector2((32*randi_range(1, 50))%1600,(32*randi_range(1, 50))%1600)
	add_child(A)
