extends Node2D


var green_val
var is_left_pressed = false
var is_right_pressed = false


func _draw():
    draw_rect(Rect2(50, 50, 100, 100), Color(0, green_val, 0))


func _ready():
    green_val = 0.5


func _process(delta):
    if Input.is_action_just_pressed("ui_left"):
        get_tree().call_group("enemies", "on_left_cut")
    if Input.is_action_just_pressed("ui_right"):
        get_tree().call_group("enemies", "on_right_cut")


func on_left_cut():
    green_val = clamp(green_val - 0.1, 0, 1.0)
    update()


func on_right_cut():
    green_val = clamp(green_val + 0.1, 0, 1.0)
    update()
