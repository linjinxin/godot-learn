extends Panel


var is_single


func _ready():
    is_single = true
    get_node("Button").connect("pressed", self, "_on_Button_pressed")


func _on_Button_pressed():
    if is_single:
        get_node("Label").text = "世界：我很好！"
        is_single = false
    else:
        get_node("Label").text = "世界：我不好？"
        is_single = true
