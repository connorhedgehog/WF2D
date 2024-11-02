extends CharacterBody2D

@onready var camera: Camera2D = $Camera
@onready var test_gui: Control = $TestGui

var speed = 50
var sprite_direction = "down"
var frozen = false

func _enter_tree():
	set_multiplayer_authority(name.to_int())
	
func _ready() -> void:
	if is_multiplayer_authority():
		$Camera.make_current()

func _physics_process(_delta):	
	if is_multiplayer_authority():
		# movement
		if not frozen:
			var direction = Input.get_vector("left", "right", "up", "down")
			if Input.is_action_pressed("sprint"):
				velocity = direction * (speed * 1.5)
				$AnimatedSprite2D.speed_scale = 1.5
			else:
				velocity = direction * speed
				$AnimatedSprite2D.speed_scale = 1
			if velocity.y != 0 or velocity.x != 0:
				if velocity.y < 0:
					sprite_direction = "up"
				elif velocity.y > 0:
					sprite_direction = "down"
				if velocity.x < 0:
					sprite_direction = "left"
				elif velocity.x > 0:
					sprite_direction = "right"
				
		# animation
				$AnimatedSprite2D.play("walk_" + sprite_direction)
			else:
				$AnimatedSprite2D.play("idle_" + sprite_direction)
			
		move_and_slide()
		
		# user interface
		if Input.is_action_just_pressed("e"):
			test_gui.visible = not test_gui.visible
			frozen = test_gui.visible
	
