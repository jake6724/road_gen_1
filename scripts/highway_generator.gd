extends Node2D
class_name HighwayGenerator

@export var population_density: PopulationDensityGenerator

var marker: PackedScene = preload("res://scenes/Marker.tscn")

var map_height: int = 1000
var map_width: int = 1000
var noise_values: Array = []
var min_heap: MinHeap = MinHeap.new()

func _ready():
	var num_population_centers: int = 10

	# Populate min heap
	for x in range(map_height):
		for y in range(map_width):
			var base_noise_value: float = population_density.base_noise.get_noise_2d(x,y)
			var detail_noise_value: float = population_density.detail_noise.get_noise_2d(x,y)
			var combined_noise_value: float = base_noise_value + detail_noise_value
			if min_heap.data.size() < num_population_centers:
				min_heap.push([combined_noise_value, Vector2(x,y)])
			else:
				if combined_noise_value > min_heap.peek()[0]:
					min_heap.pop()
					min_heap.push([combined_noise_value, Vector2(x,y)])
	
	# Find the top k values by popping from the max heap
	for i in range(num_population_centers):
		var pair = min_heap.pop()
		var point = pair[1]
		var new_marker: Sprite2D = marker.instantiate()
		new_marker.position = point
		add_child(new_marker)
