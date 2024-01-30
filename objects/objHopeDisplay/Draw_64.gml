/// @description Insert description here
if keyboard_check_pressed(ord("M")) {
	if interacting = false and instance_exists(objPlayer){UI = true ; interacting = true}
	else {UI = false; interacting = false; objPlayer.allowMovement = true}
}

if UI {
	objPlayer.allowMovement = false
	draw_sprite(UIBackDrop,0,camera_get_view_width(0)/2,camera_get_view_height(0)/2)
	draw_text_transformed_color(320,240,"Current hope amount: "+string(global.hopeJar) + " %",2,2,0,color,color,color,color,1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	//if global.hopeJar >= 100 {draw_text_transformed_color(centerX, centerY, completeNotif,2,2,0,color,color,color,color,1)} 
	}