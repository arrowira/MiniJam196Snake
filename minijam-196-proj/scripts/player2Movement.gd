extends Node2D
@export var speed = 20
var timeSinceLastMove = 0

var direction := Vector2(1,0)
var turn = 0
var turnLimit = 10
var stepTime = 3
var running = false
func _ready() -> void:
	position = Vector2(0,0)
func _physics_process(delta: float) -> void:
	#inputs
	if Input.is_action_just_pressed("p2down") and direction!=Vector2(0,-1):
		direction = Vector2(0,1)
	if Input.is_action_just_pressed("p2up") and direction!=Vector2(0,1):
		direction = Vector2(0,-1)
	if Input.is_action_just_pressed("p2right") and direction!=Vector2(-1,0):
		direction = Vector2(1,0)
	if Input.is_action_just_pressed("p2left") and direction!=Vector2(1,0):
		direction = Vector2(-1,0)

	
	
	timeSinceLastMove += delta*speed
	if timeSinceLastMove > stepTime and running:
		turn+=1
		position = position + direction*32
		timeSinceLastMove = 0
		get_parent().updateSnake(position)
	if turn>turnLimit:
		turn = 0
		running = false
		get_parent().get_parent().get_node("snakeA").get_node("head").running=true
