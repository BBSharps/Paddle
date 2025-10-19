# GdUnit generated TestSuite
class_name BlockBaseScriptTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/blocks/block_base_script.gd'
const __scene = "res://scenes/play/play.tscn"

func test_block_has_hit_count() -> void:
	var block_test = auto_free(preload(__source).new())
	assert_int(block_test.hit_count).is_greater(0)

func test_block_has_hit_ball_func() -> void:
	var block_test = auto_free(preload(__source).new())
	assert_object(block_test).has_method("ball_hit")

func test_hit_ball_reduce_hit_count() -> void:
	var block_test = auto_free(preload(__source).new())
	block_test.hit_count = 2
	block_test.ball_hit(-1)
	assert_int(block_test.hit_count).is_equal(1)

func test_block_dissapears_after_hit() -> void:
	var test_run = scene_runner(__scene)
	var block_script = load(__source)
	var block = load("res://scenes/import scenes/block.tscn").instantiate()
	block.name = "Block"
	var ball_test = test_run.invoke("find_child","Ball")
	var root = ball_test.get_parent()
	root.add_child(block)
	var block_test = root.get_node("Block")
	block_test.position = Vector2(180.0,600.0)
	block_test.set_script(block_script)
	assert_bool(root.has_node("Block")).is_true()
	await await_millis(600)
	assert_bool(root.has_node("Block")).is_false()
	await await_millis(200)
