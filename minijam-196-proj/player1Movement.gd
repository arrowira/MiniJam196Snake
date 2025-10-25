extends Node2D
@export var speed = 20
var timeSinceLastMove = 0

var direction := Vector2(1,0)

var stepTime = 3
func _ready() -> void:
	position = Vector2(0,0)
func _physics_process(delta: float) -> void:
	#inputs
	if Input.is_action_just_pressed("p1down") and direction!=Vector2(0,-1):
		direction = Vector2(0,1)
	if Input.is_action_just_pressed("p1up") and direction!=Vector2(0,1):
		direction = Vector2(0,-1)
	if Input.is_action_just_pressed("p1right") and direction!=Vector2(-1,0):
		direction = Vector2(1,0)
	if Input.is_action_just_pressed("p1left") and direction!=Vector2(1,0):
		direction = Vector2(-1,0)

	
	
	timeSinceLastMove += delta*speed
	if timeSinceLastMove > stepTime:
		position = position + direction*32
		timeSinceLastMove = 0
		get_parent().updateSnake(position)
