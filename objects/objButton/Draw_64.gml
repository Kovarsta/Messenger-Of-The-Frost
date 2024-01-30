/// Draw button

draw_self()

// Check for button value when the user presses a button
if (keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left)) {value -= 1};
if (keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right)) {value += 1};

// If the value overflows the button's value, reset.
if (value > 3) {value = 0}
if (value < 0) {value = 3}

// If the button is being hovered moved over the the button, change the font's color.
if (hovering or value == buttonValue) {draw_set_color(c_yellow)}
else {draw_set_color(c_black)}


// Actually drawing the rest of the font and color of it, location of it.
draw_set_font(pixelFont);
draw_text_transformed(x,y,buttonString,1.3,1.3,0)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
