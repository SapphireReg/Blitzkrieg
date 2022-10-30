extends KinematicBody2D

var speed = 50
var motion = Vector2.ZERO

var hp_max: int = 100
var hp: int = hp_max

var player = null 
var playerIn = false
onready var Sprite = $AnimatedSprite

func _physics_process(_delta):
	motion.x = 0
	motion.y = 0
	ai()
	

func ai():
	if playerIn: 
		if compare_x() >= compare_y():
			if compare_x() < 0: #right
				Sprite.play("WalkRight")
			elif compare_x() > 0: #left
				Sprite.play("WalkLeft")
		elif compare_x() <= compare_y():
			if compare_y() > 0: #up
				Sprite.play("WalkUp")
			elif compare_y() < 0: #down
				Sprite.play("WalkDown")
		else:
			Sprite.stop()
			motion.x = 0
			motion.y = 0
		motion = position.direction_to(player.position) * speed
		motion = motion.normalized()
		motion = move_and_slide(motion * speed)

func compare_x():
	var x = global_position.x - player.global_position.x
	return x
	
func compare_y():
	var y = global_position.y - player.global_position.y
	return y
	
func die():
	Sprite.play("Death")
	yield(Sprite, "animation finished")
	queue_free()
	
#Player Detection
func _on_PlayerDetection_body_entered(body):
	if body.get_collision_layer_bit(0):
		print("player entered")
		player = body
		playerIn = true

#Damage
func _on_DamageDetection_body_entered(body):
	if body.get_collision_layer_bit(4):
		playerIn = true
		Global.sprite_flash($AnimatedSprite)
		print("damage")
		hp -= 50
		if hp == 0:
			die()
