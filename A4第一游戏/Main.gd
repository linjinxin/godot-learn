extends Node


export (PackedScene) var Mob
var score


func _ready():
    randomize()


func new_game():
    score = 0
    $Player.start($Position2D.position)
    $StartTimer.start()
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")
    $Music.play()


func game_over():
    $ScoreTimer.stop()
    $MobTimer.stop()
    $HUD.show_game_over()
    $Music.stop()
    $DealthSound.play()
    get_tree().call_group("mobs", "queue_free")


func _on_StartTimer_timeout():
    $MobTimer.start()
    $ScoreTimer.start()


func _on_MobTimer_timeout():
    $MobPath/MobSpawnLocation.offset = randi()
    var pos = $MobPath/MobSpawnLocation.position
    var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
    direction += rand_range(-PI / 4, PI / 4)

    var mob = Mob.instance()
    mob.position = pos
    mob.rotation = direction
    var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0) 
    mob.linear_velocity = velocity.rotated(direction)
    add_child(mob)


func _on_ScoreTimer_timeout():
    score += 1
    $HUD.update_score(score)
