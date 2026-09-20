extends Area2D
@onready var CP_text = $CP1
var Cptime = 0

func _ready() -> void:
	CP_text.visible=false

func _on_body_entered(body: Namer) -> void:
	if Cptime < 1 :
		CP_text.visible=true
	$CP.start()
	Cptime += 1
	
func _on_cp_timeout() -> void:
	CP_text.visible=false
	
