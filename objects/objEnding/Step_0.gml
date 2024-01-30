/// @description Insert description here

if instance_exists(objPlayer) and !completed {
	if global.hopeJar >= 100 and objPlayer.allowMovement{
		if room_get_name(room) != Ending {
			room_goto(Ending)
		}
		completed = true
	}
}
