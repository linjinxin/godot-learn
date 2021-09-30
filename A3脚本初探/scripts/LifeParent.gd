extends Node2D


func _enter_tree():
    print("on parent node enter")


# Called when the node enters the scene tree for the first time.
func _ready():
    print("on parent node ready")


func _exit_tree():
    print("on parent node exit")
