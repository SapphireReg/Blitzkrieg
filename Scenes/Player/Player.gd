extends KinematicBody2D

const MAX_SPEED = 80
var velocity = Vector2.ZERO
var HP_MAX = 100
var hp = HP_MAX

func _ready():
	pass 
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = MAX_SPEED
		Global.direction = Vector2(1, 0)
		$AnimatedSprite.play("WalkRight")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MAX_SPEED
		$AnimatedSprite.play("WalkLeft ")
		Global.direction = Vector2(-1, 0)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -MAX_SPEED
		$AnimatedSprite.play("WalkUp")
		Global.direction = Vector2(0, -1)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = MAX_SPEED
		$AnimatedSprite.play("WalkDown ")
		Global.direction = Vector2(0, 1)
	else:
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.stop()
		velocity.x = 0
		velocity.y = 0
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * MAX_SPEED)
func _process(_delta):
	fire()
	
#for the bullet>>>>>>>>>>>>>>>>>
func fire():
	if Input.is_action_just_pressed("shoot"):
		if Global.direction == Vector2(1, 0): #right
			$AnimatedSprite.play("FireRight")
		elif Global.direction == Vector2(-1, 0): #left
			$AnimatedSprite.play("FireLeft")
		elif Global.direction == Vector2(0, -1): #up
			$AnimatedSprite.play("FireUp")
		elif Global.direction == Vector2(0, 1): #down
			$AnimatedSprite.play("FireDown")
			
		var bullet = Global.BULLET.instance()
		get_parent().add_child(bullet)
		#bullet fire direction
		if Global.direction.x == 0:
			bullet.position.x = self.position.x
			bullet.position.y = self.position.y + 25 * Global.direction.y
		elif Global.direction.y == 0:
			bullet.position.y = self.position.y
			bullet.position.x = self.position.x + 25 * Global.direction.x
	
	
#func _on_Hurtbox_area_entered(hitbox):
	
	#var base_damage = hitbox.damage
	#self.hp -= base_damage
	#print(hitbox.get_parent().name + "hit touched" + name + "hurtbox dealt" + str(base_damage))
	#pass
