extends Node

var seconds: int = 0

func _on_bottom_area_body_entered(body: Node2D) -> void:
	match body.name:
		"Ball":
			body.velocity = Vector2(0.0,0.0)
			await get_tree().create_timer(5.0).timeout
			respawn_ball(body)

func respawn_ball(body: CharacterBody2D):
	body.position = body.ball_spawn
	
