extends Area2D
@onready var Fall_Text = $FellText

func _ready() -> void:
	Fall_Text.visible=false

func _on_body_entered(body: Namer) -> void:
	Fall_Text.visible=true
	$Timer.start()
	
func _on_timer_timeout():
	Fall_Text.visible=false
