extends Area2D

@onready var shoot_point = $weapon_pivot/Sprite2D/shoot_point
@onready var gun_sound = $gun_sound


var shooting = false
var shoot_timer = 0.5
var shoot_delay = 0.5

func _process(delta):
	look_at(get_global_mouse_position())
	if shooting:
		shoot_timer -= delta
		if shoot_timer <= 0:
			shoot()
			shoot_timer = shoot_delay
	
	if Input.is_action_pressed("shoot") and shoot_timer == shoot_delay:
		shooting = true
	else:
		shooting = false

func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	gun_sound.play()
	new_bullet.global_position = shoot_point.global_position
	new_bullet.global_rotation = shoot_point.global_rotation
	shoot_point.add_child(new_bullet)
