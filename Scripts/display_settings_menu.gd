extends Control


func _on_resolutions_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1: 
			DisplayServer.window_set_size(Vector2i(1366, 768))
		2: 
			DisplayServer.window_set_size(Vector2i(1440, 900))
		3: 
			DisplayServer.window_set_size(Vector2i(1280, 720))
		4: 
			DisplayServer.window_set_size(Vector2i(1280, 1024))
		5: 
			DisplayServer.window_set_size(Vector2i(1600, 900))
		6: 
			DisplayServer.window_set_size(Vector2i(1680, 1050))
		7: 
			DisplayServer.window_set_size(Vector2i(1280, 800))
		_:
			DisplayServer.window_set_size(Vector2i(1920, 1080))


func _on_back_pressed():
	hide()
