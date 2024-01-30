/// Drawing dialogue
if (place_meeting(x, y, objPlayer)) {
    if (keyboard_check_pressed(vk_space)) {
        if (interacting) {  // If already interacting, advance dialogue
            currentLine++;  // Move to the next line
            if (currentLine >= array_length(objDialogue.dialogue[5]) or currentLine == maxLine) {  // If no more lines, end dialogue, or if dialogue has reached max available.
                interacting = false;
                objPlayer.allowMovement = true
				if currentLine >= 48 {introduction = true} // Set introduction to true
				//if currentLine == 49 {introduction = true} // Push an item into inv
				//if currentLine == 49 {array_push(global.inv, global.invList.Dust)} // Push an item into inv
            }
        } else {
			interacting = true
            objPlayer.allowMovement = false;
			//if global.hopeJar >= 100 and interacting{draw_text(16,16,"test passed") ; layer_sequence_create("Instances",320,240,Sequence1)} // PUT 100 CODE IN THIS LINE
			//if currentLine == 49 {array_push(global.inv, global.invList.Dust)} // Push an item into inv
			if global.koIntro {currentLine = 4 ; maxLine = 51}
			if currentLine == 48 {introduction = true}; // Set to line 20 once player has talked to Ko once.
			if introduction {currentLine = 48; maxLine = 49}
			if currentLine == maxLine {currentLine = currentLine-1} 
	
        }
    }
}
if hasItem("Yellow Dust") == false {if currentLine == 50 {array_push(global.inv, global.invList.Dust)}} // Push an item into inv}
// PUT 100 CODE IN THIS LINE
//if global.hopeJar >= 100 and interacting{draw_text(16,16,"test passed") ; layer_sequence_create("sound",camera_get_view_width(0)/2,camera_get_view_height(0)/2,seqEnding)} // PUT 100 CODE IN THIS LINE
if hasItem("Yellow Dust") {currentLine = 48; maxLine = 49}
if (interacting) {
	objPlayer.allowMovement = false
	var textX = 60 + 30 * 2;
	var textY = 288 + 20 * 2;
	draw_sprite_stretched(diaBox2, 0, 96, 288, 447, 159);
	draw_text_transformed_color(textX, textY, objDialogue.dialogue[5, currentLine], 1.5, 1.5, 0, diaColor, diaColor, diaColor, diaColor, 1);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
  