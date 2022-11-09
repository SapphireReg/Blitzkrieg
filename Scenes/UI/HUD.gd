extends CanvasLayer

func _ready():
	pass
	
func _process(delta):
	load_coins()

func load_coins():
	if Global.coins == 0:
		$CoinSlot.visible = false
	else:
		$CoinSlot.visible = true
		$CoinSlot.rect_size.y = Global.coins * 13
		
