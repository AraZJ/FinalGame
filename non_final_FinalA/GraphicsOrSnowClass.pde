class Snow{
  float sX;
  float sY;
  float sDiam;
  float sSpeed;
  Snow(){
  sX=random(0,900);  
  sY=0;
  sSpeed=1;
  sDiam=10;
  }
  void display(){
    fill(255);
    //something for transparency...maybe a fucntion would be better actually
  ellipse(sX,sY,sDiam,sDiam);
  }
 void fall(){
  sY=sY+sSpeed; 
   
 }
}
