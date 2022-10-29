extends KinematicBody2D

const ACCELERATION = 500 #if want to add this feature watch part 2 again
const MAX_SPEED = 80
const FRICTION = 500
var bullet_speed = 800
#export (PackedScene) var Bullet
const BULLET = preload("res://Scenes/Player/Bullet1.tscn")
var can_fire = true
#var rate_of_fire = 1
var velocity = Vector2.ZERO
var hp_max: int = 100
var hp: int = hp_max
var defence: int = 0 
#onready var end_of_gun = $EndOfGun
var direction = Vector2(0, 0)

func _ready():
	pass 
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = MAX_SPEED
		direction = Vector2(1, 0)
		$AnimatedSprite.play("WalkRight")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MAX_SPEED
		$AnimatedSprite.play("WalkLeft ")
		direction = Vector2(-1, 0)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -MAX_SPEED
		$AnimatedSprite.play("WalkUp")
		direction = Vector2(0, -1)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = MAX_SPEED
		$AnimatedSprite.play("WalkDown ")
		direction = Vector2(0, 1)
	else:
		velocity.x = 0
		velocity.y = 0
		$AnimatedSprite.stop()
	#fire()
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * MAX_SPEED)
	#look_at(get_global_mouse_position())
func _process(_delta):
	fire()
#for the bullet>>>>>>>>>>>>>>>>>
func fire():
	if Input.is_action_just_pressed("shoot"):
		
		var f = BULLET.instance()
		f.direction = direction
		get_parent().add_child(f)
		if direction.x == 0:
			f.position.x = self.position.x
			f.position.y = self.position.y + 25 * direction.x
		elif direction.y == 0:
			f.position.y = self.position.y
			f.position.x = self.position.x + 25 * direction.x
	


func _on_Hurtbox_area_entered(hitbox):
	
	#var base_damage = hitbox.damage
	#self.hp -= base_damage
	#print(hitbox.get_parent().name + "hit touched" + name + "hurtbox dealt" + str(base_damage))
	pass
