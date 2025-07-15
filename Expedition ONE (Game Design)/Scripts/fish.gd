extends CharacterBody2D
@onready var sprite_2d = $AnimatedSprite2D

var chase_speed = 150 
var player : PlayerEntity

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	handle_movement(delta)
	move_and_slide()

func handle_movement(delta):
	var chase_direction = global_position.direction_to(player.global_position)
	if velocity.x > 0:
		sprite_2d.flip_h = false
	if velocity.x < 0:
		sprite_2d.flip_h = true
	velocity = chase_direction * chase_speed
