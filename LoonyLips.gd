extends Control

var player_words = []
var prompts = ["a name", "a noun", "an emotion", "a noun"]
var story = "There once was a man named %s who everyone in his village thought was a %s. Filled with %s, he left the village in search of the meaning of %s."

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	DisplayText.text = "Welcome to Loony Lips! We're going to try our hand at storytelling! \n\n"
	check_player_words_length()


func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
	

func _on_TextureButton_pressed():
	add_to_player_words()


func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == prompts.size()


func check_player_words_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()


func tell_story():
	DisplayText.text = story % player_words


func prompt_player():
	DisplayText.text += "May I have " + prompts[player_words.size()] + " please?"
