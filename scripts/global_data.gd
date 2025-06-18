extends Node

var available_highway_colors: Array[Color] = [
	Color.RED,
	Color.BLUE,
	Color.GREEN,
	Color.ORANGE,
	Color.PURPLE,
	Color.BROWN,
	Color.YELLOW,
	Color.CYAN,
	Color.MAGENTA,
]

# var available_highway_colors: Array[Color] = generate_highway_colors()


# func generate_highway_colors() -> Array[Color]:
# 	var res: Array[Color] = []
# 	var hue: float = .1
# 	for i in range(10):
# 		var new_color:Color = Color.from_hsv(hue, 1.0, 1.0, 1)
# 		res.append(new_color)
# 		print(new_color.
# 		hue += .1

# 	return res
