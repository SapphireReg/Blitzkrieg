extends KinematicBody2D

const SPEED = 400
var velocity = Vector2()


func _ready():
	velocity = SPEED * Global.direction
	
			#bullet rotate
	if Global.direction == Vector2(1, 0): #right
		$AnimatedSprite.play("FireRight")
	elif Global.direction == Vector2(-1, 0): #left
		$AnimatedSprite.play("FireLeft")
	elif Global.direction == Vector2(0, -1): #up
		$AnimatedSprite.play("FireUp")
	elif Global.direction == Vector2(0, 1): #down
		$AnimatedSprite.play("FireDown")
	
func _physics_process(delta):
	
	if is_on_wall() or is_on_floor() or is_on_ceiling():
		queue_free()
	velocity = move_and_slide(velocity, Vector2.UP)
