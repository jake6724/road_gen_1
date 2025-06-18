extends Node2D
class_name PopulationDensityGenerator

var noise_seed: int = randi()
var base_noise: FastNoiseLite = FastNoiseLite.new()
var detail_noise: FastNoiseLite = FastNoiseLite.new()

func _ready():
	base_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	base_noise.seed = noise_seed
	base_noise.frequency = 0.001

	# detail_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	# detail_noise.seed = noise_seed
	# detail_noise.frequency = .2
	
	visualize_noise()

@export var width: int = 2000
@export var height: int = 2000
var texture_rect: TextureRect

func visualize_noise() -> void:
	var image := Image.create(width, height, false, Image.FORMAT_RGB8)
	for x in range(width):
		for y in range(height):
			var base_noise_value: float = base_noise.get_noise_2d(x, y)
			# var detail_noise_value: float = detail_noise.get_noise_2d(x, y)
			# var combined_value: float = base_noise_value + detail_noise_value
			# Normalize from [-1, 1] to [0, 1]
			# var normalized_combined_value = (combined_value + 1.0) * 0.5
			var normalized_base_value = (base_noise_value + 1.0) * 0.5
			image.set_pixel(x, y, Color(normalized_base_value, normalized_base_value, normalized_base_value))
	var tex := ImageTexture.create_from_image(image)
	texture_rect = TextureRect.new()
	texture_rect.texture = tex
	texture_rect.size = Vector2(width, height)
	add_child(texture_rect)
