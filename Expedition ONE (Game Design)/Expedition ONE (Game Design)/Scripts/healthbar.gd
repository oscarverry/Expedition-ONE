extends ProgressBar

@onready var damagebar = $damagebar
@onready var timer = $Timer

var health = 0 : set = _set_health 
var target_health : float = 100
var damagebar_speed = 25

func _physics_process(delta):
	if damagebar.value > target_health:
		damagebar.value -= damagebar_speed * delta
		if damagebar.value < target_health:
			damagebar.value = target_health
 
func _set_health(new_health):
	var prev_health = health 
	health = min(max_value, new_health)
	value = health
	
	if health <= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else:
		damagebar.value + health

func init_health(_health):
	health = _health
	max_value = health
	value = health
	damagebar.max_value= health


func _on_timer_timeout():
	target_health = health
