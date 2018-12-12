class Player {
  float pWidth;
  float pHeight;
  float pX;
  float pY;
  float pSpeedX;
  float pSpeedY;
  //float sidewaysShift;
  float shiftDecrem;
  int playerHealth;
  float playerScore;
  boolean living;
  boolean playerHit;
  float startAngle;
  float incAngle;
  float tempSpeedX; //probably don't need
  long animTimer;
  boolean fallLeft;
  boolean fallRight;
  Player() {
    playerHit=false;
    living=true;
    pWidth=25;
    pHeight=100;
    pX=450; //important
    pY=300; 
    pSpeedY=1;
    pSpeedX=1;
    shiftDecrem=0.01;
    playerScore=0;
    startAngle=0;
    incAngle=10;
    playerHealth=5;
    fallLeft=false;
    fallRight=false;
  }
  void display() {
    //if (!playerHit) {
    if (!fallLeft&&!fallRight&&!playerHit) {
      rectMode(CENTER);
      fill(240, 100, 0);
      noStroke();
      rect(pX, pY, pWidth, pHeight);
      //score message: should probably be moved...
    } else if (playerHit) {//(fallLeft||fallRight) {
      
      rectMode(CENTER);
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
    fill(0);
    textSize(30);
    textAlign(LEFT);
    text("Player score: "+int(playerScore), 0, 30);
    textAlign(RIGHT);
    text("Player health: "+int(playerHealth), 900, 30); //maybe say the amount you add is the ammountof seconds spent with hit being true divided by itself
    //text(int(playerScore), 0,0);
  }
  void moveSideways() {
    if (pX<=screenLeftEdge||pX>=screenRightEdge) {
      playerHit=true;
    }
    if (!playerHit) {
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
    } else if (playerHit) {
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
    rectMode(CENTER);
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
  void decreaseHealth() {
    if (playerHit) {
      playerHealth=playerHealth-1;
    }
  }
}
