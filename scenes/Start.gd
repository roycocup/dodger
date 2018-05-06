extends CanvasLayer

signal start_game


func _on_Button_button_down():
	emit_signal("start_game")
	queue_free()
