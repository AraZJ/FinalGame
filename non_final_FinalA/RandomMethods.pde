void levels() {
  if (!levelsWon[0]) {
    levelOne("Level 1", 5, 5, 50);
  } else {
    text("beeeeech you won!!!", 450, 300);
    text("press space to go to the next level", 450, 400);
    if (keyPressed&&key==' ') {      
      if (levelsWon[0]) {
        levelTwo();
      }
    }
  }
} //levels end
////values that differ from level to level
//String levelMessage
//specialNumberLimit
//accelLimit
//screenLimit


void levelOne(String message, int levelLengthLim, float speedLim, float screenLim) { //or do an unpit of the boolean array(?) and each different input gives you a new level
  levelMessage=message;
  specialNumber=levelLengthLim;
  screenLimit=screenLim;
  accelLimit=speedLim;
  //if (specialNumber>=levelLengthLim) {
  //  println("level ended"+levelLengthLim+"="+specialNumber);
  //  gameIsRunning=false;
  //  levelsWon[0]=true;
  //}
  //text(
  //specialNumberLimit=levelEnders[0]; //we'll see if this works
}
void levelTwo() {
  levelMessage="Level 2";
  screenLimit=60;
  accelLimit=6.5;
  specialNumberLimit=10;
}
//void adventureTime() {
// // scrollAccel=0.001;
// accelLimit=7.2;
//  screenLimit=100;
//  //specialNumberLimit=5;
//}
//if this boolean is true...
//void level(scrollSpeed, etc)
//
//int treesPassed(Player thePlayer, Tree aTree) {
//  int returnNum=0;
//  if (thePlayer.pY==aTree.tY+aTree.tHeight&&!thePlayer.playerHit) {
//    textSize(50);
//    fill(0);
//    textAlign(CENTER);
//    returnNum=returnNum+1;
//    println("survived a tree!");
//  }
//  return returnNum;
//}


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
//void makeGameOver() {
//  if (me.living==false) {
//    gameIsRunning=false;
//  }
//}
//void pause() {
//  if (me.living&&keyPressed&&key=='p') {
//    gameIsRunning=false;
//  }
//}
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
    fill(180, 190, 200);
    rect(0, skyY, width, 290);
  }
}
void controlSpeed() {
  if (screenScrollSpeed>=accelLimit) {
    screenScrollSpeed=accelLimit;
    scrollAccel=0;
  }
  screenScrollSpeed=screenScrollSpeed+scrollAccel;
}
