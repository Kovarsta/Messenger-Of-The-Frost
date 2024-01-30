// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrNPCDetection(){
	function scrPlayerItemDetection(_objCharName){
	if place_meeting(x, y, _objCharName) {
		if keyboard_check(vk_space) {
			with (_objCharName)
			{
				show_debug_message("delete this")
			}
		}
	}
}
}