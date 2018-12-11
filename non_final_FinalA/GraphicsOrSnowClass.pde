class Snow {
  float sX;
  float sY;
  float sDiam;
  float sSpeed;
  Snow() {
    sX=random(0, 900);  
    sY=0;
    sSpeed=random(0.1, 2);
    sDiam=random(10, 40);
  }
  void display() {
    strokeWeight(1);
    fill(255);
    stroke(0);
    //something for transparency...maybe a fucntion would be better actually
    ellipse(sX, sY, sDiam, sDiam);
    strokeWeight(10);
    //line();
    //will be cooler later
  }
  void fall() {
    sY=sY+sSpeed;
    sSpeed=sSpeed+scrollSpeed;
  }
  void rotate() {
    //do I use push and pop or trig? Or both...maybe hteyre comnibed
  }
}
