 /// Drawing dialogue
if (place_meeting(x, y, objPlayer)) {
	objPlayer.vx = 0 ; objPlayer.vy = 0;
    if (keyboard_check_pressed(vk_space)) {
        if (interacting) {  // If already interacting, advance dialogue
            currentLine++;  // Move to the next line
            if (currentLine >= array_length(objDialogue.dialogue[0]) or currentLine == maxLine) {  // If no more lines, end dialogue, or if dialogue has reached max available.
                interacting = false;
                objPlayer.allowMovement = true;
            }
        } else {
            interacting = true;
            objPlayer.allowMovement = false;
            currentLine = 1;  // Start from the first line
			// BELOW THIS LINE IS THE STATE OF THE CHARACTER
			if hasItem("Coin") { // If Ko has her coin
				currentLine = 5 // Set the dialogue that start from this
				maxLine = 5 // Set the max dialogue that end from this
			}
        }
    }
}

if (interacting) {
	var textX = 60 + 30 * 2;
	var textY = 288 + 20 * 2;
	draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
	draw_text_transformed_color(textX, textY, objDialogue.dialogue[0, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
	draw_set_halign(fa_left)

}
  