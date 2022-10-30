extends Node

var direction = Vector2(1, 0)

func _ready():
	pass

func sprite_flash(sprite) -> void:
	var tween = create_tween()
	tween.tween_property(sprite, "modulate", Color.white, 0.25)
