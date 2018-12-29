//player class
class Player {
  PImage skier; //image for the player, stolen from the internet
  float pWidth;
  float pHeight;
  float pX;
  float pY;
  float pSpeedX;
  float playerCounter; //this is the timer for the player when they're hit that shows how long they have left to live
  float playerScore;
  boolean living;
  int xDirection; //is used for checking which way the player is moving, which is related to the collision method in Tree_Object (it makes it bounce)
  float counterAmount; //the amount you count down or up by
  Player() {
    skier=loadImage("SkierIm.jpg");
    living=true;
    pWidth=30;
    pHeight=90;
    pX=width/2-pWidth/2;
    pY=300-pHeight; 
    pSpeedX=0;
    playerScore=0;
    playerCounter=counterValue;
    xDirection=0; //makes the player not move left or right at the beginning
    counterAmount=-0.5;
  }
  //displays player and player stats
  void display() {
    //player image
    image(skier, pX, pY, 25, 100);
    //displays player score on left size of screen
    textSize(30);
    fill(0);
    textAlign(LEFT);
    text("Player score: "+int(playerScore), 50, 30);
    textAlign(RIGHT);
    text("Player Counter: "+int(playerCounter), width-50, 30); //displays player counter on right side of screen
  }
  //allows player to move sideways
  void moveSideways() {
    if (gameIsRunning) {
      pX=pX+pSpeedX*xDirection; 
      //moves left and stores the direction as -1 when the left arrow is pressed
      if (keyCode==LEFT) {
        xDirection=-1;
        //moves right and stores the direction as 1 when the right arrow is pressed
      } else if (keyCode==RIGHT) {
        xDirection=1;
      }
      //makes the player's speed increase at the same speed as everything else until it reaches a certain number, to give the illusion that it's sliding
      if (pSpeedX<=4) {
        pSpeedX=pSpeedX+scrollAccel;
      }
    } else { //if the game is not running, set it to zero. This works as a reset button for the speed
      pSpeedX=0;
    }
  }
  //method for counter
  void counter() {
    playerCounter=playerCounter+counterAmount; //sets the counter to change (increase or decrease) based on what the counterAmount is
    //makes the game be lost when the counter reaches 0
    if (playerCounter<=0||pX+pWidth<0||pX>width) {
      playerCounter=0; //easy way to make counter stop
      living=false;
    }
    //makes the game be won when the counter reaches the original amount
    if (playerCounter>counterValue&&living) {
      gameWon=true;
      playerCounter=counterValue; //easy way to make counter stop
    }
  }
}
