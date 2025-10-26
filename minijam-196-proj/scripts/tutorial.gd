extends Node2D
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("p1down") or Input.is_action_just_pressed("p1up") or Input.is_action_just_pressed("p1left") or Input.is_action_just_pressed("p1right"):
		$pt1.visible = false
		$pt1Timer.start()
	


func _on_pt_1_timer_timeout() -> void:
	pass # Replace with function body.
