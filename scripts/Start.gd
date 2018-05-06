extends CanvasLayer

export (PackedScene) var main

func _on_Button_button_down():
	queue_free()
	var s = ResourceLoader.load(main.resource_path)
	get_tree().get_root().add_child(s.instance())


	
