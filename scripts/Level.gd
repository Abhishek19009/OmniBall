extends Spatial

func _ready():
	print(ProjectSettings.get_setting("rendering/quality/driver/driver_name"))
	ProjectSettings.set_setting("rendering/quality/driver/driver_name", "GLES2")
	print(ProjectSettings.get_setting("rendering/quality/driver/driver_name"))
	
