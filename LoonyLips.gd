extends Control


func _ready():
	var prompts = ["Jacob", "murderer", "anger", "tacos"]
	var story = "There once was a man named %s who everyone in his village thought was a %s. Filled with %s, he left the village in search of the meaning of %s"
	$VBoxContainer/DisplayText.text = story % prompts


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)


func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/PlayerText.clear()
