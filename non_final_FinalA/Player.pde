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
  Player() {
    living=true;
    pWidth=25;
    pHeight=100;
    pX=450; //important
    pY=100; 
    pSpeedY=1;
    pSpeedX=1;
    shiftDecrem=0.01;
    playerScore=0;
  }



  void display() {
    rectMode(CENTER);
    fill(240, 100, 0);
    noStroke();
    rect(pX, pY, pWidth, pHeight);
    fill(0);
    textSize(30);
    //textAlign(CENTER);
    text("Player score: "+int(playerScore), 0, 30);
    //text(int(playerScore), 0,0);
  }
  void moveSideways() {
    if (keyCode==LEFT) {
      pX=pX-pSpeedX;
      //if (sidewaysShift>=0){
      //sidewaysShift=sidewaysShift-shiftDecrem;  //this is HILARIOUS! dsidewaysShift=sidewaysShift-0.1; 
      //}
    }
    if (keyCode==RIGHT) {
      pX=pX+pSpeedX;
    }
  }
  void stop() {
    pSpeedX=0;
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
  void moveDownAuto() { //I don't need this unless I die really
    pY=pY+pSpeedY;
    pSpeedY=pSpeedY+0.01;
    if (pY>=600-pHeight/2) {
      pSpeedY=0;
      textAlign(LEFT);
      textSize(50);
      text("you have reached the bottom!", 0, height/2);
    }
  }
  void moveDownManual() {
    if (keyCode==DOWN) {
      pY=pY+pSpeedY;
    }
    if (keyCode==UP) {
      pY=pY-pSpeedY;
    }
  }
  void collision() {
  }
}
