extends CharacterBody2D
signal point
signal death

var start = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if start == true:
		velocity.x = -30
		velocity.y = 0
		move_and_slide()
	else:
		velocity.x = 0
		velocity.y = 0

func _physics_process(delta):
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider():
			if collision.get_collider().name=="Player":
				emit_signal("death")
		

func new_pipe(starting_pos):
	position.y += starting_pos


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name =="Player":
		emit_signal("point")

func _start():
	start = true

func _finish():
	start = false
