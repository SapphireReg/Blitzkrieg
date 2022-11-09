extends KinematicBody2D

export var speed = 50
export var hp: int = 100

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
		if abs(compare_x()) <= abs(compare_y()):
			if compare_y() < 0: #up
				sprite.play("WalkUp")
			elif compare_y() > 0: #down
				sprite.play("WalkDown")
		elif abs(compare_x()) >= abs(compare_y()):
			if compare_x() > 0: #right
				sprite.play("WalkRight")
			elif compare_x() < 0: #left
				sprite.play("WalkLeft")
		else:
			sprite.stop()
			motion.x = 0
			motion.y = 0
		motion = position.direction_to(player.position) * speed
		motion = motion.normalized()
		motion = move_and_slide(motion * speed)

func compare_x():
	var x = player.global_position.x - global_position.x
	return x
	
func compare_y():
	var y = player.global_position.y - global_position.y
	return y
	
func die():
	$deathSFX.play()
	sprite.play("Death")
	set_physics_process(false)
	yield(get_tree().create_timer(1.8), "timeout")
	set_physics_process(true)
	queue_free()
	
#Player Detection
func _on_PlayerDetection_body_entered(body):
	if body.get_collision_layer_bit(0):
		$aggroSFX.play()
		print("player entered")
		player = body
		playerIn = true

#Damage
func _on_DamageDetection_body_entered(body):
	if body.get_collision_layer_bit(4):
		body.queue_free()
		hp -= Global.bulletDmg
		if hp <= 0:
			$AnimatedSprite/DamageDetection/CollisionShape2D.set_deferred("disabled", true)
			die()
		else:
			blink()

func blink():
	$hurtSFX.play()
	blink.play("Start")
	yield(get_tree().create_timer(0.2), "timeout")
	blink.play("Stop")
