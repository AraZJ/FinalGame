//Main
//Has an ArrayList

Player me;
//for game screen one, won't keep forever
Tree tree1= new Tree(600, 45, 1);
Tree tree2= new Tree(320, 45, 1);
int gameScreen=0; //gamescreen value for switch statement
//int spacingValue=200; //the amount of space between trees...Don't really need anymore, though when I make an algorithm for the distances between trees i might
//int slideOver=100;
int numOfTrees=5;
int numOfCoins=3;
float snowFallX=random(900);
float scrollSpeed=0.001;
float snowFallY=0;
ArrayList<Coin> coinList = new ArrayList<Coin>();
ArrayList<Tree> treeList=new ArrayList<Tree>();
ArrayList<Snow> snowflakes=new ArrayList<Snow>();
float letterColor=random(100, 255);
char [] gameName={'T', 'r', 'e', 'a', 'c', 'h', 'e', 'r', 'o', 'u', 's', ' ', 'T', 'u', 'n', 'd', 'r', 'a'}; //why
int numOfSnowflakes=100;
float [] snowFallXs=new float[numOfSnowflakes];


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
    //triangle that makes the ski slope
    fill(255);
    noStroke();
    triangle(0, 0, width, height, 0, height);
    ////triangles that are suppsoed to help with teh illusion that it's 3d
    //triangle(0, 180, 4*width/5, height, 0, height);
    //fill(230,230,250);
    //triangle(0, 150, width-400, height, 0, height);
    fill(0);
    textAlign(CENTER);
    textSize(80);
    //text("Treacherous Tundra", width/2, height/2);
    //for loop for displaying the game name  where each
    for (int n=0; n<gameName.length; n++) { //I hate myself
      fill(letterColor-random(100, letterColor), letterColor-random(20, letterColor), letterColor);
      text(gameName[n], 45+n*45, height/2);
    }
    textSize(40);
    fill(10);
    text("Press space to start game", width/2, height/2+100);
    textSize(30);
    text("Press 't' for tutorial", width/2, height/2+150);
    if(keyPressed&&key==' '){
    gameScreen=2;
    } else if(keyPressed&&key=='t'){
    gameScreen=1;
    }
      for (int s=0; s<numOfSnowflakes; s++) {
    //snowFall(snowFallXs[s]);
    Snow snowClone=snowflakes.get(s);
    snowClone.display();
    snowClone.fall();
  }
    break;
    //tutorial page
    case 1:
    background(255);
    fill(0);
    textSize(30);
    text("Use left and right keys to navigate.", width/2, 100);
    //animation for going left and rihgt, then text saying try it! and once you do for a few seconds (make timer), move on ot the next one
    text("Try to collect coins and avoid trees.", width/2, 300);
    //same thign as oavobe commetn says
    textSize(17);
    text("Note: you only have to press a key once before you start sliding in that direction.", width/2, 500);
    text("press 'r' to return to menu",width/2,height/2+100);
    if(keyPressed&&key=='r'){
    gameScreen=0;
    }
    //maybe an affect of, instead of a timr, o the screen slidng up an theres the rest of teh text
    break;

  case 2: //running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
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
void centeredLine(float lLength, float lCenterX, float lCenterY, float angle, color snowColor) { //, float angle){ //the angle will be 60 because that's how my snowflake will be
  stroke(snowColor);
  strokeWeight(2);
  if (angle==0) {
    line(lCenterX, lCenterY-lLength, lCenterX, lCenterY+lLength);
  } else {
    line(lCenterX-tan(radians(angle))*lLength/2, lCenterY-lLength/2, lCenterX+tan(radians(angle))*lLength/2, lCenterY+lLength/2);
  }
  //println(dist(lCenterX-tan(radians(angle))*lLength/2,lCenterY-lLength/2,lCenterX+tan(radians(angle))*lLength/2,lCenterY+lLength/2));
  //println(dist(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2));
  //vertial line
  //line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
  //horizontal line
  //line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
  //60 degrees rotated line
  //line(lCenterX-lLength/2,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
}
