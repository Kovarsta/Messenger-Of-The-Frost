// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveGame(){
	var _data = 
	{
		lastWorld : room_get_name(room),
		lastX : objPlayer.x,
		lastY : objPlayer.y,
		inventory : global.inv,
		jarState : global.hopeJar, 
		koStateIntro : global.koIntro,
		koStateBye : global.koBye,
		koStateHope : global.koHope,
		trentStateIntro : global.trentIntro,
		trentStateBye : global.trentBye,
		trentStateHope : global.trentHope,
		seiraStateHope : global.seiraHope,
		seiraStateBye : global.seiraBye,
		seiraStateIntro : global.seiraIntro,
		trentAdd : global.trentAdded,
		koAdd : global.koAdded,
		seiraAdd : global.seiraAdded,
		
	};
	var _file = file_text_open_write("save.txt");
	var _dataJson = json_stringify(_data);
	file_text_write_string(_file, _dataJson);
	file_text_close(_file)
}

function loadGame(){
	if (file_exists("save.txt")) {
		var _file = file_text_open_read("save.txt")
		var _dataJson = file_text_read_string(_file)
		var _data = json_parse(_dataJson)
		var lastWorldName = _data.lastWorld
		var lastWorldId = asset_get_index(lastWorldName)
		room_goto(lastWorldId)
	}
}

function loadGameData(){
	if (file_exists("save.txt")) {
		var _file = file_text_open_read("save.txt")
		var _dataJson = file_text_read_string(_file)
		var _data = json_parse(_dataJson)
		var lastWorldName = _data.lastWorld
		//objPlayer.x = _data.lastX
		//objPlayer.y = _data.lastY
		global.inv = _data.inventory
		global.koHope = _data.koStateHope
		global.koBye = _data.koStateBye
		global.koIntro = _data.koStateIntro
		global.trentIntro = _data.trentStateIntro
		global.trentBye = _data.trentStateBye
		global.trentHope = _data.trentStateHope
		global.seiraIntro = _data.seiraStateIntro
		global.seiraHope = _data.seiraStateHope
		global.seiraBye = _data.seiraStateBye
		global.hopeJar = _data.jarState
		global.trentAdded = _data.trentAdd
		global.koAdded = _data.koAdd
		global.seiraAdded = _data.seiraAdd
	}
}     

function hasItem(_item) {
	for (var i = 0 ; i < array_length(global.inv); i++) {
		var itemCurrent = global.inv[i]
		if itemCurrent.nameItem ==  _item {
			return true
		}
	}
	return false
}