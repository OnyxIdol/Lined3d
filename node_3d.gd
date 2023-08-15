extends Node3D

@onready var line3d=$Line3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Left"):
		line3d.position+=Vector3(1,0,0)*delta*5
	if Input.is_action_pressed("Right"):
		line3d.position+=Vector3(-1,0,0)*delta*5
	if Input.is_action_pressed("Down"):
		line3d.position+=Vector3(0,-1,0)*delta*5
		
	if Input.is_action_pressed("Up"):
		line3d.position+=Vector3(0,1,0)*delta*5
	
	if Input.is_action_pressed("rotateLeft"):
		line3d.rotate_y(deg_to_rad(60*delta))
	if Input.is_action_pressed("rotateRight"):
		line3d.rotate_y(deg_to_rad(-60*delta))
	
	pass
