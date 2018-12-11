//Main
//Has an ArrayList

Player me;
//for game screen one, won't keep forever
Tree tree1= new Tree(600, 45, 1);
Tree tree2= new Tree(320, 45, 1);
Coin coin1=new Coin(50, 1);
int gameScreen=0; //gamescreen value for switch statement
//int spacingValue=200; //the amount of space between trees...Don't really need anymore, though when I make an algorithm for the distances between trees i might
int slideOver=100;
int numOfTrees=5;
int numOfCoins=3;
float snowFallX=random(900);
float scrollSpeed=0.001;
float snowFallY=0;
ArrayList<Coin> coinList = new ArrayList<Coin>();
ArrayList<Tree> treeList=new ArrayList<Tree>();
ArrayList<Snow> snowflakes=new ArrayList<Snow>();
int numOfSnowflakes=10;
float [] snowFallXs=new float[numOfSnowflakes];
float snowXMeth=450;
float snowYMeth=300;

void setup() {
  size(900, 600);
  background(255);
  me = new Player();
  for (int s=0; s<numOfSnowflakes; s++) {
    //snowFallXs[s]=random(900); 
    snowflakes.add(new Snow());
  }
  for (int r=0; r<numOfTrees; r++) { 
    treeList.add(new Tree(random(20, 880), random(100, 300), 1.5)); //r*spacingValue+slideOver
  }
  for (int r=0; r<numOfCoins; r++) { 
    coinList.add(new Coin(random(25, 600-25), 0.8)); //r*spacingValue+slideOver //now can I use the local Coin varuables for this part? doesn't seem like it...
  }
}

void draw() {
  switch(gameScreen) {

  case 0: //menu
    background(0, 180, 230);
    fill(255);
    noStroke();
    triangle(0, 0, width, height, 0, height);
    fill(0);
    textAlign(CENTER);
    textSize(100);
    text("Name of Game!", width/2, height/2);
    tree1.display();
    tree1.treeCollide(me);
    tree2.display();
    tree2.treeCollide(me);
    me.display(); //this should be in the gamescreens
    me.Straighten();
    if (key=='s'||tree2.treeCollision||tree1.treeCollision) {
      me.stop();
    }
    me.moveSideways();
    coin1.display();
    coin1.coinCollide(me);
    //apparently I don't actually need a keypressed...
    me.moveDownManual();
    //loop for snowflakes
    for (int s=0; s<numOfSnowflakes; s++) {
      //snowFall(snowFallXs[s]);
      Snow snowClone=snowflakes.get(s);
      snowClone.display();
      snowClone.fall();
    }
    centeredLine(50,450,300,0);
    break;

  case 1: //running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
    //loop to remove old trees
    //make sure to backwards
    background(255);
    //run loops backwards...hopefully it doent effect anything else, otherwise ill have to make separate backwards loops for removing and then a forwards loop for everything else like display and all that...hpefully not
    for (int k=numOfCoins-1; k>=0; k--) {//for (int k=0; k<numOfCoins; k++) {
      Coin coinClone = coinList.get(k);
      if (coinClone.coinY<=-coinClone.coinDiameter/2&&!coinClone.hit) {
        coinClone.offscreen=true;
      }
      if (coinClone.hit||coinClone.offscreen) {
        coinList.remove(k);
        coinClone.coinY=600+coinClone.coinDiameter;
        coinList.add(new Coin(650, .8));
      }
      coinClone.scrollUp();
      coinClone.display();
      coinClone.coinCollide(me);
      coinClone.addToScore();
    }
    // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int t=numOfTrees-1; t>=0; t--) {//for (int e=0; e<numOfTrees; e++) { //for loop for rows
      Tree treeClone = treeList.get(t);
      if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
        treeClone.onscreen=false;
        //treeClone.tY=600;
      }
      if (!treeClone.onscreen) {
        //println("offscreen!");
        treeList.remove(t); 
        treeList.add(new Tree(random(20, 880), 600, 1.5));
      }
      treeClone.display();
      treeClone.scrollUp();
      treeClone.treeCollide(me);
    }
    me.display(); //this should be in the gamescreens
    me.moveSideways(); //apparently I don't actually need a keypressed...
    me.Straighten();
    me.moveDownManual();
    //me.moveDownAuto();
  } 
  //me.display(); //this should be in the gamescreens..but then agian, maybe not..? depends on my graphics for the menu screen
  //me.moveSideways(); //apparently I don't actually need a keypressed...
}
void keyPressed() {
  //me.moveSideways();
}
void upTriangle(float topX, float topY, float base, float triHi) { //has the single point on top
  //I should make it the top, not the center...
  //if width = 10 and height = ten and center = center of screen
  //top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
  //top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
  triangle(topX, topY, topX+base/2, topY+triHi, topX-base/2, topY+triHi);
}
//void snowFall(float x) {
//  noStroke();
//  fill(255);
//  ellipse(x, snowFallY, 30, 30); //cant remember how to fix this probelm...
//  snowFallY=snowFallY+0.1;
//}
void centeredLine(float lLength, float lCenterX, float lCenterY, float angle){ //, float angle){ //the angle will be 60 because that's how my snowflake will be
 stroke(0);
 strokeWeight(5);
 line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
 //vertial line
  //line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
  //horizontal line
  //line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
  //60 degrees rotated line
  //line(lCenterX-lLength/2,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
}
//void rotatedLine(){
//// pushMatrix();
// centeredLine(20,snowXMeth,snowYMeth);
//// popMatrix();
  
//}
