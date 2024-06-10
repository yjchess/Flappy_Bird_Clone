extends Node
signal point
signal death

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pipe_point():
	emit_signal("point")
	pass # Replace with function body.

func _on_death(body):
	if body.name == "Player":
		emit_signal("death")

func _finish():
	self.get_child(0)._finish()

func _start():
	self.get_child(0)._start()
