extends Node

var zombie_scene = preload("res://zombies/zombie.tscn")

var spawn_x: float = 1000.0
var lane_positions = [64.0, 192.0, 320.0, 448.0, 576.0]


func _on_spawn_timer_timeout():
	print("SPAWN TIMER WORKS")
	spawn_zombie()


func spawn_zombie():
	var zombie = zombie_scene.instantiate()

	var random_lane = randi_range(0, lane_positions.size() - 1)

	zombie.position = Vector2(spawn_x, lane_positions[random_lane])

	get_parent().add_child(zombie)
