extends KinematicBody2D

const SPEED = 400
var velocity = Vector2()
var direction = Vector2(0,0)


func _ready():
	velocity = SPEED * direction
	
func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
