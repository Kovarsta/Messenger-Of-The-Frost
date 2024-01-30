/// Drawing dialogue
if global.debug == false and roomStart and global.w1intro == false {
    if (interacting and finished = false) { // If already interacting, advance dialogue
		if keyboard_check_pressed(vk_space) {
        currentLine++; // Move to the next line
	        if (currentLine >= array_length(objDialogue.dialogue[3]) or currentLine == maxLine) { // If no more lines, end dialogue, or if dialogue has reached max available.
	            interacting = false;
	            objPlayer.allowMovement = true;
				finished = true
	        }
		}
    } else {
        interacting = true;
        objPlayer.allowMovement = false;
        currentLine = 1; // Start from the first line
    }

    if (interacting and finished == false) {
		objPlayer.allowMovement = false
        var textX = 60 + 30 * 2;
        var textY = 288 + 20 * 2;
        draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
        draw_text_transformed_color(textX, textY, objDialogue.dialogue[3, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

if finished {objPlayer.allowMovement = true; global.w1intro = true}
