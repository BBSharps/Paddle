# GdUnit generated TestSuite
class_name BallScriptTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/ball/ball_script.gd'
const __scene = "res://scenes/play/play.tscn"

func test_play_ball_start_position_and_bounce() -> void:
	var test_run = scene_runner(__scene)
	var ball = test_run.invoke("find_child","Ball")
	assert_vector(ball.position).is_equal(Vector2(180.0,500.0))
	await await_millis(500)	
	assert_float(ball.velocity.y).is_greater(0.0)
	await await_millis(500)
	assert_float(ball.velocity.y).is_less(0.0)
	await await_millis(500)
