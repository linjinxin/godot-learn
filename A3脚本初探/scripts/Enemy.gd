extends Node2D


var red_val


func _draw():
    self.draw_circle(Vector2(), 100, Color(red_val, 0, 0))


func _ready():
    red_val = 0.5
    # add_to_group("enemies")


func on_left_cut():
    red_val = clamp(red_val - 0.1, 0, 1)
    update()


func on_right_cut():
    red_val = clamp(red_val + 0.1, 0, 1)
    update()
