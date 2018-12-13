void levelOne() { //or do an unpit of the boolean array(?) and each different input gives you a new level
//float screenScrollSpeed; //0 ////important for 
//float scrollAccel=0.001; //0.001 for start
////int xSpacing=200; //the amount of space between trees...Don't really need anymore, though when I make an algorithm for the distances between trees i might
//int ySpacing=200; //height/numOfTrees
//float screenLimit=50; //50 for start
  scrollAccel=0.001;
  screenLimit=50;
specialNumberLimit=levelEnders[0]; //we'll see if this works
//specialNumberLimit=5;
} 
void levelTwo(){
  
}
void adventureTime() {
  scrollAccel=0.0015;
  screenLimit=60;
  specialNumberLimit=10;
}
//if this boolean is true...
//void level(scrollSpeed, etc)
//
int treesPassed(Player thePlayer, Tree aTree) {
  int returnNum=0;
  if (thePlayer.pY==aTree.tY+aTree.tHeight&&!thePlayer.playerHit) {
    textSize(50);
    fill(0);
    textAlign(CENTER);
    returnNum=returnNum+1;
    println("survived a tree!");
  }
  return returnNum;
}


//much easier way to make an upright triangle with the top point, the base and the heiggt as parameters
void upTriangle(float topX, float topY, float base, float triHi) { //has the single point on top
  //I should make it the top, not the center...
  //if width = 10 and height = ten and center = center of screen
  //top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
  //top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
  noStroke();
  triangle(topX, topY, topX+base/2, topY+triHi, topX-base/2, topY+triHi);
}
//time-consuming method for a line rotated 60 degrees-used to make pretty snowflakes
void centeredLine(float lLength, float lCenterX, float lCenterY, float angle, color snowColor) { //, float angle){ //the angle will be 60 because that's how my snowflake will be
  stroke(snowColor);
  strokeWeight(2);
  if (angle==0) {
    line(lCenterX, lCenterY-lLength, lCenterX, lCenterY+lLength);
  } else {
    line(lCenterX-tan(radians(angle))*lLength/2, lCenterY-lLength/2, lCenterX+tan(radians(angle))*lLength/2, lCenterY+lLength/2);
  }
}
void snowStorm(int snowAmount) {
  //numOfSnowflakes=snowAmount;
  for (int s=snowAmount-1; s>0; s--) {
    Snow snowClone=snowflakes.get(s);
    snowClone.display();
    snowClone.fall();
    if (snowClone.offscreen) {
      snowflakes.remove(s);
      snowflakes.add(new Snow());
    }
  }
}
void makeGameOver() {
  if (me.living==false) {
    gameIsRunning=false;
  }
}
void pause() {
  if (me.living&&keyPressed&&key=='p') {
    gameIsRunning=false;
  }
}
//void resetTrees(Tree anyTree) {
//  anyTree.tY=300;
//}
//void resetCoins(Coin anyCoin) {
//}
void restartLevel() { //might not need...
  //might need to connect to which level it is
  me.reset();
}
boolean rectCircCollide(float rx, float ry, float rectW, float rectT, float cx, float cy, float r ) { //thank you sm for this method, Joe
  float rectCenterX = rx +rectW/2;
  float rectCenterY = ry + rectT/2;
  //top &bottom
  if (abs(cx-rectCenterX)<=rectW/2 && abs(cy-rectCenterY)<=rectT/2 + r) {
    return true;
  }
  //left and right
  if (abs(cy-rectCenterY)<=rectT/2 && abs(cx-rectCenterX)<=rectW/2 +r) {
    return true;
  }
  //corners
  if (dist(rx, ry, cx, cy)<=r || dist(rx+rectW, ry, cx, cy)<=r || dist(rx, ry+rectT, cx, cy)<=r || dist(rx+rectW, ry+rectT, cx, cy)<=r) {
    return true;
  }
  return false;
}
//makes a sky behind the player
void makeSky() {
  skyY=skyY-screenScrollSpeed;
  screenScrollSpeed=screenScrollSpeed+scrollAccel;
  if (skyY>=-290) {
    noStroke();
    fill(180,190,200);
    rect(0, skyY, width, 290);
  }
}
//very important code with all the basics to make a running game
void gameRunning() {
  //skyY=skyY-screenScrollSpeed;
  //screenScrollSpeed=screenScrollSpeed+scrollAccel;
  gameIsRunning=true;
  makeGameOver();
  //pause();
  //restarts level
  if (!me.living&&keyPressed&&key=='r') { //might need to move
    restartLevel();
    //me.reset;
  }
  //running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
  //loop to remove old trees
  //make sure to backwards
  background(255); //redraws background
  makeSky();
  //sky at top of the screen at beginning
  //noStroke();
  //if(skyY>=-290){
  //fill(0);
  //rect(0,skyY,width,290);
  //}
  //side rectangles that set the limit of the ski slope
  fill(209, 243, 238);
  rect(0, 0, screenLimit, height);
  rect(width-screenLimit, 0, screenLimit, height);
  //me.playerHit=false;
  //run loops backwards...hopefully it doent effect anything else, otherwise ill have to make separate backwards loops for removing and then a forwards loop for everything else like display and all that...hpefully not
  for (int k=numOfCoins-1; k>=0; k--) {//for (int k=0; k<numOfCoins; k++) {
    Coin coinClone = coinList.get(k);
    if (coinClone.coinY<=-coinClone.coinDiameter/2&&!coinClone.hit) {
      coinClone.offscreen=true;
    }
    if (coinClone.hit||coinClone.offscreen) {
      coinList.remove(k);
      coinClone.coinY=600+coinClone.coinDiameter; //might be doing nothing
      coinList.add(new Coin(650, .8));
    }
    coinClone.scrollUp();
    coinClone.display();
    //coinClone.coinCollide(me);
    coinClone.addToScore(me);
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
      treeList.add(new Tree(random(screenLimit, width-screenLimit), 600, 1));
    }
    if (!treeClone.onscreen&&me.living==true) {
      specialNumber=specialNumber+1;
    }
    println(specialNumber);
    treeClone.display();
    treeClone.scrollUp();
    //treeClone.playerTreeCollide(me);
    playerHitG=treeClone.pTCollideB(me);
    fill(0);
    textSize(30);
    text("hit bool "+playerHitG, 450, 300);
    //println(treesPassed(me, treeClone));
    // treeClone.treesPassed(me);
    //println(treeClone.numOfTreesPassed);
  }
  //this should be in the gamescreens
  me.display();
  //me.playerHasBeenHit();
  me.moveSideways(); //apparently I don't actually need a keypressed...
  me.decreaseHealth();

  //me.beenHit();
  //me.moveDownAuto();
  if (!gameIsRunning&&!me.living) {
    textAlign(CENTER);
    textSize(50);
    fill(150, 0, 0);
    text("Game Over Sucka!", width/2, height/2);
    textSize(40);
    fill(0);
    text("Press 'b' to return to start screen and 'r' to restart level", width/2, height/2+50);
    if (keyPressed&&key=='b') {
      restartLevel();
      gameScreen=0;
    }
  }
  //me.display(); //this should be in the gamescreens..but then agian, maybe not..? depends on my graphics for the menu screen
  //me.moveSideways(); //apparently I don't actually need a keypressed...
} 
