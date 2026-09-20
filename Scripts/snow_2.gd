extends Area2D
@onready var snow2 = $Snow2
@onready var snow21 = $Snow21
var x = 0

func _ready(): 
	snow2.visible_ratio=0
	snow21.visible=false

func _on_body_entered(body: Namer) -> void:
	if x < 1 :
		var tween: Tween = create_tween().set_trans(Tween.TRANS_LINEAR)
		tween.tween_property(snow2,"visible_ratio", 1.0, 3)
		$Snow21T.start()
		
func _on_snow_21t_timeout() -> void:
	if x < 1 :
		snow21.visible=true
		$Snow21T.stop()
		
func _on_body_exited(body: Namer) -> void:
	$Snow2T.start()
	x += 1
	
func _on_snow_2t_timeout() -> void:
	snow2.visible=false 
	snow21.visible=false
