extends CharacterBody2D

var speed:float = 150
var direction: Vector2 = Vector2.DOWN
var ball_spawn: Vector2 = Vector2(180.0,500.0)
	
func _physics_process(delta: float)->void:					
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		var return_velocity: Vector2 = velocity.bounce(collision.get_normal())
		match collider.name:
			"Paddle":
				return_velocity.x += collider.velocity.x
		velocity = return_velocity
	
	match velocity.y >= -50 and velocity.y <= 50:
		true:
			velocity.y = 150


	
