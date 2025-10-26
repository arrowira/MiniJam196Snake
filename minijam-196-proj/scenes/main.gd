extends Node2D
var whosTurn = 2 #Who's Rem

func _physics_process(delta: float) -> void:
	var txt = get_node("/root/main/Hud/RemOrRam")
	txt.bbcode_enabled = true
	if(whosTurn == 2):
		txt.text = "[color=red]Red[/color]"
	else:
		txt.text = "[color=blue]Blue[/color]"
		
