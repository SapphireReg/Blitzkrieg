extends KinematicBody2D

const MAX_SPEED = 80
var velocity = Vector2.ZERO
var HP_MAX = 100
var hp = HP_MAX

#node access
onready var hpBar = get_parent().get_node("HUDNode/HUD/Control/HPBar")
onready var tween = get_parent().get_node("HUDNode/HUD/Control/Tween")
onready var blink = $BlinkAnimation

func _ready():
	hpBar.value = 100
	
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
	
	
func hp_update(value):
	hpBar.value += value
	tween.interpolate_property(hpBar, "value", hp, hpBar.value, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	if not tween.is_active():
		tween.start()


func _on_HitBox_body_entered(body):
	print("HIT")
	if body.get_collision_layer_bit(2):
		blink()
		hp -= 10
		hp_update(-10)
		print(hp)
		

func blink():
	blink.play("Start")
	yield(get_tree().create_timer(0.2), "timeout")
	blink.play("Stop")
