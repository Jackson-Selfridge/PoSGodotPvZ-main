extends CharacterBody2D

signal died

@export var move_speed: float = 30.0
@export var max_health: float = 100.0

var current_health: float
var is_dead: bool = false


func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	current_health = max_health
	add_to_group("zombies")


func _physics_process(_delta):
	if is_dead:
		return

	velocity = Vector2.LEFT * move_speed
	move_and_slide()


func take_damage(amount: float):
	if is_dead:
		return

	current_health -= amount
	print("Zombie health: ", current_health)

	if current_health <= 0:
		die()


func die():
	if is_dead:
		return

	is_dead = true
	died.emit()
	queue_free()
