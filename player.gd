extends CharacterBody2D
const GRAVITY = 10
var start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if start == true:
		if velocity.y < 200:
			velocity.y += GRAVITY
	
		if Input.is_action_just_pressed("flap"):
			velocity.y = -300

	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _start():
	start = true

func _finish():
	start = false
