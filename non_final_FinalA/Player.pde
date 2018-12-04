class Skier {
  float personWidth;
  float personHeight;
  float personX;
  float personY;
  float personSpeed;
  float sidewaysShift;
  float shiftDecrem;
  Skier() {
    personWidth=25;
    personHeight=100;
    personX=450; //important
    personY=300; 
    personSpeed=1;
    sidewaysShift=2;
    shiftDecrem=0.01;
  }



  void display() {
    rectMode(CENTER);
    fill(240, 100, 0);
    rect(personX, personY, personWidth, personHeight);
  }
  void moveSideways() {
    if (key=='a') {
      personX=personX-sidewaysShift;
      //if (sidewaysShift>=0){
      //sidewaysShift=sidewaysShift-shiftDecrem;  //this is HILARIOUS! dsidewaysShift=sidewaysShift-0.1; 
      //}
    }
    if (key=='d') {
      personX=personX+sidewaysShift;
    }
  }
  void moveDown() { //I don't need this unless I die really
    personY=personY+personSpeed;
    personSpeed=personSpeed+0.01;
  }
  void collision() {
  }
}
