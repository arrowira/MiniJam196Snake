extends Node2D
var segments = 5
var snakeSegments = []
var snakeSegmentObjects
var player1segment := preload("res://player_1_segment.tscn")
func _ready() -> void:
	for i in range(segments):
		var newSegment := player1segment.instantiate()
		newSegment.position = Vector2(0, 0)
		$segmentContainer.add_child(newSegment)
		snakeSegments.append(Vector2(0,0))



func updateSnake(headPosition: Vector2):
	for i in range(len(snakeSegments)-1):
		snakeSegments[i+1]=snakeSegments[i]
	snakeSegments[0] = headPosition
	for i in range(len($segmentContainer.get_children())):
		$segmentContainer.get_children()[i].position = snakeSegments[i]
