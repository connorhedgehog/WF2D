extends CharacterBody2D

var speed = 50
var sprite_direction = "down"

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(_delta):
	if is_multiplayer_authority():
		var direction = Input.get_vector("left", "right", "up", "down")
		if Input.is_action_pressed("sprint"):
			velocity = direction * (speed * 1.5)
#			$AnimatedSprite2D.speed_scale = 1.5
		else:
			velocity = direction * speed
#			$AnimatedSprite2D.speed_scale = 1
#		if velocity.y != 0 or velocity.x != 0:
#			if velocity.y < 0:
#				sprite_direction = "up"
#			elif velocity.y > 0:
#				sprite_direction = "down"
#			if velocity.x < 0:
#				sprite_direction = "left"
#			elif velocity.x > 0:
#				sprite_direction = "right"
#
#			$AnimatedSprite2D.play("walk_" + sprite_direction)
#		else:
#			$AnimatedSprite2D.play("idle_" + sprite_direction)
			
	move_and_slide()
	
