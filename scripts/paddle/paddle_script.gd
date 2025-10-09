extends CharacterBody2D

var speed: float = 1

func _ready() -> void:
	pass
	
func _physics_process(_delta: float)->void:					
	move_and_slide()
	
	self.velocity.x = 0
	self.position.y = 625
	
	match Input.is_action_pressed("ui_left") :
		true:
			match Input.is_action_pressed("ui_right"):
				true:
					self.velocity.x = 0
				false: 
					self.velocity.x = -200
												
	match Input.is_action_pressed("ui_right"):
		true:
			match Input.is_action_pressed("ui_left"):
				true:
					self.velocity.x = 0
				false:
					self.velocity.x = 200
					
	
