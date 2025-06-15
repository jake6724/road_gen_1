extends Node2D
class_name road_generator

# # Basic parameters
# @export var grid_size: int = 10  # Number of cells in the grid
# @export var cell_size: int = 100  # Size of each cell in pixels
# @export var road_width: int = 20  # Width of the roads

# func _ready() -> void:
# 	generate_roads()

# func generate_roads() -> void:
# 	# Clear any existing roads
# 	for child in get_children():
# 		child.queue_free()
	 
# 	# Generate horizontal roads
# 	for i in range(grid_size + 1):

# 		var road: Line2D = Line2D.new()
# 		road.width = road_width
# 		road.default_color = Color.DARK_GRAY
# 		road.add_point(Vector2(0, i * cell_size))
# 		road.add_point(Vector2(grid_size * cell_size, i * cell_size))
# 		add_child(road)
	
# 	# Generate vertical roads
# 	for i in range(grid_size + 1):
# 		var road: Line2D = Line2D.new()
# 		road.width = road_width
# 		road.default_color = Color.DARK_GRAY
# 		road.add_point(Vector2(i * cell_size, 0))
# 		road.add_point(Vector2(i * cell_size, grid_size * cell_size))
# 		add_child(road)
