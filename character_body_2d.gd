extends CharacterBody2D

@export var speed: float = 100.0
var player: Node2D = null

func _physics_process(delta: float) -> void:
	if player:
		# Calculate direction towards player and set velocity
		velocity = position.direction_to(player.position) * speed
	else:
		# Stop moving if no player is detected
		velocity = Vector2.ZERO
		
	move_and_slide()

# Connect these signals from an Area2D detection node
func _on_detection_area_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("John Meter"): # Ensure player is in "player" group
		player = body

func _on_detection_area_body_exited(body: CharacterBody2D) -> void:
	if body.is_in_group("John Meter"):
		player = null
