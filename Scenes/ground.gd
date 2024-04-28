extends Node2D

class_name Ground

signal bird_crashed

@export var speed = -150

@onready var sprite_1 = $Ground1/Sprite2D
@onready var sprite_2 = $Ground2/Sprite2D

func _ready():
	sprite_2.global_position.x  = sprite_1.global_position.x + sprite_1.texture.get_width();

func _process(delta):
	sprite_1.global_position.x += speed * delta
	sprite_2.global_position.x += speed * delta
	
	if sprite_1.global_position.x < -sprite_1.texture.get_width():
		sprite_1.global_position.x = sprite_2.global_position.x + sprite_2.texture.get_width();
	if sprite_2.global_position.x < -sprite_2.texture.get_width():
		sprite_2.global_position.x = sprite_1.global_position.x + sprite_1.texture.get_width();


func _on_body_entered(body):
	bird_crashed.emit()
	stop()
	(body as Bird).stop()

func stop():
	speed = 0
