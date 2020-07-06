extends Control


func _ready():
	var prompts = ["Yann", "slut", "lust", "tacos"]
	var story = "There once was a man named %s who everyone in his village thought was a %s. Filled with %s, he left the village in search of the meaning of %s"
	print(story % prompts)
	
