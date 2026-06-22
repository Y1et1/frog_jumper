extends Node2D

@onready var wintimer: Timer = $wintimer


func _on_win_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		wintimer.start()
		



func _on_deathzone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()


func _on_wintimer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/lvl_3.tscn")
