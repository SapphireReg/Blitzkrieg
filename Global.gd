extends Node

var direction = Vector2(1, 0)
const BULLET = preload("res://Scenes/Player/Bullet1.tscn")

func _ready():
	pass

func sprite_flash(sprite) -> void:
	var tween = create_tween()
	tween.tween_property(sprite, "self_modulate", Color.white, 0.25)