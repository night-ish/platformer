extends Area2D
@onready var endtext = $Snow4

func _ready() -> void:
	endtext.visible=false

func _on_body_entered(body: Namer) -> void:
	$EndT.start()
	
func _on_end_t_timeout() -> void:
	endtext.visible=true
