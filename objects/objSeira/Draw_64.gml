 /// Drawing dialogue
if (place_meeting(x, y, objPlayer)) {
	//Change sprite direction to look at player
	switch objPlayer.dir {
		case 0 : sprite_index = SeiraLeft; break;
		case 1 : sprite_index = SeiraRight; break;
		case 2 : sprite_index = SeiraBehind; break;
		case 3 : sprite_index = Seira; break;
	}
	
    if (keyboard_check_pressed(vk_space)) {
        if (interacting) {  // If already interacting, advance dialogue
            currentLine++;  // Move to the next line
            if (currentLine >= array_length(objDialogue.dialogue[7]) or currentLine == maxLine) {  // If no more lines, end dialogue, or if dialogue has reached max available.
                interacting = false;
                objPlayer.allowMovement = true
				if currentLine >= 16 {global.seiraIntro = true}
				if currentLine >= 61 {global.seiraBye = true}
				if global.seiraHope and !global.seiraAdded {global.hopeJar += 30; global.seiraAdded = true}
				if global.seiraIntro { 
					if instance_exists(inst_38DA364F) and instance_exists(inst_12FD92D8) {
						instance_destroy(inst_38DA364F)
						instance_destroy(inst_12FD92D8)
					}
				}
            }
        } else {
			//if global.trentBye {currentLine = 63 ; maxLine = 65 ; global.trentHope = true; global.trentBye = true}
			if !hasItem("Tablet's Pen") and global.seiraIntro {currentLine = 18 ; maxLine = 19}
			interacting = true 
			if hasItem("Tablet's Pen") {currentLine = 19 ; maxLine = 63 ; global.seiraHope = true}
			if global.seiraHope and global.seiraBye {currentLine = 61 ; maxLine = 63; global.seiraBye = true}
			//if global.trentIntro and hasItem() {currentLine = 30 ; maxLine = 33}

			
        }
    }
}
else {sprite_index = Seira}
if (interacting) {
	objPlayer.allowMovement = false;
	var textX = 60 + 30 * 2;
	var textY = 288 + 20 * 2;
	draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
	draw_text_transformed_color(textX, textY, objDialogue.dialogue[10, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
  