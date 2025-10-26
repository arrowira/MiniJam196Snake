extends Node2D

var TimePu = preload("res://scenes/time_pu.tscn")
@export var spawnSpeed = 1
var t = 0
	
func Spawn():
	var A = TimePu.instantiate()
	A.position = Vector2((32*randi_range(1, 50))%1600,(32*randi_range(1, 50))%1600)
	add_child(A)
