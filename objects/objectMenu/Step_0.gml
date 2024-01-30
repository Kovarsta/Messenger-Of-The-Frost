/// @description 
up = keyboard_check_pressed(ord("W"));
down = keyboard_check_pressed(ord("S"));
proceed = keyboard_check_pressed(vk_space)

// Store number of options in current menu
// Because option is a 2D array, we add menuLevel to check for that.
opLength = array_length(option[menuLevel]) 

// Move down
pos += down - up;
if pos >= opLength {pos = 0};
if pos < 0 {pos = opLength-1};

// If the player wants to proceed with an option
if proceed {
	// Using the options
	var _startMenuLevel = menuLevel
	
	switch(menuLevel){
		
		// Pause menu
		case 0:
			switch(pos){
				// Start
				case 0: room_goto(World1); break;
				// Settings
				case 1: menuLevel = 1; break
				// Quit
				case 2: game_end(); break
			}
		break;
		
		// Settings
		case 1:
			switch(pos){
				// Window size
				case 0: break;
				// Brightness
				case 1: break;
				// Control
				case 2: break;
				// Back
				case 3: menuLevel = 0; break;
			}
	}
	
	if _startMenuLevel != menuLevel {pos = 0};
	// Correct option lenght
	opLength = array_length(option[menuLevel]) 
}
