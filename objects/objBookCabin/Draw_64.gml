/// Item pickup

// Depth sorting 
depth =- y;

 /// Drawing dialogue
if (place_meeting(x, y, objPlayer)) {
    if (keyboard_check_pressed(vk_space)) {
        if (interacting) {  // If already interacting, advance dialogue
            currentLine++;  // Move to the next line
            if (currentLine >= array_length(objDialogue.dialogue[0]) or currentLine == maxLine) {  // If no more lines, end dialogue, or if dialogue has reached max available.
                interacting = false;
                objPlayer.allowMovement = true
            }
			if currentLine == maxLine {scrPlayerItemDetection(objPlayer, item)} // If the player finishes, destroy and add item to inventory
			if currentLine == 10 {array_push(global.inv, global.invList.Key)} // If the player read a certain line, add an item to inventory
        } else {
			interacting = true 
        }
    }
}
if (interacting) {
	objPlayer.allowMovement = false;
	var textX = 60 + 30 * 2;
	var textY = 288 + 20 * 2;
	draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
	draw_text_transformed_color(textX, textY, objDialogue.dialogue[2, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

