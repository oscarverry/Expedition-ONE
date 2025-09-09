extends CharacterBody2D
@onready var sprite_2d = $AnimatedSprite2D
@onready var game_manager = %game_manager

var chase_speed = 100 
var player : PlayerEntity
var hit_animation_play = false

var health = 10

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	handle_movement(delta)
	move_and_slide()
	animation()

func handle_movement(delta):
	var chase_direction = global_position.direction_to(player.global_position)
	if velocity.x > 0:
		sprite_2d.flip_h = false
	if velocity.x < 0:
		sprite_2d.flip_h = true
	velocity = chase_direction * chase_speed

func animation():
	if hit_animation_play:
		sprite_2d.animation = "damaged"
	else: 
		sprite_2d.animation = "swim"

func _on_hit_animation_timer_timeout():
	hit_animation_play = false
	
	
func take_damage():
	health -= player.weapon_damage
	hit_animation_play = true 
	
	if health <= 0:
		queue_free()
		game_manager.add_big_value()
