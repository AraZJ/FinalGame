//player class
class Player {
  PImage skier;
  float pWidth;
  float pHeight;
  float pX;
  float pY;
  float pSpeedX;
  float playerCountdown; //this is the timer for the player when they're hit that shows how long they have left to live
  float playerScore;
  boolean living;
  color pColor;
  boolean slideRight;
  boolean SlideLeft;
  int xDirection; //is used for checking which way the player is moving which is related to the collision method in Tree_Object 
  float countdownAmount; //the amount you count down by once the count down starts
  Player() {
    skier=loadImage("SkierIm.jpg");
    living=true;
    pWidth=30;
    pHeight=90;
    pX=450-pWidth/2;
    pY=300-pHeight; 
    pSpeedX=0;
    playerScore=0;
    playerCountdown=countdownValue;
    xDirection=1;
    pColor=color(0);
    countdownAmount=-0.5;
  }
  void display() {
    //rectMode(CORNER);
    //fill(pColor);
    //noStroke();
    //rect(pX, pY, pWidth, pHeight);
    image(skier,pX,pY,25,100);
    //displays stats
    textSize(30);
    textAlign(LEFT);
    fill(0);
    text("Player score: "+int(playerScore), 50, 30); //displays player score on left size of screen
  }
  //allows player to move sideways
  void moveSideways() {
    if (gameIsRunning) {
      if (keyCode==LEFT&&pX>screenLimit) {
        pX=pX-pSpeedX; 
        xDirection=-1;
      } else if (keyCode==RIGHT&&pX+pWidth<width-screenLimit) {
        pX=pX+pSpeedX;
        xDirection=1;
      } else {
        xDirection=0; //when it's not moving left or right
      }
      //makes the player's speed inscrease at the same speed as everything else until it reaches a certain number
      if(pSpeedX<=4){
      pSpeedX=pSpeedX+scrollAccel;
      }
    } else { //if the game is not running
      pSpeedX=0;
    }
  }
  //method for countdown
  void countdown() {
    if (countdownAmount!=0) {
      fill(0);
      textAlign(RIGHT);
      textSize(30);
      text("Player Count: "+int(playerCountdown), width-50, 30); //displays player countdown on right side of screen
    }
    playerCountdown=playerCountdown+countdownAmount;
    if (playerCountdown<=0) {
      playerCountdown=0;
      living=false;
    }
    if (playerCountdown>countdownValue&&living){
     gameWon=true;
     playerCountdown=countdownValue;
    }
  }
}
