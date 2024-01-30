/// Movement


// Movement variables
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
left = keyboard_check(ord("A"));
down = keyboard_check(ord("S"));
running = keyboard_check(vk_shift);


// Movement formulas
if allowMovement{
	vx = ((right - left) * (walkSpeed + runSpeed));
	vy = ((down - up) * (walkSpeed + runSpeed));
	global.playerX = vx
	global.playerY = vy
}
else {
	vx = 0 ; vy = 0;
}


// Check to see if there is movement
if (vx != 0 || vy != 0) {
	if !place_meeting(x+vx,y, objEnvironment) {
		x += global.playerX ;
	}
	if !place_meeting(x,y+vy, objEnvironment) {
		y += global.playerY ;
	}
	
	// Change sprite based on direction
	if vx > 0 {sprite_index = MariRight_Sheet ; dir = 0} 
	if vx < 0 {sprite_index = MariLeft_Sheet ; dir = 1} 
	if vy > 0 {sprite_index = Mari_Sheet ; dir = 2} 
	if vy < 0 {sprite_index = MariBehind_Sheet ; dir = 3} 
}

// Apply a speed penalty if movement is diagonial
if (vx != 0 && vy != 0) {
	if !place_meeting(x+vx,y, objEnvironment) {
		x += (vx / 10000) ;
	}
	if !place_meeting(x,y+vy, objEnvironment) {
		y += (vy / 10000);
	}
}

// If idle, change sprite sheet to normal sprite to stop animation
if vx == 0 && vy = 0 {
	if dir = 0 {sprite_index = MariRight}
	if dir = 1 {sprite_index = MariLeft}
	if dir = 2 {sprite_index = Mari}
	if dir = 3 {sprite_index = MariBehind}
}

// Apply a speed boost of user is holding shift
if (running == true && runSpeed <= runSpeedMax) {
	runSpeed = 2;
}
else {
	runSpeed = 0;
}

// Delete a world object it its already in inventory
if (room_get_name(room) == "Warehouse") {
	if hasItem("Canned Food") {instance_destroy(objCannedFood)}
}
if (room_get_name(room) == "Cave") {
	if hasItem("Red Wrench") {instance_destroy(objWrench)}
}
if (room_get_name(room) == "Apartment") {
	if hasItem("Tablet's Pen") {instance_destroy(objPen)}
}
//Depth sorting
depth =- y;
