extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 20
const SPEED_INCREMENT = 10
var ROTATION = SPEED
var ROTATION_INCREMENT = SPEED_INCREMENT
var newnode
var mouse_sensitivity = 0.1
var scenename

func _ready():
	pass
	
func key(x):
	return Input.is_action_pressed(x)
	
	
func _physics_process(delta):
	
	if key('ui_right') and key('ui_left'):
		velocity.x = 0
	elif key('ui_fast') and key('ui_right'):
		velocity.x = SPEED + SPEED_INCREMENT
		$MeshInstance.rotate_z(deg2rad(-velocity.x))
	elif key('ui_fast') and key('ui_left'):
		velocity.x = -SPEED - SPEED_INCREMENT
		$MeshInstance.rotate_z(deg2rad(-velocity.x))
	elif key('ui_right'):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-velocity.x))
	elif key('ui_left'):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(-velocity.x))
	else:
		velocity.x = lerp(velocity.x,0,0.1)
		$MeshInstance.rotate_z(deg2rad(-velocity.x))
		
	if key('ui_up') and key('ui_down'):
		velocity.z = 0
	elif key('ui_fast') and key('ui_down'):
		velocity.z = SPEED + SPEED_INCREMENT
		$MeshInstance.rotate_x(deg2rad(velocity.z))
	elif key('ui_fast') and key('ui_up'):
		velocity.z = -SPEED - SPEED_INCREMENT
		$MeshInstance.rotate_x(deg2rad(velocity.z))
	elif key('ui_up'):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(velocity.z))
	elif key('ui_down'):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(velocity.z))
	else:
		velocity.z = lerp(velocity.z,0,0.1)
		$MeshInstance.rotate_x(deg2rad(velocity.z))
		
	move_and_slide(velocity)
	
func _input(event):
	if event is InputEventMouseMotion:
		$CameraParentTarget.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		$CameraParentTarget/CameraTarget.rotation.x = clamp($CameraParentTarget/CameraTarget.rotation.x , deg2rad(-90), deg2rad(90))

	


	
