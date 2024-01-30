/// Draw the menu background

// Dynamically get width and height of the menu bg
var _newWidth = 0;
for (var i = 0 ; i < opLength ; i++) {
	var _opWidth = string_width(option[menuLevel, i]);
	_newWidth = max(_newWidth, _opWidth)
}
width = _newWidth + opBorder*2
height = opBorder * 2 + string_height(option[0, 0]) + (opLength-1) * opSpace;

// Center menu
x = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]/2 - width /2));
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]/2 - height /2);


// Draw a sprite on the screen, like button on a window.
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Drawing out the options
draw_set_font(pixelFont);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < opLength ; i++) {
	var _c = c_white
	if pos == i {_c = c_yellow}
	// This is used to draw the option string, adding X and Y inside the border.
	// With an exception to add a space every new line of string to avoid stacking.
	// option[i] is to draw the actual string.
	// y stop adding when there is 0 option.
	draw_text_color(x+opBorder, y+opBorder+opSpace*i, option[menuLevel, i], _c, _c, _c, _c, 1);
}