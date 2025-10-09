# GdUnit generated TestSuite
class_name BallScriptTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/ball/ball_script.gd'
const __scene = "res://scenes/play/play.tscn"

func test_ball_script_return_velocity_standard_value() -> void:
	var test_run = scene_runner(__scene)
	var ball = test_run.invoke("find_child","Ball")
	assert_vector(ball.return_velocity(Vector2(200.0,200.0))).is_equal(Vector2(400.0,550.0))
	assert_float(ball.drag).is_equal(0.0)

func test_ball_script_return_velocity_minimum_value() -> void:
	var test_run = scene_runner(__scene)
	var ball = test_run.invoke("find_child","Ball")
	assert_vector(ball.return_velocity(Vector2(0.0,0.0))).is_equal(Vector2(0.0,150.0))
	
func test_play_ball_start_position_and_bounce() -> void:
	var test_run = scene_runner(__scene)
	var ball = test_run.invoke("find_child","Ball")
	assert_float(ball.drag).is_equal(100.0)
	assert_vector(ball.position).is_equal(Vector2(180.0,500.0))
	await await_millis(1000)	
	assert_float(ball.velocity.y).is_greater(0.0)
	await await_millis(700)
	assert_float(ball.velocity.y).is_less(0.0)
	await await_millis(500)

func test_ball_script_bounce_velocity_standard_value() -> void:
	var test_script = auto_free(preload(__source).new())
	test_script.bounce_velocity(Vector2(200.0,200.0))
	assert_float(test_script.drag).is_equal(10.0)
