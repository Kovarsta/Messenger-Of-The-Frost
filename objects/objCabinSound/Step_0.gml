/// @description Insert description here
if instance_exists(objPlayer) and place_meeting(x,y, objPlayer){
	if objPlayer.vx != 0 || objPlayer.vy != 0 {
		if !audio_is_playing(walking) and !objPlayer.running{ // If not running
			audio_stop_sound(running) // Destroy the sound being played before
			audio_play_sound(walking,1,false)
		}
		if !audio_is_playing(running) and objPlayer.running { // If running
			audio_stop_sound(walking) // Destroy the sound being played before
			audio_play_sound(running,1,false)
		}
	}
}
