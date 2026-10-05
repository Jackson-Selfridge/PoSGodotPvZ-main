extends Area2D

signal game_over


func _on_body_entered(body: Node2D):
	if body.is_in_group("zombies"):
		print("GAME OVER! A zombie reached the house.")
		game_over.emit()
