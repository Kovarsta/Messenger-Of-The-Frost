/// Play song
if room_get_name(room) == "Ending" or room_get_name(room) == "Menu" or room_get_name(room) == "Credit"{
	if !audio_is_playing(EndingSong) {
		audio_play_sound(EndingSong,1,false)
	}
}
else {
	if audio_is_playing(EndingSong) {
		audio_stop_sound(EndingSong)
	}
}