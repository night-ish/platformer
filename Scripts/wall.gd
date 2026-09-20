extends Area2D
@onready var Wall_Text = $LeftSide
@onready var Wall_Text2 = $LeftSide2
var walltime = 0

func _ready() -> void:
	Wall_Text.visible=false
	Wall_Text2.visible=false

func _on_body_entered(body: Namer) -> void:
	Wall_Text.visible=false
	if walltime < 4:
		Wall_Text.visible=true
		walltime += 1
	else:
		Wall_Text2.visible=true
	$WallT.start()

func _on_wall_t_timeout() -> void:
	Wall_Text.visible=false
	Wall_Text2.visible=false
	pass # Replace with function body.
