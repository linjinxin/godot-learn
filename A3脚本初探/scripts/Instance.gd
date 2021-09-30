extends Node2D


var inst


func _ready():
    pass # Replace with function body.


func _process(delta):
    if Input.is_action_just_pressed("ui_left") and not inst:
        # inst = load_sprite()
        # inst = load_scene()
        inst = preload_scene()
        inst.position = Vector2(300, 400)
        add_child(inst)
    elif Input.is_action_just_pressed("ui_right") and inst:
        inst.queue_free()
        inst = TYPE_NIL


func load_sprite():
    var sprite = Sprite.new()
    var texture = load("res://res/icon.png")
    sprite.texture = texture
    sprite.flip_v = true
    return sprite


func load_scene():
    var scene = load("res://Instance-Sub.tscn")
    var node = scene.instance()
    return node


func preload_scene():
    var packed_scene = preload("res://Instance-Sub.tscn")
    var scene = packed_scene.instance()
    return scene
