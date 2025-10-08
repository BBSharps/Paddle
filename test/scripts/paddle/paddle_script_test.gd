# GdUnit generated TestSuite
class_name PaddleScriptTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __script = 'res://scripts/paddle/paddle_script.gd'
const __scene = "res://scenes/play/play.tscn"


func test_play_paddle_movement_neutral() -> void:
	var test_run = scene_runner(__scene)
	await await_millis(1000)	
	var paddle = test_run.invoke("find_child","Paddle")
	assert_float(paddle.velocity.x).is_equal(0.0)
	await await_millis(500)

func test_play_paddle_movement_left() -> void:
	var test_run = scene_runner(__scene)
	await await_millis(1000)	
	var paddle = test_run.invoke("find_child","Paddle")
	test_run.simulate_action_press("ui_left")
	await test_run.await_input_processed()
	assert_float(paddle.velocity.x).is_equal(-200.0)
	await await_millis(500)

func test_play_paddle_movement_right() -> void:
	var test_run = scene_runner(__scene)
	await await_millis(1000)	
	var paddle = test_run.invoke("find_child","Paddle")
	test_run.simulate_action_press("ui_right")
	await test_run.await_input_processed()
	assert_float(paddle.velocity.x).is_equal(200.0)	
	await await_millis(500)
	
func test_play_paddle_movement_held() -> void:
	var test_run = scene_runner(__scene)
	await await_millis(1000)	
	var paddle = test_run.invoke("find_child","Paddle")
	test_run.simulate_action_press("ui_right")
	await test_run.await_input_processed()		
	test_run.simulate_action_press("ui_left")
	await test_run.await_input_processed()
	assert_float(paddle.velocity.x).is_equal(0.0)
	await await_millis(500)
