extends CanvasLayer
signal startGame

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func incrementScore():
	var current_score = int($Score.text)
	$Score.text = str(current_score + 1)

func _start():
	emit_signal("startGame")
	$Score.text = "0"
	$Button.disabled = true
	$Button.hide()
	$Message.hide()

func _finish():
	$Button.disabled = false
	$Button.show()
	$Message.show()

