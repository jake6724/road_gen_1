extends Node2D
class_name HighwayGenerator

@export var population_density: PopulationDensityGenerator


var map_height: int = 100
var map_width: int = 100
var values: Array = []

func _ready():
	
	for x in range(map_height):
		for y in range(map_width):
			values.append([population_density.])
