tool
extends Control

const COLOR := [
    Color(),
    Color(1.0, 1.0, 1.0, 1.0),
    Color(1.0, 0.0, 0.0, 1.0),
    Color(0.0, 1.0, 0.0, 1.0),
    Color(0.0, 0.0, 1.0, 1.0),
]
const SHAPE_NUM = 10

var color_idx := 1
var shape_idx := 1
var r := 80.0


func _process(_delta):
    if Input.is_action_just_pressed("ui_select"):
        shape_idx = shape_idx % SHAPE_NUM + 1
        update()
    elif Input.is_action_pressed("ui_left"):
        r = clamp(r - 10, 0, 500)
        update()
    elif Input.is_action_pressed("ui_right"):
        r = clamp(r + 10, 0, 500)
        update()
    elif Input.is_action_just_pressed("ui_up"):
        color_idx = (color_idx + 1) % COLOR.size()
        update()
    elif Input.is_action_just_pressed("ui_down"):
        color_idx = COLOR.size() - 1 if color_idx <= 0 else color_idx - 1
        update()


func _draw():
    var func_name = "_draw_shape_%d" % shape_idx
    call(func_name)


func _draw_shape_1():
    draw_circle(Vector2(), r, COLOR[color_idx])


func _draw_shape_2():
    draw_line(Vector2(-r/2, 0), Vector2(r/2, 0), COLOR[color_idx], 3.0)


func _draw_shape_3():
    draw_line(Vector2(0, -r/2), Vector2(0, r/2), COLOR[color_idx], 3.0)


func _draw_shape_4():
    draw_rect(Rect2(-r/2, -r/2, r, r), COLOR[color_idx], false)


func _draw_shape_5():
    var points:PoolVector2Array = []
    points.append(Vector2(-r*0.9, -r*0.6))
    points.append(Vector2(-r*0.6, r*0.6))
    points.append(Vector2(r*0.6, r*0.6))
    points.append(Vector2(r*0.5, -r*0.4))
    points.append_array([Vector2(0.0, -r), Vector2(-0.3*r, -0.7*r)])
    draw_colored_polygon(points, COLOR[color_idx])


func _draw_shape_6():
    var points:PoolVector2Array = [
        Vector2(-r*0.9, -r*0.6),
        Vector2(-r*0.6, r*0.6),
        Vector2(r*0.6, r*0.6),
        Vector2(r*0.5, -r*0.4),
        Vector2(0.0, -r), 
        Vector2(-0.3*r, -0.7*r),
    ]
    var colors := [
        COLOR[0],
        COLOR[2],
        COLOR[1],
        COLOR[3],
        COLOR[4],
        COLOR[1],
    ]
    draw_polygon(points, colors, PoolVector2Array(), null, null, true)


func _draw_shape_7():
    var points:PoolVector2Array = []
    points.append(Vector2(-r*0.9, -r*0.6))
    points.append(Vector2(-r*0.6, r*0.6))
    points.append(Vector2(r*0.6, r*0.6))
    points.append(Vector2(r*0.5, -r*0.4))
    points.append_array([Vector2(0.0, -r), Vector2(-0.3*r, -0.7*r)])
    draw_polyline(points, COLOR[color_idx], 1.0, true)


func _draw_shape_8():
    var points:PoolVector2Array = [
        Vector2(-r*0.9, -r*0.6),
        Vector2(-r*0.6, r*0.6),
        Vector2(r*0.6, r*0.6),
        Vector2(r*0.5, -r*0.4),
        Vector2(0.0, -r), 
        Vector2(-0.3*r, -0.7*r),
    ]
    points.append(points[0])
    var colors := [
        COLOR[0],
        COLOR[2],
        COLOR[1],
        COLOR[3],
        COLOR[4],
        COLOR[1],
    ]
    colors.append(colors[0])
    draw_polyline_colors(points, colors, 3.0, true)


func _draw_shape_9():
    # draw_arc(Vector2(), r, PI/4, PI, 60, COLOR[color_idx], 1.0, false)

    var center = Vector2()
    var from_angle = PI/4
    var to_angle = PI
    var nb_points = 32
    var points_arc = PoolVector2Array()

    for i in range(nb_points + 1):
        var angle_point = from_angle + i * (to_angle - from_angle) / nb_points
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * r)

    for index_point in range(nb_points):
        draw_line(points_arc[index_point], points_arc[index_point + 1], COLOR[color_idx], 3.0, true)


func _draw_shape_10():
    var center = Vector2()
    var from_angle = PI/4
    var to_angle = PI
    var nb_points = 32
    var points_arc = PoolVector2Array()
    var colors = PoolColorArray([COLOR[color_idx]])

    for i in range(nb_points + 1):
        var angle_point = from_angle + i * (to_angle - from_angle) / nb_points
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * r)
    points_arc.insert(0, Vector2())

    draw_polygon(points_arc, colors)
