 if keyboard_check_pressed(vk_tab) and instance_exists(objPlayer){
	if (UIFlag = false) {
		UIFlag = true
	}
	else if (UIFlag == true){
		UIFlag = false
		objPlayer.allowMovement = true
	}
}
if UIFlag == true {
	objPlayer.allowMovement = false
	draw_sprite(UIBackDrop,0,camera_get_view_width(0)/2,camera_get_view_height(0)/2)
	draw_text_transformed_color(136, 16, "Inventory Menu", 1.3, 1.3, 0, color, color, color, color, 1)
	for (var i = 0 ; i < array_length(global.inv) ; i++) {
		draw_text_transformed_color(xAlign + 60, yAlign + 50 * i, global.inv[i].nameItem, 1.3, 1.3, 0, color, color, color, color, 1)
	}
}

