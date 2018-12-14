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
    //text(int(playerScore), 0,0);
    //strokeWeight(5);
    //stroke(0, 0, 255);
    //point(pX, pY);
    //point(pX+pWidth, pY);
    //point(pX, pY+pHeight);
    //point(pX+pWidth, pY+pHeight);
  }
  void moveSideways() {
    if (gameIsRunning) { //p2.pX<=screenLimit||p2.pX+p2.pWidth>=screenRightEdge-screenLimit //!playerHitG&&living&&
      pSpeedX=1;
      if (keyCode==LEFT&&pX>screenLimit&&!playerHitL){//||!playerHitG) {
        pX=pX*xDirection-pSpeedX; //*xDirection
        //if (sidewaysShift>=0){
        //sidewaysShift=sidewaysShift-shiftDecrem;  //this is HILARIOUS! dsidewaysShift=sidewaysShift-0.1; 
        //}
      }
      if (keyCode==RIGHT&&pX+pWidth<screenRightEdge-screenLimit&&!playerHitL) {
        pX=pX*xDirection+pSpeedX;
      }
    } else {
      pSpeedX=0;
    }

    //} else 
    //if (playerHit){
    //if(fallLeft){
    //pSpeedX=1;
    //} else if(fallRight){
    // pSpeedX=-1; 
    //} else{
    //pSpeedX=0;
    //println("else");
    //}

    //if (fallLeft) {
    //  println("should fall left");
    //  float tempXL=pX;
    //  pSpeedX=1;
    //  if (pX>=tempXL+20) {
    //    pSpeedX=1;
    //  }
    //} else if (fallLeft) {
    //  println("should fall right");
    //  float tempXR=pX;
    //  pSpeedX=-1;
    //  if (pX<=tempXR-20) {
    //    pSpeedX=-1;
    //  }
    ////} 
    //}else if (!living) {
    //  pSpeedX=0;
    //}

    //println(playerHit);
  }
  void playerHasBeenHit() {
    //if (playerHitG){

    //}
    //  //        if (pX<=screenLimit) { 
    //  //  playerHit=true;
    //  //  //fallRight=true;
    //  //}
    //  //if (pX+pWidth>=screenRightEdge-screenLimit) {
    //  //  playerHit=true;
    //  //  //fallLeft=true;
    //  //} 
    //  if(playerHit){
    //    pSpeedX=0;
    //    println("has been hit");
    //  }
    //  println(playerHit);
  }
  //void moveDownAuto() { //I don't need this unless I die really
  //  pY=pY+pSpeedY;
  //  pSpeedY=pSpeedY+scrollSpeed;
  //  if (pY>=600-pHeight/2) {
  //    pSpeedY=0;
  //    textAlign(LEFT);
  //    textSize(50);
  //    text("you have reached the bottom!", 0, height/2);
  //  }
  //}
  void moveDownManual() {
    if (keyCode==DOWN) {
      pY=pY+pSpeedY;
    }
    if (keyCode==UP) {
      pY=pY-pSpeedY;
    }
  }
  void beenHit() { //should be in an "if tree.collision==true statement"

    //if (playerHit) {
    //pX=pX*-1;
    startAngle-=incAngle; 
    if (startAngle<=-90) {
      incAngle=0;
      startAngle=0;
    }
    pushMatrix();
    translate((pX+50), pY);
    //rotate(radians(startAngle));
    //rectMode(CENTER);
    fill(240, 100, 0);
    noStroke();
    rect(0, 0, pWidth, pHeight);
    popMatrix();
    //pushMatrix();
    //translate(pX, pY);
    //rotate(radians(startAngle));
    //rectMode(CENTER);
    //fill(240, 100, 0);
    //noStroke();
    //rect(0, 0, pWidth, pHeight);
    //popMatrix();
    ////if(startAngle>=radians(180)){
    //startAngle=0;
    ////}
    //playerHealth-=1;
    //}
  }
  void diagonalSlide() {
  }
  void reset() {
    playerHealth=5;
    playerScore=0;
    pX=450-pWidth/2;
    pY=300-pHeight;
    living=true;
    //playerHit=false;
  }
  //int decreaseHealthNum() {
  //  for (int p=0; p<100; p++) {
  //    if (playerScore==(p+1)*10) {
  //      return 1;
  //    }
  //  }
  //  if (playerHit) {
  //    return -1;
  //  } else {
  //    return 0;
  //  }
  //  //if (playerHealth<=0) {
  //  //  living=false;
  //  //}
  //}
  void decreaseHealth() {
    //float tempHealth=playerHealth;
    if (playerHitG||playerHitL) { //old decrease health method
      playerHealth=playerHealth-0.00001;
    }
  }
  void levelLengthChecker() {
  }
  //int decreaseLives() {
  //  for (int l=0; l<numOfLives.length; l++) {
  //    if (numOfLives[l]>0&&playerHit) {
  //      return(numOfLives[l-1]);
  //    } //else if(numOfLives[l]==0 &&playerHit){
  //  }

  //}
}
