extends KinematicBody

var space_state
var target
var result
var direction 
var enemy_velocity
var direction_normal 
export var enemy_speed = 850
export var normal_enemy_speed = 100
export var bouncebackspeed = 15
var ray2
var raydir1
var raydir2
var randomdict
var movement_direction 
var rotate_axis




func _ready():
	space_state = get_world().direct_space_state
	ray2 = get_node("traversing_ray")
	raydir1 = get_node("directional_ray1")
	raydir2 = get_node("directional_ray2")
	randomdict = {0:90, 1:180, 2:270}
	set_process(true)
	
func _process(delta):
	movement_direction = ($traversing_ray/Spatial.global_transform.origin - global_transform.origin)
	move_and_slide(movement_direction*normal_enemy_speed*delta)		
	rotate_axis = ($directional_ray2/Spatial.global_transform.origin - global_transform.origin).normalized()
	if movement_direction.z < 0:
		$enemymesh.rotate(-rotate_axis, deg2rad(normal_enemy_speed*delta))
	elif movement_direction.z > 0:
		$enemymesh.rotate(rotate_axis, deg2rad(normal_enemy_speed*delta))
	elif movement_direction.z == 0:
		$enemymesh.rotate(rotate_axis, deg2rad(normal_enemy_speed*delta))

func _physics_process(delta):
	if target:
		result = space_state.intersect_ray(global_transform.origin , target.global_transform.origin)
		if result.collider.name == "heroball":
			move_to_target(delta)
		
		
			
func _on_Area_body_entered(body):
	if body.name == "heroball":
		target = body

func _on_Area_body_exited(body, delta):
	if body.name == "heroball":
		target = null
		
func move_to_target(delta):
	direction = (target.transform.origin - transform.origin).normalized()
	enemy_velocity = direction*enemy_speed*delta 
	move_and_slide(enemy_velocity)
	direction_normal = Vector3(1, direction.y, -direction.x/direction.z).normalized()
	if direction.z < 0:
		$enemymesh.rotate(-direction_normal, deg2rad(enemy_speed*delta))
	elif direction.z > 0:
		$enemymesh.rotate(direction_normal, deg2rad(enemy_speed*delta))
	
func _on_wall_enemy_area_body_entered(body):
	if body.name == "sampleblock" or body.name == "GridMap":
		move_and_slide(-($traversing_ray/Spatial.global_transform.origin - global_transform.origin)*bouncebackspeed)
		rotate(Vector3(0,1,0), deg2rad(randomdict[int(100*randf())%3]))
		
func _on_game_over_detection_body_entered(body):
	if body.name == "heroball":
		get_tree().change_scene("res://assets/gameoverscene.tscn")
