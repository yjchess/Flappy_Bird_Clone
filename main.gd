extends Node
@export var pipe: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$PipeSpawner.stop()
	$Pipe._finish()
	$Pipe2._finish()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pipe_spawner_timeout():
	const PIPE_GAP = 150
	var top_pipe = pipe.instantiate()
	var bottom_pipe = pipe.instantiate()
	var offset = randi_range(200,700)
	top_pipe.get_child(0).new_pipe(-offset)
	bottom_pipe.get_child(0).new_pipe(719-offset + PIPE_GAP)
	top_pipe.connect("point", _on_pipe_point)
	top_pipe.connect("death", _on_player_death)
	bottom_pipe.connect("death", _on_player_death)
	add_child(top_pipe)
	add_child(bottom_pipe)
	pass # Replace with function body.



func _on_pipe_point():
	$HUD.incrementScore()
	pass # Replace with function body.

func _on_player_death():
	$PipeSpawner.stop()
	$Player.get_child(0).call("_finish")
	#get_tree().call_group("pipe","_finish")
	get_tree().call_group("pipe","queue_free")
	$HUD._finish()
	pass



func _on_hud_start_game():
	$Player.get_child(0).call("_start")
	$Player.get_child(0).position.x = 0
	$Player.get_child(0).position.y = 0
	get_tree().call_group("pipe","_start")
	$PipeSpawner.start()
	pass # Replace with function body.


func _on_destruction_body_entered(body):
	body.get_parent().remove_from_group("pipe")
	body.get_parent().queue_free()
	pass # Replace with function body.
