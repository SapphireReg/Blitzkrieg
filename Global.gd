extends Node

var direction = Vector2(1, 0)
onready var BULLET = preload("res://Scenes/Player/Bullet1.tscn")
onready var HUDBullet = get_tree().get_current_scene().get_node("HUDNode/HUD/Bullet")
var coins = 0
var bullet_level = 1

var HP_MAX = 100
var playerHp = HP_MAX
var bulletDmg = 50

func _ready():
	pass

func check_coins():
	if coins == 7:
		bullet_level += 1
		coins = 0
		if bullet_level == 2:
			bulletDmg = 75
			BULLET = preload("res://Scenes/Player/Bullet2.tscn")
			HUDBullet.play("Bullet2")
		elif bullet_level == 3:
			bulletDmg = 150
			BULLET = preload("res://Scenes/Player/Bullet3.tscn")
			HUDBullet.play("Bullet3")
