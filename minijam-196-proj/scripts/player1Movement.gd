extends Node2D
@export var speed = 20
var timeSinceLastMove = 0

var direction := Vector2(0,1)
var turn = 0
var turnLimit = 10
var stepTime = 3
var running = true
var prevDir = Vector2(0,-1)


var turnStarted = false

func _ready() -> void:
	position = Vector2(0,0)
func _physics_process(delta: float) -> void:
	#inputs
	if running:
		var prevPos = get_parent().getSnakeSegPos(2)
		var currPos = get_parent().getSnakeSegPos(1)
		var prevDir = Vector2(-(currPos.x-prevPos.x)/32,-(currPos.y-prevPos.y)/32)
		if Input.is_action_just_pressed("p1down") and direction != Vector2(0, -1) and running and prevDir!=Vector2(0,1):
			direction = Vector2(0, 1)
			$headTexture.rotation = deg_to_rad(180)
			turnStarted = true

		if Input.is_action_just_pressed("p1up") and direction != Vector2(0, 1) and running and prevDir!=Vector2(0,-1):
			direction = Vector2(0, -1)
			$headTexture.rotation = 0
			turnStarted = true

		if Input.is_action_just_pressed("p1right") and direction != Vector2(-1, 0) and running and prevDir!=Vector2(1,0):
			direction = Vector2(1, 0)
			$headTexture.rotation = deg_to_rad(90)
			turnStarted = true

		if Input.is_action_just_pressed("p1left") and direction != Vector2(1, 0) and running and prevDir!=Vector2(-1,0):
			direction = Vector2(-1, 0)
			$headTexture.rotation = deg_to_rad(270)
			turnStarted = true
		
	


	
	
	timeSinceLastMove += delta*speed
	if timeSinceLastMove > stepTime and running and turnStarted:
		turn+=1
		position = position + direction*32
		timeSinceLastMove = 0
		get_parent().updateSnake(position)
	if turn>turnLimit:
		turn = 0
		running = false
		turnStarted=false
		get_parent().get_parent().get_node("snakeB").get_node("head").running=true
		get_parent().get_parent().whosTurn = 1
		get_tree().current_scene.get_node("AppleSpawner").Spawn()
		get_tree().current_scene.get_node("TimeSpawner").Spawn()
		get_tree().current_scene.get_node("AppleSpawner").Spawn()
		get_tree().current_scene.get_node("AppleSpawner").Spawn()
		
