 /// Drawing dialogue
if (place_meeting(x, y, objPlayer)) {
	//Change sprite direction to look at player
	switch objPlayer.dir {
		case 0 : sprite_index = KoLeft; break;
		case 1 : sprite_index = KoRight; break;
		case 2 : sprite_index = KoBehind; break;
		case 3 : sprite_index = Ko; break;
	}
	
    if (keyboard_check_pressed(vk_space)) {
        if (interacting) {  // If already interacting, advance dialogue
            currentLine++;  // Move to the next line
			
            if (currentLine >= array_length(objDialogue.dialogue[10]) or currentLine == maxLine) {  // If no more lines, end dialogue, or if dialogue has reached max available.
                interacting = false;
                objPlayer.allowMovement = true
				if currentLine >= 19 {introduction = true; global.koIntro = true}; // Set to line 20 once player has talked to Ko once.
				if currentLine > 50 {introduction = true; global.koBye = true ; global.koHope = true}; // Set to line 20 once player has talked to Ko once.
				if global.koHope and global.koAdded = false {global.hopeJar += 35; global.koAdded = true}
			}
        } else {
			interacting = true
			if (hasItem("Canned Food") and hasItem("Yellow Dust")) {currentLine = 22 ; maxLine = 52}
			//if hasItem("Canned Food") {currentLine = 22 ; maxLine = 52 ; global.koIntro = false ; global.koBye = true}
            objPlayer.allowMovement = false;
			if global.koIntro { if hasItem("Canned Food") == false or hasItem("Yellow Dust") == false {currentLine = 21; maxLine = 22}} // Save state when teleporting between rooms
			if global.koBye and global.koIntro{currentLine = 50 ; maxLine = 52} 
			//if currentLine == maxLine {currentLine = currentLine-1} // Prevent out of index
	
        }
    }
}
else {sprite_index = Ko} // Reset sprite when player leaves
if hasItem("Ko's ID") == false {if global.koBye {array_push(global.inv, global.invList.IdCard)}}
//if global.koHope and global.koAdded = false {global.hopeJar += 35; global.koAdded = true}
if (interacting) {
	objPlayer.allowMovement = false
	var textX = 60 + 30 * 2;
	var textY = 288 + 20 * 2;
	draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
	draw_text_transformed_color(textX, textY, objDialogue.dialogue[0, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
  