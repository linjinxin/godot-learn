extends Sprite


func _notification(what):
    match what:
        NOTIFICATION_ENTER_TREE:
            print("on child node enter")
        NOTIFICATION_READY:
            print("on child node ready")
        NOTIFICATION_EXIT_TREE:
            print("on child node exit")
