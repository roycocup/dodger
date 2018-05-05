extends Area2D

signal hit


func _on_Area2D_body_entered(body):
	emit_signal("hit")
	$CollisionShape2D.disabled = true
