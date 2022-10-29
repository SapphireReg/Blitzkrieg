extends KinematicBody2D

var speed = 50
var motion = Vector2.ZERO

var hp_max: int = 100
var hp: int = hp_max
var defence: int = 0 

var player = null 
onready var Sprite = $AnimatedSprite
func _physics_process(delta):
	motion = Vector2.ZERO
	if player: 
		motion = position.direction_to(player.position) * speed
		#look_at(Vector2.UP)
		Sprite.flip_h = motion.x < 0
	motion = move_and_slide(motion)

func _on_Area2D_body_entered(body):
	player = body

func _on_Area2D_body_exited(body):
	player = null

func die():
	$AnimatedSprite.play("Death")
	queue_free()





func _on_Hurtbox_area_entered(area):
	die()
	
