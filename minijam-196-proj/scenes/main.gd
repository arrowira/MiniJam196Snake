extends Node2D
var whosTurn = 2 #Who's Rem

func _physics_process(delta: float) -> void:
	var txt = get_node("/root/main/Hud/RemOrRam")
	txt.bbcode_enabled = true
	if(whosTurn == 2):
		txt.text = "[color=red]Red[/color]"
	else:
		txt.text = "[color=blue]Blue[/color]"
		
	var TimeLeft1 = get_node("/root/main/Hud/Rem/Blue")
	var TimeLeft2 = get_node("/root/main/Hud/Ram/Red")
	var WhosRam = get_tree().current_scene.get_node("snakeA/head")
	var WhosRem = get_tree().current_scene.get_node("snakeB/head")
	TimeLeft1.bbcode_enabled = true
	TimeLeft2.bbcode_enabled = true
	if(whosTurn == 2):
		TimeLeft2.text = "[color=red]" + str(WhosRam.turnLimit - WhosRam.turn) + "[/color]"
		TimeLeft1.text = "[color=blue]0[/color]"
	else:
		TimeLeft1.text = "[color=blue]" + str(WhosRem.turnLimit - WhosRem.turn) + "[/color]"
		TimeLeft2.text = "[color=red]0[/color]"
