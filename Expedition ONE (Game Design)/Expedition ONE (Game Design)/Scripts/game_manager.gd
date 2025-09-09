extends Node
@onready var main_menu = $"../main_menu"
@onready var value_label = %value_label
@onready var game_over_screen = $"../Game_over_screen"

var paused = true
var value = 0 

func add_big_value():
	value += 20
	value_label.text = "VALUE: " + str(value)

func add_dart_value():
	value += 5
	value_label.text = "VALUE: " + str(value)

func add_value():
	value += 10
	value_label.text = "VALUE: " + str(value)

func _physics_process(delta):
	
	if main_menu.start_game == 1: #false
		game_over_screen.visible = false
		main_menu.visible = true
		paused = true
		
	if main_menu.start_game == 2: #true
		game_over_screen.visible = false
		main_menu.visible = false
		paused = false
	
	if main_menu.start_game == 3: #dead
		game_over_screen.visible = true
		main_menu.visible = false
		paused = true
	
	if paused == true:
		get_tree().paused = true
	if paused == false:
		get_tree().paused = false


func _on_player_health_depleted():
	main_menu.start_game = 3
