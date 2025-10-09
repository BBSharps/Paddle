# GdUnit generated TestSuite
class_name PlayScriptTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source: String = 'res://scripts/play/play_script.gd'
const __scene = "res://scenes/play/play.tscn"

func test_on_bottom_area_body_entered_respawn() -> void:
	var test_run = scene_runner(__scene)
	var ball = test_run.invoke("find_child","Ball")
	var paddle = test_run.invoke("find_child","Paddle")
	paddle.position.x = 0
	ball.position = Vector2(180,681)
	await await_millis(5100)
	assert_float(ball.position.y).is_greater(450)	
