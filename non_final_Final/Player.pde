class Skier {
  float personWidth;
  float personHeight;
  float personX;
  float personY;
  float personSpeed;
  Skier(){
    personWidth=10;
    personHeight=50;
    personX=450;
    personY=300;
    personSpeed=1;
  }
  
  
  
void display(){
  rectMode(CENTER);
  fill(240,100,0);
  rect(personX,personY,personWidth,personHeight);
}
 void move(){
   personY=personY+personSpeed;
   personSpeed=personSpeed+0.01;
 }
}
