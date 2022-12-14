extends KinematicBody2D

var speed = 50
var hp_max: int = 100
var hp: int = hp_max

var motion = Vector2.ZERO
var player = null 
var playerIn = false

onready var sprite = $AnimatedSprite
onready var blink = $BlinkAnimation


func _physics_process(_delta):
	motion.x = 0
	motion.y = 0
	ai()
	

func ai():
	if playerIn: 
		sprite.play("Moving")
		motion = position.direction_to(player.position) * speed
		motion = motion.normalized()
		motion = move_and_slide(motion * speed)
	else:
		sprite.stop()
		motion.x = 0
		motion.y = 0
	

func compare_x():
	var x = global_position.x - player.global_position.x
	return x
	
func compare_y():
	var y = global_position.y - player.global_position.y
	return y
	
func die():
	sprite.play("Death")
	set_physics_process(false)
	yield(get_tree().create_timer(2.0), "timeout")
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
		body.queue_free()
		hp -= 50
		if hp <= 0:
			die()
		else:
			blink()

func blink():
	blink.play("Start")
	yield(get_tree().create_timer(0.2), "timeout")
	blink.play("Stop")


