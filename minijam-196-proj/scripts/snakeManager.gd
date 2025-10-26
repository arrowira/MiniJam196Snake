extends Node2D
var segments = 3
var snakeSegments = []
@export var player1segment := preload("res://scenes/player_1_segment.tscn")
func _ready() -> void:
	snakeSegments.append($head.position)
	for i in range(segments):
		var newSegment := player1segment.instantiate()
		var newSegmentPos := Vector2(0,-i*32-32)
		newSegment.position = newSegmentPos
		$segmentContainer.add_child(newSegment)
		snakeSegments.append(newSegmentPos)

var adding = false


func updateSnake(headPosition: Vector2):
	if adding:
		adding=false
		var newSegment := player1segment.instantiate()
		
		newSegment.position = snakeSegments[0]
		$segmentContainer.add_child(newSegment)
		snakeSegments.append(snakeSegments[0])
	
	var newSnakeSegments = snakeSegments.duplicate(true)
	for i in range(len(snakeSegments)-1):
		newSnakeSegments[i+1]=snakeSegments[i]
	
	newSnakeSegments[0] = headPosition
	for i in range(len($segmentContainer.get_children())):
		$segmentContainer.get_children()[i].position = newSnakeSegments[i+1]
	
	snakeSegments = newSnakeSegments.duplicate(true)
func addSegment():
	adding = true
#Head Collider
func Collided(area: Area2D) -> void:
	print(area.name)
	if(area.name == "AppleCollider"):
		addSegment()
		area.get_parent().queue_free()
	if(area.name == "SnakeHead") or (area.name == "SnakeBody"):
		get_tree().current_scene.get_node("Hud/Win").visible = true
		var txt = get_node("/root/main/Hud/Win")
		txt.bbcode_enabled = true
		txt.text = "[color=red]Red[/color]"
		get_tree().current_scene.get_node("Hud/Winner").visible = true
		$head.running = false
	
func Snake2Head(area: Area2D) -> void:
	if(area.name == "AppleCollider"):
		addSegment()
		
		area.get_parent().queue_free()
	if(area.name == "SnakeHead") or (area.name == "SnakeBody"):
		get_tree().current_scene.get_node("Hud/Win").visible = true
		var txt = get_node("/root/main/Hud/Win")
		txt.bbcode_enabled = true
		txt.text = "[color=blue]Blue[/color]"
		get_tree().current_scene.get_node("Hud/Winner").visible = true
		$head.running = false
