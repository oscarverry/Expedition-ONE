class_name PlayerEntity 
extends CharacterBody2D

@onready var sprite_2d = $AnimatedSprite2D
@onready var healthbar = $CanvasLayer/healthbar
@onready var hurtbox = $hurtbox

signal health_depleted 

const speed = 300
var health = 100
var dead = false 
var weapon_damage = 1 

func _ready():
	healthbar.init_health(health)
	health = 100

func _physics_process(delta):
	player_movement(delta)
	get_damaged(delta)
	player_shoot()

func player_movement(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("left"):
		sprite_2d.flip_h = true 
	if Input.is_action_just_pressed("right"):
		sprite_2d.flip_h = false
	
	if velocity.x > 0.0 or velocity.x < 0.0:
		sprite_2d.animation = "drive"
	else:
		sprite_2d.animation = "idle"

func player_shoot(): 
	if Input.is_action_just_pressed("shoot"):
		get_node("weapon").shoot()

func get_damaged(delta):
	if dead == false:
		healthbar.health = health
		if health > 100:
			health = 100
			
		const DAMAGE_RATE = 15
		var overlapping_enemies = hurtbox.get_overlapping_bodies()
		
		if overlapping_enemies.size() > 0:
			health -= DAMAGE_RATE * overlapping_enemies.size() * delta
		
		if health <= 0:
			health = 0
			dead = true 
			
	if dead == true:
		health_depleted.emit()

