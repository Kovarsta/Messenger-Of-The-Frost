// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrPlayerItemDetection(_player, _item){
	if place_meeting(x, y, _player) {
		if keyboard_check_pressed(vk_space) {
				instance_destroy(other)
				array_push(global.inv, _item)
		}
	}
}
