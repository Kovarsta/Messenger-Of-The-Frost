/// Interactive 
/*
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hovering == true && mouse_check_button_pressed(mb_left)) {
	file_delete("save.txt")
	room_goto(Cabin)
}
*/
if (value == buttonValue && keyboard_check_pressed(vk_space)) {
	file_delete("save.txt")
	room_goto(Cabin)
}