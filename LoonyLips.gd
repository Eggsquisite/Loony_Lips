extends Control

var player_words = []
var template = [
		{ # new dictionary
		"story" : "There once was a man named %s who everyone in his village thought was a %s. Filled with %s, he left the village in search of the meaning of %s.",
		"prompts" : ["a name", "a noun", "an emotion", "a noun"]
		},
		{ # new dictionary
		"story" : "A girl's %s was %s and she went in search of %s. She was %s on her journey and lost everything",
		"prompts" : ["a noun", "a past tense verb", "a noun", "an adjective"]
		},
		{ # new dictionary
		"story" : "A woman and her %s were stranded in %s when attacked by %s animals. They ran to %s to seek shelter.",
		"prompts" : ["a noun", "a place", "an adjective", "a place"],
		},
		]
var current_story

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var ConfirmText = $VBoxContainer/HBoxContainer/ConfirmText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	set_current_story()
	DisplayText.text = "Welcome to Loony Lips! We're going to try our hand at storytelling! \n\n"
	ConfirmText.text = "ok"
	check_player_words_length()
	PlayerText.grab_focus()


func set_current_story():
	randomize()
	current_story = template[randi() % template.size()]


func _on_PlayerText_text_entered(_new_text):
	add_to_player_words()


func _on_TextureButton_pressed():
	if is_story_done():
		# restart game when pressing button and story is done
		get_tree().reload_current_scene()
	else:
		add_to_player_words()


func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == current_story.prompts.size()


func check_player_words_length():
	if is_story_done():
		end_input()
	else:
		prompt_player()


func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"


func end_input():
	PlayerText.queue_free()
	ConfirmText.text = "again!"
	tell_story()


func tell_story():
	DisplayText.text = current_story.story % player_words


