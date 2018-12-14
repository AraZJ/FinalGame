//player class
class Player {
  float pWidth;
  float pHeight;
  float pX;
  float pY;
  float pSpeedX;
  float pSpeedY;
  //float sidewaysShift;
  float shiftDecrem;
  float playerHealth;
  float playerScore;
  boolean living;
  boolean playerHitL;
  float startAngle;
  float incAngle;
  float tempSpeedX; //probably don't need
  long animTimer;
  boolean leftCol;
  boolean rightCol;
  boolean topCol;
  color pColor;
  int xDirection;
  int treesPassed;
  int [] numOfLives={1, 2, 3, 4, 5};
  boolean loseHealth;
  float healthNumber=0;
  Player() {
    treesPassed=0;
    playerHitL=false;
    living=true;
    pWidth=25;
    pHeight=100;
    pX=450-pWidth/2; //important
    pY=300-pHeight; 
    pSpeedY=1;
    pSpeedX=1;
    shiftDecrem=0.01;
    playerScore=0;
    startAngle=0;
    incAngle=10;
    playerHealth=5.0;
    leftCol=false;
    rightCol=false;
    topCol=false;
    xDirection=1;
    pColor=color(240, 100, 0);
    loseHealth=false;
  }
  void display() {
    rectMode(CORNER);
    fill(pColor);
    noStroke();
    rect(pX, pY, pWidth, pHeight);
    textSize(30);
    textAlign(LEFT);
    fill(0); //230, 230, 0
    text("Player score: "+int(playerScore), screenLimit, 30); //displays player score on left size of screen
    textAlign(RIGHT);
    text("Player health: "+int(playerHealth), width-screenLimit, 30); //displays player health on right side of screen //maybe say the amount you add is the ammountof seconds spent with hit being true divided by itself
  }
  void moveSideways() {
    if (gameIsRunning) { //p2.pX<=screenLimit||p2.pX+p2.pWidth>=screenRightEdge-screenLimit //!playerHitG&&living&&
      pSpeedX=1;
      if (keyCode==LEFT&&pX>screenLimit) {//||!playerHitG) {&&!playerHitL
        pX=pX-pSpeedX; //*xDirection
        xDirection=-1;
        //if (sidewaysShift>=0){
        //sidewaysShift=sidewaysShift-shiftDecrem;  //this is HILARIOUS! dsidewaysShift=sidewaysShift-0.1; 
        //}
      } else if (keyCode==RIGHT&&pX+pWidth<screenRightEdge-screenLimit) { //&&!playerHitL
        pX=pX+pSpeedX;
        xDirection=1;
      } else {
        xDirection=0;
      }
    } else { //if the game is not running
      pSpeedX=0;
    }
  }
  //method I used when testing out tree and player collision
  void moveDownManual() {
    if (keyCode==DOWN) {
      pY=pY+pSpeedY;
    }
    if (keyCode==UP) {
      pY=pY-pSpeedY;
    }
  }
  void reset() {
    playerHealth=5;
    playerScore=0;
    pX=450-pWidth/2;
    pY=300-pHeight;
    living=true;
    //playerHit=false;
  }
  void decreaseHealth() {
    if (healthNumber==1) { //old decrease health method
      playerHealth=playerHealth-healthNumber;
    }
    if(playerHealth<=0){
      playerHealth=0;
      living=false;
    }
  }
}
