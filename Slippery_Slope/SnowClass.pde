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
    sSpeed=random(0.1, 2);
    sDiam=random(10, 60);
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
    noStroke();
    fill(sColor);
    centeredLine(sDiam, 0, 0, 0, sColor);
    centeredLine(sDiam, 0, 0, 60, sColor);
    centeredLine(sDiam, 0, 0, -60, sColor);
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
