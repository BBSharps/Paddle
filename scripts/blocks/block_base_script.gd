extends StaticBody2D

var hit_count: int = 1
const type: String = "Block"

func ball_hit(count: int) -> void:
	hit_count += count
	match hit_count:
		0: self.queue_free()
