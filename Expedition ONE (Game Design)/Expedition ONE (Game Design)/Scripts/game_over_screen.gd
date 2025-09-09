extends CanvasLayer
@onready var main_menu = $"../main_menu"

func _on_main_menu_button_pressed():
	main_menu.start_game == 1
	get_tree().reload_current_scene.call_deferred()

func _on_exit_game_button_pressed():
	get_tree().quit()
