extends RigidBody2D
signal point

var start = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	if start == true:
		linear_velocity.x = -30
		linear_velocity.y = 0
	else:
		linear_velocity.x = 0
		linear_velocity.y = 0

func new_pipe(starting_pos):
	position.y += starting_pos


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name =="Player":
		emit_signal("point")

func _start():
	start = true

func _finish():
	start = false
