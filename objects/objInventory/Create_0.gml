depth = -9999

xAlign = 16 ; yAlign = 64 ; 

global.invList = {
	coins : {
		nameItem : "Coin",
		description : "This is a test item.",
		sprite : testPickupObject,
	},
	
	tutorialBook : {
		nameItem : "Tutorial book",
		description: "Teaches you the basic of the world.",
		sprite : book,
	},
	Key : {
		nameItem: "Key",
		description: "A Golden Key.",
		sprite : key,
	},
	CannedFood : {
		nameItem: "Canned Food",
		description: "Canned deliciousness.",
		sprite: cannedFood,
	},
	Dust : {
		nameItem: "Yellow Dust",
		description: "Save the world or not, your choice.",
		sprite: yellowDust,
	},
	Wrench : {
		nameItem : "Red Wrench",
		description : "A tool.",
		sprite : wrench,
	},
	IdCard : {
		nameItem : "Ko's ID",
		description : "She's kinda cute in this picture.",
		sprite : idKo,
	},
	Pen : {
		nameItem: "Tablet's Pen",
		description : "Seira's pen, bet she drew wonderous thing with this.",
		sprite : pen,
	}
}

global.inv = array_create(0)
UIFlag = false

// Variable to check if item does exist
coinExist = false
bookExist = false

// Variable
color = #e40000
global.hopeJar = 0
global.playerX = 0
global.playerY = 0
// Ko State
global.koIntro = false
global.koBye = false
global.koHope = false
// Trent state
global.trentIntro = false
global.trentBye = false
global.trentHope = false
// World1 state
global.w1intro = false
// Ticket Bot state
global.ticketBotValid = false
// Seira state
global.seiraIntro = false
global.seiraBye = false
global.seiraHope = false
// Added state
global.koAdded = false
global.seiraAdded = false
global.trentAdded = false
// Debugging
global.debug = false
