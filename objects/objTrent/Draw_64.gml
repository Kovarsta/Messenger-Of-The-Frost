 /// Drawing dialogue
if (place_meeting(x, y, objPlayer)) {
	//Change sprite direction to look at player
	switch objPlayer.dir {
		case 0 : sprite_index = TrentLeft; break;
		case 1 : sprite_index = TrentRight; break;
		case 2 : sprite_index = TrentBehind; break;
		case 3 : sprite_index = Trent; break;
	}
	
    if (keyboard_check_pressed(vk_space)) {
        if (interacting) {  // If already interacting, advance dialogue

            currentLine++;  // Move to the next line
            if (currentLine >= array_length(objDialogue.dialogue[7]) or currentLine == maxLine) {  // If no more lines, end dialogue, or if dialogue has reached max available.
                interacting = false;
                objPlayer.allowMovement = true
				if currentLine >= 30 {global.trentIntro = true}
				if currentLine >= 63 {global.trentBye = true}
				if global.trentBye and !global.trentAdded {global.hopeJar += 35; global.trentAdded = true}
				if global.trentIntro { 
					if instance_exists(inst_423B903E) and instance_exists(inst_25C0EC48) {
						instance_destroy(inst_423B903E)
						instance_destroy(inst_25C0EC48)
					}
				}
            }
        } else {
			//if global.trentBye {currentLine = 63 ; maxLine = 65 ; global.trentHope = true; global.trentBye = true}
			if !hasItem("Red Wrench") and global.trentIntro {currentLine = 30 ; maxLine = 33}
			interacting = true 
			if hasItem("Red Wrench") {currentLine = 33 ; maxLine = 65 ; global.trentHope = true}
			if global.trentHope and global.trentBye {currentLine = 63 ; maxLine = 65; global.trentBye = true}
			//if global.trentIntro and hasItem() {currentLine = 30 ; maxLine = 33}

			
        }
    }
}
else {sprite_index = Trent}
if (interacting) {
	objPlayer.allowMovement = false;
	var textX = 60 + 30 * 2;
	var textY = 288 + 20 * 2;
	draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
	draw_text_transformed_color(textX, textY, objDialogue.dialogue[7, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
  