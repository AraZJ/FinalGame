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
  boolean playerHit;
  float startAngle;
  float incAngle;
  float tempSpeedX; //probably don't need
  long animTimer;
  boolean fallLeft;
  boolean fallRight;
  int treesPassed;
  int [] numOfLives={1, 2, 3, 4, 5};
  Player() {
    treesPassed=0;
    playerHit=false;
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
    fallLeft=false;
    fallRight=false;
  }
  void display() {
    //if (!playerHit) {
    if (!fallLeft&&!fallRight&&!playerHit) {
      //rectMode(CENTER);
      rectMode(CORNER);
      fill(240, 100, 0);
      noStroke();
      rect(pX, pY, pWidth, pHeight);
      //score message: should probably be moved...
    } else if (playerHit) {//(fallLeft||fallRight) {
      //if(
      animTimer=millis();
      fill(240, 100, 0);
      noStroke();
      rect(pX, pY, pWidth, pHeight);
      text("how long is player hit?", width/2, height/2);
      //animTimer=millis();
      //beenHit();
      //if (millis()-animTimer<=3000) { 
       pSpeedX=0;
      //} else if (millis()-animTimer>3000) {
      //if (keyPressed&&key=='g') {
      //  pSpeedX=1; 

      //}
    }
    textSize(30);
    textAlign(LEFT);
    fill(230, 230, 0);
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
    if (pX<=screenLeftEdge){ 
      playerHit=true;
      fallRight=true;
    }
    if (pX+pWidth>=screenRightEdge) {
      playerHit=true;
      fallLeft=true;
    }
    if (!playerHit&&living) {
      pSpeedX=1;
      if (keyCode==LEFT) {
        pX=pX-pSpeedX;
        //if (sidewaysShift>=0){
        //sidewaysShift=sidewaysShift-shiftDecrem;  //this is HILARIOUS! dsidewaysShift=sidewaysShift-0.1; 
        //}
      }
      if (keyCode==RIGHT) {
        pX=pX+pSpeedX;
      }
    } else if (playerHit||!living) {
      pSpeedX=0;
    }
  }
  void Straighten() {
    //if (keyCode==DOWN){
    //  if (sidewaysShift>=0){
    //   sidewaysShift=sidewaysShift-0.1;
    //} else {
    //  sidewaysShift=2;
    //}
    //}
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
    pX=450;
    pY=300;
    living=true;
    playerHit=false;
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
    if (playerHit) { //old decrease health method
      playerHealth=playerHealth-0.00001;
    }
  }
  void levelLengthChecker(){
    
    
  }
  //int decreaseLives() {
  //  for (int l=0; l<numOfLives.length; l++) {
  //    if (numOfLives[l]>0&&playerHit) {
  //      return(numOfLives[l-1]);
  //    } //else if(numOfLives[l]==0 &&playerHit){
  //  }
    
  //}
}
