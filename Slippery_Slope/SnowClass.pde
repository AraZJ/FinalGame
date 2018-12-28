//snow class
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
    sSpeed=random(0.3, 2);
    sDiam=random(20, 120);
    sX=random(0, 900);  
    sY=random(-500, sDiam/2);
    sColor=color(0, blueColor-random(0, blueColor), blueColor);
    initAngle=0;
    incAngle=1;
    offscreen=false;
  }
  //rotates the snowflakes (which are just 3 lines) clockwise 
  void display() {
    pushMatrix();
    translate(sX, sY);
    rotate(radians(initAngle));
    stroke(sColor);
    centeredLine(sDiam, 0, 0, true);
    centeredLine(sDiam/4, 0, 0-sDiam*3/8, false);
    centeredLine(sDiam/4, 0, 0+sDiam*3/8, false);
    centeredLine(sDiam/4, 0, 0-sDiam/4, false);
    centeredLine(sDiam/4, 0, 0+sDiam/4, false);
    rotate(radians(60));
    centeredLine(sDiam, 0, 0, true);
    centeredLine(sDiam/4, 0, 0-sDiam*3/8, false);
    centeredLine(sDiam/4, 0, 0+sDiam*3/8, false);
    centeredLine(sDiam/4, 0, 0-sDiam/4, false);
    centeredLine(sDiam/4, 0, 0+sDiam/4, false);
    rotate(radians(60));
    centeredLine(sDiam, 0, 0, true);
    centeredLine(sDiam/4, 0, 0-sDiam*3/8, false);
    centeredLine(sDiam/4, 0, 0+sDiam*3/8, false);
    centeredLine(sDiam/4, 0, 0-sDiam/4, false);
    centeredLine(sDiam/4, 0, 0+sDiam/4, false);
    popMatrix();
    initAngle+=incAngle;
  }
  //makes the snowflakes fall
  void fall() {
    sY=sY+sSpeed;
    sSpeed=sSpeed+scrollAccel;
    if (sY-sDiam/2>height) {
      offscreen=true;
    }
  }
}
