extends Node2D
var segments = 3
var snakeSegments = []
@export var player1segment := preload("res://scenes/player_1_segment.tscn")
func _ready() -> void:
	for i in range(segments):
		var newSegment := player1segment.instantiate()
		var newSegmentPos := Vector2(-i*32,0)
		newSegment.position = newSegmentPos
		$segmentContainer.add_child(newSegment)
		snakeSegments.append(newSegmentPos)




func updateSnake(headPosition: Vector2):
	var newSnakeSegments = snakeSegments.duplicate(true)
	for i in range(len(snakeSegments)-1):
		newSnakeSegments[i+1]=snakeSegments[i]
	
	newSnakeSegments[0] = headPosition
	for i in range(len($segmentContainer.get_children())):
		$segmentContainer.get_children()[i].position = newSnakeSegments[i]
	
	snakeSegments = newSnakeSegments.duplicate(true)

#Head Collider
func Collided(area: Area2D) -> void:
	if(area.name == "AppleCollider"):
		#increment length
		area.get_parent().queue_free()
	if(area.name == "SnakeHead"):
		area.queue_free()
		queue_free()
	if(area.name == "SnakeBody"):
		queue_free()
