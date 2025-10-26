extends Node2D
var part = 1
func _process(delta: float) -> void:
	if part ==1 and (Input.is_action_just_pressed("p1down") or Input.is_action_just_pressed("p1up") or Input.is_action_just_pressed("p1left") or Input.is_action_just_pressed("p1right")):
		$pt1.visible = false
		$pt1Timer.start()
	elif part == 2 and (Input.is_action_just_pressed("p2down") or Input.is_action_just_pressed("p2up") or Input.is_action_just_pressed("p2left") or Input.is_action_just_pressed("p2right")):
		$pt2.visible = false


func _on_pt_1_timer_timeout() -> void:
	$pt2.visible = true
	part = 2
