extends Node

var direction = Vector2(1, 0)
onready var BULLET = preload("res://Scenes/Player/Bullet1.tscn")
var coins = 0
var bullet_level = 1
var HP_MAX = 100
var playerHp = HP_MAX
var bulletDmg = 50

func _ready():
	pass

