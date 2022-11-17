import flash.events.KeyboardEvent; // imports keyboard events
import flash.ui.Keyboard; // allows us to easily refer to the keys of keyboard with ease
import flash.display.MovieClip;
import flash.events.Event;
import flash.display.Stage;


linkMc.gotoAndStop("StandFrontFrame"); //goes to the given frame in the timeline of the instance and stops there

// variables for link
var rightPressed:Boolean = false; // controls the right arrow press key
var leftPressed:Boolean = false; // controls the right arrow press key
var upPressed:Boolean = false; // controls the right arrow press key
var downPressed:Boolean = false; // controls the right arrow press key
var linkSpeed:Number = 6;
// variables for kope

var kopeTimer:Number = 0;
var KopeDur:Number = Math.random() * 25; // randomly selects the duration for which kope will move in a direction
var kopeFacing:Number = Math.floor(Math.random() * 4); // randomly selects a direction to walk in
var kopeSpeed:Number = 3;






// creating an event listener for pressing keys
stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); // event for pressing a key
stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
stage.addEventListener(Event.ENTER_FRAME, gameLoop);


// controls the down press
function keyDownHandler(keyEvent:KeyboardEvent):void{
	
	if(keyEvent.keyCode == Keyboard.RIGHT){
		rightPressed = true;
	}
	else if(keyEvent.keyCode == Keyboard.LEFT){
		leftPressed = true;
	}
	else if(keyEvent.keyCode == Keyboard.DOWN){
		downPressed = true;
	}
	else if(keyEvent.keyCode == Keyboard.UP){
		upPressed = true;
	}
}

// controls the up press
function keyUpHandler(keyEvent:KeyboardEvent):void{
	
	if(keyEvent.keyCode == Keyboard.RIGHT){
		rightPressed = false;
		linkMc.gotoAndStop("StandRightFrame");
	}
	else if(keyEvent.keyCode == Keyboard.LEFT){
		leftPressed = false;
		linkMc.gotoAndStop("StandLeftFrame");
	}
	else if(keyEvent.keyCode == Keyboard.UP){
		upPressed = false;
		linkMc.gotoAndStop("StandBackFrame");
	}
	else if(keyEvent.keyCode == Keyboard.DOWN){
		downPressed = false;
		linkMc.gotoAndStop("StandFrontFrame");
	}
	
}

// ------------------------------------------------------------------------
// -------------------function to control the game loop.-------------------
// ------------------------------------------------------------------------
function gameLoop(loopEvent:Event):void{
	
	// links movement controls
	if(rightPressed){
		
		if(linkMc.x < 800)
			linkMc.x += linkSpeed;
		else
		{
			if(overworldMc.x > -4310)
				overworldMc.x -= linkSpeed;
		}
			
			
		linkMc.gotoAndStop("WalkRightFrame");
	}
	else if(leftPressed){
		
		if(linkMc.x > 200)
			linkMc.x -= linkSpeed;
		else{
			if(overworldMc.x < 0)
				overworldMc.x += linkSpeed;
		}
			
		linkMc.gotoAndStop("WalkLeftFrame");
	}
	else if(upPressed){
		
		if(linkMc.y > 200)
			linkMc.y -= linkSpeed;
		else
		{
			if(overworldMc.y < 0)
				overworldMc.y += linkSpeed;
		}
			
		linkMc.gotoAndStop("WalkBackFrame");
	}
	else if(downPressed){
		
		if(linkMc.y < 568)
			linkMc.y += linkSpeed;
		else
		{
			if(overworldMc.y > -2232)
				overworldMc.y -= linkSpeed;
		}
			
			
		linkMc.gotoAndStop("WalkFrontFrame");
	}
	
	// Kope's Brain
	
}









