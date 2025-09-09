extends CanvasLayer

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var game_manager = $"../game_manager"

var start_game = 1
# 1=false
# 2=true
# 3=dead

func _on_start_game_button_pressed():
	start_game = 2
	audio_stream_player_2d.stop()

func _on_controls_button_pressed():
	pass 

func _on_exit_game_button_pressed():
	get_tree().quit()
