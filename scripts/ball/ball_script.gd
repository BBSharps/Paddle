extends CharacterBody2D

var drag: float 
var minimum_velocity: Vector2 = Vector2(0.0,100.0)
	
func _ready() -> void:
	drag = ProjectSettings.get_setting("physics/2d/default_gravity")
	
func _physics_process(_delta: float)->void:					
	move_and_slide()
	
func _process(delta: float)->void:
	self.velocity.y += drag * delta
		
func _on_ball_area_2d_area_entered(area: Area2D) -> void:
	match area.name:
		"PaddleArea2D":
			var velocity: Vector2 = self.velocity
			self.velocity -= return_velocity(velocity)

func return_velocity(velocity: Vector2) -> Vector2:
	drag = 0
	var paddle_velocity: Vector2 = get_parent().get_node("Paddle").velocity
	paddle_velocity.y = 150
	var result_velocity: Vector2 = velocity * 2
	return result_velocity + paddle_velocity
		
func bounce_velocity(velocity: Vector2) -> Vector2:
	drag += 10
	return velocity * 2
	
