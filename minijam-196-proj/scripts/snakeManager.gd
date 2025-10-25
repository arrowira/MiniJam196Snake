extends Node2D
var segments = 3
var snakeSegments = []
var player1segment := preload("res://scenes/player_1_segment.tscn")
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
