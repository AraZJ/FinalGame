class Snow {
  float sX;
  float sY;
  float sDiam;
  float sSpeed;
  color sColor;
  float initAngle;
  float incAngle;
  float blueColor;
  boolean offscreen;
  Snow() {
    blueColor=random(230, 256);
    sSpeed=random(0.1, 2);
    sDiam=random(10, 60);
    sX=random(0, 900);  
    sY=random(-500, sDiam/2);
    sColor=color(0, blueColor-random(0, blueColor), blueColor);
    initAngle=0;
    incAngle=1;
    offscreen=false;
  }
  void display() {
    pushMatrix();
    translate(sX, sY);
    rotate(radians(initAngle));
    noStroke();
    fill(sColor);
    //something for transparency...maybe a fucntion would be better actually
    //ellipse(sX, sY, sDiam/2, sDiam/2);
    centeredLine(sDiam, 0, 0, 0, sColor);
    centeredLine(sDiam, 0, 0, 60, sColor);
    centeredLine(sDiam, 0, 0, -60, sColor);
    popMatrix();
    initAngle+=incAngle;
    //will be cooler later
  }
  void fall() {
    sY=sY+sSpeed;
    sSpeed=sSpeed+scrollAccel;
    if (sY>=height) {
      offscreen=true;
    }
  }
  void reset() {
    sY=random(-500, sDiam/2);
  }
}
