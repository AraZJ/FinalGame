////this keeps trees in the sam eposition but wrPS EM AROUND, WIHTOTU REMOVING
//if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
//        treeClone.tY=600;
//      }
////
//fill(255, 0, 0);
//textSize(50);
//text("collision!", 0, height/2);

//if statements that make every other row of trees 30 to the left
//if (r%2==0 && c%2==0) {//runs if r is even
//  treeTranslation = -30;
//} else if (r%2!=0 && c%2!=0) { //runs if r is odd
//  treeTranslation=0;
//}
//Tree tree1;
//tree1=new Tree(width/2,height/2,10,110);
//tree1.display();
//tree1.scrollDown();
//tree1.treeSpeed=1;
//upTriangleOld(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //whole tree leaves
//    upTriangleOld(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //middle tree leaves
//    upTriangleOld(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //top tree leaves

//void displayOld() { //old display method
//  rectMode(CENTER);

//  //tree trunk
//  stroke(102, 51, 0);
//  strokeWeight(5);
//  fill(102, 51, 0);
//  rect(treePosX, treePosY+treeHeight, treeWidth/8, 20);

//  //tree top of first tree
//  strokeWeight(2);
//  noStroke();
//  fill(treeColor);
//  //fill(0, random(40, 215), 0); //color of tree leaves
//  //treePos- X and Y is the top, treePosX-20, treePosY+treeHeight*something is the left bottom and treePosX+20, treePosY+treeHeight*something is the irght bottom
//  //the width of the base is 40, the height is treeHeight (duh!), the middle is treeHeight/2+treeY
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight, treePosX+20, treePosY+treeHeight); //bottom of tree leaves
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.75, treePosX+20, treePosY+treeHeight*0.75); //middle of tree leaves
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.5, treePosX+20, treePosY+treeHeight*0.5);  //top of tree leaves

//  println(treeHeight/2+treePosY);
//}
//  void upTriangleOld(float triCenterX, float triCenterY, float triBase, float triHeight) { //has the single point on top
////I should make it the top, not the center...
//  //if width = 10 and height = ten and center = center of screen
//  //top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
//  //top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
//  triangle(triCenterX, triCenterY-triHeight/2, triCenterX+triBase/2, triCenterY+triHeight/2, triCenterX-triBase/2, triCenterY+triHeight/2);
//}
//Tree[] [] treez = new Tree[columns][rows]; //I thnk it should actual;y be rows columns...
//Tree[] treez = new Tree[rows];
//ArrayList<Tree> innerTreeList; //this is my arraylist of an arraylist
//ArrayList<innerTreeList> outerTreeList;
//ArrayList<ArrayList<Tree>> treeList; //My attempt //you dont actually NEED list, ya dingus!
// treeList=new ArrayList<ArrayList<Tree>>();
//grid of trees
//nested for loops for initializing two dimensional array of trees 
//for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
// for (int r=0; r<2; r++) { //for loop for rows that's not actually for rows 
//treez [c][r] = new Tree(r*200+spacingValue, c*100, 10, 110); //sets for loops to run treez array ////old, fixed array
//treez [r] = new Tree(r*spacingValue+slideOver, 100, 40, 110); //sets for loops to run treez array ////old, fixed array
// treeList.add(new Tree(r*spacingValue+slideOver, r*100, 40, 110));
// treeList.add(new Tree(r*spacingValue+slideOver, 100, 40, 110));
//}
// }
//  treeClone.scrollUp();
//treez[c][r].display(); //sets for loops to display treez array
//treez[c][r].scrollDown();

//treez[r].display(); //sets for loops to display treez array
//treez[r].scrollUp();

//if (treez[r].treePosY<0) {
//  treez[r].reWrap();
//}
//if (key=='p') {
//  treez[r].pause();
//} else if (keyPressed&&key!='p') { //this is a bit strange but it works for now...it just messes up the speed
//  treez[r].scrollUp();
//} //'r' for loop end
// }
// }
//upTriangle(width/2,height/2,20,100);
//println(treez.length);
//    void displayOld() { //old display method
//  rectMode(CENTER);
//  //tree top of first tree
//  strokeWeight(2);
//  noStroke();
//  fill(treeColor);
//  //fill(0, random(40, 215), 0); //color of tree leaves
//  //treePos- X and Y is the top, treePosX-20, treePosY+treeHeight*something is the left bottom and treePosX+20, treePosY+treeHeight*something is the irght bottom
//  //the width of the base is 40, the height is treeHeight (duh!), the middle is treeHeight/2+treeY
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight, treePosX+20, treePosY+treeHeight); //bottom of tree leaves
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.75, treePosX+20, treePosY+treeHeight*0.75); //middle of tree leaves
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.5, treePosX+20, treePosY+treeHeight*0.5);  //top of tree leaves
//    //tree trunk
//  stroke(102, 51, 0);
//  strokeWeight(5);
//  fill(102, 51, 0);
//  rect(treePosX, treePosY+treeHeight, treeWidth/8, 20);
//}
//maybe if, when hitting the tree head on, I make it not collide until you reach almost the base of the tree would be more 3-d...
//if the left part of the player hits the right of a tree

//if (thePlayer.pX-thePlayer.pWidth/2<=tX+tWidth/2 && thePlayer.pX-thePlayer.pWidth/2>=tX-tWidth/2) {//player left side collision   //(tX+tWidth/2>=thePlayer.pX-thePlayer.pWidth/2&&){ //||tX-tWidth/2>=thePlayer.pX+thePlayer.pWidth/2) {
//  //println("collision!");
//  collision=true;
//  background(255, 0, 0);
//} 
////thePlayer.pX+thePlayer.pWidth/2<=tX+tWidth/2 &&thePlayer.pX+thePlayer.pWidth/2>=tX-tWidth/2
//if (thePlayer.pX+thePlayer.pWidth/2<=tX+tWidth/2 &&thePlayer.pX+thePlayer.pWidth/2>=tX-tWidth/2) { //player right side
//  //println("collision!");
//  collision=true;
//  background(255, 0, 0);
//} 


//if (thePlayer.pX-thePlayer.pWidth/2<=tX+tWidth/2||thePlayer.pX+thePlayer.pWidth/2<=tX-tWidth/2) {
//  println("collision!");
//  collision=true;
//}
//right side of player on left
//might need to make a loop that makes sure the trees are between all the other trees before they can be compared witht eh others
//if (thePlayer.pX+thePlayer.pWidth/2<=tX-tWidth/2) {
//  println("right side player collision");
//  collision=true;
//}


////code that used to be in case 1, for graphics
//tree1.display();
//tree1.treeCollide(me);
//tree2.display();
//tree2.treeCollide(me);
//me.display(); //this should be in the gamescreens
//me.Straighten();
//if (key=='s'||tree2.treeCollision||tree1.treeCollision) {
//  me.stop();
//}
//me.moveSideways();
////apparently I don't actually need a keypressed...
//me.moveDownManual();
////loop for snowflakes
//for (int s=0; s<numOfSnowflakes; s++) {
//  //snowFall(snowFallXs[s]);
//  Snow snowClone=snowflakes.get(s);
//  snowClone.display();
//  snowClone.fall();
//}
////
//centeredLine(50, 450, 300, -60, color(200));
//centeredLine(50, 450, 300, 0, color(200));
//centeredLine(50, 450, 300, 60, color(200));
//centeredLine(50, 450, 300, -60, color(200));
////
////aniamtion for eing hit
//fill(255,0,0);
//animTimer=millis();
//startAngle-=incAngle; 
//if(startAngle<=-90){
//incAngle=0;
//startAngle=0;
//}
//pushMatrix();
//translate((pX+50), pY);
////rotate(radians(startAngle));
//rectMode(CENTER);
//fill(240, 100, 0);
//noStroke();
//rect(0, 0, pWidth, pHeight);
//animTimer=millis();
//if (millis()-animTimer<=3000) {
//  stopMoving();
//} else {
//  moveSideways();
//}
//popMatrix();
//if(startAngle>=radians(180)){
////
////used to be in line method\
//println(dist(lCenterX-tan(radians(angle))*lLength/2,lCenterY-lLength/2,lCenterX+tan(radians(angle))*lLength/2,lCenterY+lLength/2));
//println(dist(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2));
//vertial line
//line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
//horizontal line
//line(lCenterX,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
//60 degrees rotated line
//line(lCenterX-lLength/2,lCenterY-lLength/2,lCenterX,lCenterY+lLength/2);
////
////snow fll method that's a failuuuure
//snowFall(snowFallXs[s]);
//void snowFall(float x) {
//  noStroke();
//  fill(255);
//  ellipse(x, snowFallY, 30, 30); //cant remember how to fix this probelm...
//  snowFallY=snowFallY+0.1;
//}
////
//strokeWeight(5);
//stroke(0,0,255);
//point(topX,topY);
//point(topX+base/2, topY+triHi);
//point(topX-base/2, topY+triHi);
////old shity collide emthod that made me hate myself
//player top and sides
//if (p2.pY-p2.pHeight/2<=tY+tHeight && p2.pY-p2.pHeight/2>=tY && p2.pX-p2.pWidth/2<=tX+tWidth/2 && p2.pX+p2.pWidth/2>=tX-tWidth/2) {
//  treeCollision=true;
//  p2.playerHit=true;
//}
////player bottom and sides
//if (p2.pY+p2.pHeight/2>=tY && p2.pY+p2.pHeight/2<=tY+tHeight && p2.pX-p2.pWidth/2<=tX+tWidth/2 && p2.pX+p2.pWidth/2>=tX-tWidth/2) {
//  treeCollision=true;
//  p2.playerHit=true;
//}
//player left and stuff 
//if (p2.pX+p2.pWidth/2>= &&p2.pX+p2.pWidth/2<=){

//}
////
///attempts at really crazy stuuf
//int treesPassed(Player thePlayer, ArrayList<Tree> someArrayList){
//  for(int t=0; t<numOfTrees; t++){
//    Tree otherTree=someArrayList.get(t);
//  if(thePlayer.pY==otherTree.tY+otherTree.tHeight&&!thePlayer.playerHit){
//      textSize(50);
//      fill(0);
//      textAlign(CENTER);
//      numOfTreesPassed=numOfTreesPassed+1;
//      println("survived a tree!");
//      return numOfTreesPassed;
//  } else{
//   return 0;  
//  }
//    }

//}
//if(thePlayer.pY==tY+tHeight&&!p3.playerHit){
//    textSize(50);
//    fill(0);
//    textAlign(CENTER);
//    numOfTreesPassed=numOfTreesPassed+1;
//    println("survived a tree!");
//    return numOfTreesPassed;
////
////
//void coinCollide(Player p1) { //maybe this should be called "collide" 
////float rx, float ry, float rectW, float rectT, float cx, float cy, float r 
//hit=rectCircCollide(p1.pX,p1.pY,p1.pWidth,p1.pHeight,coinX,coinY,coinDiameter/2);
//  //top corners
////  if (dist(player2.pX-player2.pWidth/2, player2.pY-player2.pHeight/2, coinX, coinY)<=coinDiameter/2||dist(player2.pX+player2.pWidth/2, player2.pY-player2.pHeight/2, coinX, coinY)<=coinDiameter/2) {
////    hit=true;
////    //fill(255, 255, 0);
////    //textSize(50);
////    //text("collision!", 300, height/2);
////  }
////  //bottom corners
////  if (dist(player2.pX-player2.pWidth/2, player2.pY+player2.pHeight/2, coinX, coinY)<=coinDiameter/2||dist(player2.pX+player2.pWidth/2, player2.pY+player2.pHeight/2, coinX, coinY)<=coinDiameter/2) {
////    hit=true;
////    //fill(255, 255, 0);
////    //textSize(50);
////    //text("collision!", 300, height/2);
////  }
////  if (player2.pY-player2.pHeight/2<=coinY+coinDiameter/2 && player2.pY-player2.pHeight/2>=coinY-coinDiameter/2 && player2.pX-player2.pWidth/2<=coinX+coinDiameter/2 && player2.pX+player2.pWidth/2>=coinX-coinDiameter/2) {
////    hit=true; 
////    //fill(255, 255, 0);
////    //textSize(50);
////    //text("collision!", 300, height/2);
////  }
////  if (player2.pY+player2.pHeight/2>=coinY-coinDiameter/2 && player2.pY+player2.pHeight/2<=coinY+coinDiameter/2 && player2.pX-player2.pWidth/2<=coinX+coinDiameter/2 && player2.pX+player2.pWidth/2>=coinX-coinDiameter/2) {
////    hit=true;
////    //fill(255, 255, 0);
////    //textSize(50);
////    //text("collision!", 300, height/2);
////  }
//}
//// stuff for fall ;eft and right in collide method
//if (p2.pX+p2.pWidth&&p2.playerHit){ //this was for if it hits from the top, but I don't think it's really important
//} else 
//if (p2.pX<=tX&&p2.playerHit) { //this sets fall Left to true if the paler's right side hits the tree (it's for the falling animation). If it collides when it's exactly in the middle, it will go left also
//  p2.fallLeft=true;
//  //println("fallLeft is true!");
//} else if (p2.pX+p2.pWidth>tX&&p2.playerHit) { //this sets fallRight to true if the paler's left side hits the tree
//  p2.fallRight=true;
//  println("fallRigtht is true!");
//}
////old tree passed void from tree class
//void treesPassed(Player p3){
//  int returnNum=0;
//  if(p3.pY==tY+tHeight+20&&!p3.playerHit){
//    returnNum=returnNum+1;
//    numOfTreesPassedG=returnNum;
//  } 

//}
////old collide method
// void playerTreeCollide(Player p2) { //I wonder if I need to make the paleyr in input like in my flappy bird game...we'll see
//// println(p2.playerHit);
//   if (p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<=tX+tWidth/2&&p2.pY+p2.pHeight>=tY&&p2.pY<=tY+tHeight) {
//     //treeCollision=true;
//     p2.playerHit=true;
//     //println("player hit!");
//   } else if(p2.pX<=screenLimit||p2.pX+p2.pWidth>=screenRightEdge-screenLimit){
//   p2.playerHit=true;
//   } else{
//     p2.playerHit=false;
//   }
//   println(p2.playerHit);
// }
////for game screen one, won't keep forever
//Tree tree1= new Tree(600, 45, 1);
//Tree tree2= new Tree(320, 45, 1);
////stuff from tree and coin class with old local speed variables
//     float coinSpeed;
//coinSpeed=0;
//  coinSpeed=1;
//coinY=coinY-coinSpeed;
//coinSpeed=coinSpeed+scrollAccel;
//tSpeed=0;
//tSpeed=1;
//tSpeed=tSpeed+scrollSpeed;
//tY=tY-tSpeed;
//float [] snowFallXs=new float[numOfSnowflakes];
////old stuff from player display with animation
//if (playerHit) {//(fallLeft||fallRight) {
//  println("should say how long is player hit?");
//  //if(fallLeft){
//  //  float tempX=pX;
//  // pX=tempX+10;
//  // if(pX>=tempX+20){
//  // pX=tempX+1;
//  // }
//  //animTimer=millis();
//  fill(240, 100, 0);
//  text("how long is player hit?", width/2, height/2);
//  //animTimer=millis();
//  //beenHit();
//  //if (millis()-animTimer<=3000) { 
//  // pSpeedX=0;
//  //} else if (millis()-animTimer>3000) {
//  //if (keyPressed&&key=='g') {
//  //  pSpeedX=1; 

//  //}
//if (!playerHit) {
//if (!fallLeft&&!fallRight&&!playerHit) {
//rectMode(CENTER);
//  if(screenScrollSpeed>=9){
//  println("too much");
//  screenScrollSpeed=5;
// scrollAccel=0; 
//}
////////////////////////////////////






////////////////////////////////
//  void levels() {
//  if (!levelsWon[0]) {
//    levelOne("Level 1", 5, 5, 50);
//  } else {
//    text("beeeeech you won!!!", 450, 300);
//    text("press space to go to the next level", 450, 400);
//    if (keyPressed&&key==' ') {      
//      if (levelsWon[0]) {
//        levelTwo();
//      }
//    }
//  }
//} //levels end
//////values that differ from level to level
//String levelMessage
//specialNumberLimit
//accelLimit
//screenLimit


//void levelOne(String message, int levelLengthLim, float speedLim, float screenLim) { //or do an unpit of the boolean array(?) and each different input gives you a new level
//  levelMessage=message;
//  specialNumber=levelLengthLim;
//  screenLimit=screenLim;
//  accelLimit=speedLim;
//  //if (specialNumber>=levelLengthLim) {
//  //  println("level ended"+levelLengthLim+"="+specialNumber);
//  //  gameIsRunning=false;
//  //  levelsWon[0]=true;
//  //}
//  //text(
//  //specialNumberLimit=levelEnders[0]; //we'll see if this works
//}
//void levelTwo() {
//  levelMessage="Level 2";
//  screenLimit=60;
//  accelLimit=6.5;
//  specialNumberLimit=10;
//}
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
////}
//void restartLevel() { //might not need...
//  //might need to connect to which level it is
//  me.reset();
//}
///////
//sky at top of the screen at beginning
//noStroke();
//if(skyY>=-290){
//fill(0);
//rect(0,skyY,width,290);
//}
//me.playerHit=false;
//run loops backwards...hopefully it doent effect anything else, otherwise ill have to make separate backwards loops for removing and then a forwards loop for everything else like display and all that...hpefully not
//running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
//loop to remove old trees
//make sure to backwards
////stuff for levels--goes right before the display stuff in tree loop
//if (!treeClone.onscreen&&me.living==true) {
//  specialNumber=specialNumber+1;
//}
//println(specialNumber);

//for (int s=0; s<levelEnders.length; s++) {
//  if (specialNumber>=levelEnders[0]) { //without for loop it's specialNumberLimit  println("You Won!");  gameIsRunning=false;
//    println("You Won!");
//    gameIsRunning=false;
//    //levelsWon[0]=true;
//  }
//}
//if (keyPressed&&key==' ') {
//}
////oter random stuff
//    fill(0);
//textSize(30);
//text("hit bool "+playerHitG, 450, 300); 
//println(treesPassed(me, treeClone));
// treeClone.treesPassed(me);
//println(treeClone.numOfTreesPassed);
//don't really need a different numebr of trees, just different spacing, plus I don;t think the for loops will wokr if it's changed form setup to draw
//int specialNumber; //My BABY I LOVE you!!!!!
////values that differentiate levels form each other
//String levelMessage;
//int specialNumberLimit=7;
////everything else
//int [] levelEnders={10,20,30}; // 15, 20, 25};
//int xSpacing=200; //the amount of space between trees...Don't really need anymore, though when I make an algorithm for the distances between trees i might
//long levelTimer;
//long levelStartingTime;
//int numOfTreesPassedG=0;
//will probably replace with width and height
//array of the booleans that, when true, mean you have won a level
//boolean [] levelsWon= new boolean[2];
//boolean that determines if the game is running
/////stuff from caSE 4
//break;
//  case 4: //level  mode
//  levelOne("Level 1", 5, 5, 50);
//  gameRunning();
//  textAlign(CENTER);
//  textSize(70);
//  fill(0);
//  text(levelMessage, 450, 70);
//  //if (specialNumber>=specialNumberLimit) {
//  //  levelsWon[0]=true;
//  //  println("level's end!");
//  //}
//  //for (int n=0; n<levelEnders.length; n++) {
//  //  if (specialNumber>=levelEnders[n]) {
//  //    levelsWon[n]=true;
//  //    println("level's end!");
//  //  }
//  //}
//  ////went at top
//      ////for (int b=0; b<levelsWon.length; b++) {
//  //  //levelsWon[b]=false;
//  //  if (!levelsWon[0]) { //set these equal to these
//  //println("level 1 is ongoing");
//  //    scrollSpeed=0.005;
//  //    numOfTrees=4;
//  //    numOfCoins=numOfTrees;
//  //    screenLimit=50;
//  //  } else if (levelsWon[0]){
//  //      println("level 1 is won");
//  //    scrollSpeed=0.002;
//  //    numOfTrees=5;
//  //    numOfCoins=numOfTrees;
//  //    screenLimit=60;
//  //  }
////stuff from case 3
//forloop for ammoiutnoflevels the first one is the amount of actual millisseconds...
//levelStartingTime=millis();
//levelTimer=levelStartingTime/millis()+1;
//adventureTime();
//println(levelStartingTime);
//if(levelTimer>=5000){
//println("level one won!"); 
//textSize(50);
//text("millis(): "+millis(),width/2,height/2);
//text("levelStartingTime "+levelStartingTime,width/2,height/2+50);
//text("levelTimer: "+levelTimer,width/2,height/2+100);
// }


//  //}
//maybe an affect of, instead of a timr, o the screen slidng up an theres the rest of teh text
//me.display();
//me.moveSideways(); //apparently I don't actually need a keypressed...
//me.moveDownManual();
//me.decreaseHealth();
//me.moveDownAuto();
//me.beenHit();
////triangles that are suppsoed to help with teh illusion that it's 3d
//triangle(0, 180, 4*width/5, height, 0, height);
//fill(230,230,250);
//triangle(0, 150, width-400, height, 0, height);
//for (int b=0; b<levelsWon.length; b++) {
//  levelsWon[b]=false;
//  if (!levelsWon[b]) { //set these equal to these
//    //scrollSpeed=0.001;
//    //numOfTrees=4;
//    //numOfCoins=numOfTrees;
//    //screenLimit=50;
//  } if (levelsWon[0]&&!levelsWon[1]){
//    //scrollSpeed=0.002;
//    //numOfTrees=5;
//    //numOfCoins=numOfTrees;
//    //screenLimit=60;
//  }
//}
//important code for booleans that determine which leel you are on--maybe should go in setup
//for (int b=0; b<levelsWon.length; b++) {
//  levelsWon[b]=false;
//  if (!levelsWon[0]) { //set these equal to these

//    scrollSpeed=0.001;
//    numOfTrees=4;
//    numOfCoins=numOfTrees;
//    screenLimit=50;
//  } else if (levelsWon[0]){
//      println("level 1 is won");
//    scrollSpeed=0.002;
//    numOfTrees=5;
//    numOfCoins=numOfTrees;
//    screenLimit=60;
//  }
//}
//for (int b=0; b<levelsWon.length; b++) {
//  levelsWon[b]=false;
//  if(levelsWon[1]){ //set these equal to these

//  }
//}
//'T', 'r', 'e', 'a', 'c', 'h', 'e', 'r', 'o', 'u', 's', ' ', 'T', 'u', 'n', 'd', 'r', 'a'
//case 1:
//background(255);
//snow storm
//snowStorm(numOfSnowflakes);
//textSize(45);
//fill(0);
//text("FOR ADVENTURE MODE, PRESS 'A'", width/2, height/2);
//text("FOR TUTORIAL, PRESS 'T'", width/2, height/2+100);
//if (keyPressed&&key=='t') {
//  gameScreen=2;
//} else if (keyPressed&&key=='a') {
//  gameScreen=3;
//}
//break;
//tutorial page
//I should make it the top, not the center...
//if width = 10 and height = ten and center = center of screen
//top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
//top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
//////////////////////old shit form player class
//void levelLengthChecker() {
//}
//int decreaseLives() {
//  for (int l=0; l<numOfLives.length; l++) {
//    if (numOfLives[l]>0&&playerHit) {
//      return(numOfLives[l-1]);
//    } //else if(numOfLives[l]==0 &&playerHit){
//  }

//}
//int decreaseHealthNum() {
//  for (int p=0; p<100; p++) {
//    if (playerScore==(p+1)*10) {
//      return 1;
//    }
//  }
//  if (playerHit) {
//    return -1;
//  } else {
//    return 0;
//  }
//  //if (playerHealth<=0) {
//  //  living=false;
//  //}
//}
//  void beenHit() { //should be in an "if tree.collision==true statement"

//  //if (playerHit) {
//  //pX=pX*-1;
//  startAngle-=incAngle; 
//  if (startAngle<=-90) {
//    incAngle=0;
//    startAngle=0;
//  }
//  pushMatrix();
//  translate((pX+50), pY);
//  //rotate(radians(startAngle));
//  //rectMode(CENTER);
//  fill(240, 100, 0);
//  noStroke();
//  rect(0, 0, pWidth, pHeight);
//  popMatrix();
//  //pushMatrix();
//  //translate(pX, pY);
//  //rotate(radians(startAngle));
//  //rectMode(CENTER);
//  //fill(240, 100, 0);
//  //noStroke();
//  //rect(0, 0, pWidth, pHeight);
//  //popMatrix();
//  ////if(startAngle>=radians(180)){
//  //startAngle=0;
//  ////}
//  //playerHealth-=1;
//  //}
//}
//void moveDownAuto() { //I don't need this unless I die really
//  pY=pY+pSpeedY;
//  pSpeedY=pSpeedY+scrollSpeed;
//  if (pY>=600-pHeight/2) {
//    pSpeedY=0;
//    textAlign(LEFT);
//    textSize(50);
//    text("you have reached the bottom!", 0, height/2);
//  }
//}
//void playerHasBeenHit() {
//if (playerHitG){

//}
//  //        if (pX<=screenLimit) { 
//  //  playerHit=true;
//  //  //fallRight=true;
//  //}
//  //if (pX+pWidth>=screenRightEdge-screenLimit) {
//  //  playerHit=true;
//  //  //fallLeft=true;
//  //} 
//  if(playerHit){
//    pSpeedX=0;
//    println("has been hit");
//  }
//  println(playerHit);
//else{
    //    p2.loseHealth=false;
    //  }
    //p2.xDirection=-1;
    //if (p2.xDirection==1) {
    //  println("xDir is 1");
    //  //p2.pX=tX+tWidth/2+20+p2.pWidth/2;
    //}
    //if (p2.xDirection==-1||p2.xDirection==0) {
    //  println("xDir is 0 or -1"+p2.xDirection);
    //}
    //println(p2.playerHitL);
    //if(p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<tX){
    //println("leftCol");
    //p2.pSpeedX=0;
    //p2.xDirection*=-1;
    //} else 
    //if (playerHit){
    //if(fallLeft){
    //pSpeedX=1;
    //} else if(fallRight){
    // pSpeedX=-1; 
    //} else{
    //pSpeedX=0;
    //println("else");
    //}

    //if (fallLeft) {
    //  println("should fall left");
    //  float tempXL=pX;
    //  pSpeedX=1;
    //  if (pX>=tempXL+20) {
    //    pSpeedX=1;
    //  }
    //} else if (fallLeft) {
    //  println("should fall right");
    //  float tempXR=pX;
    //  pSpeedX=-1;
    //  if (pX<=tempXR-20) {
    //    pSpeedX=-1;
    //  }
    ////} 
    //}else if (!living) {
    //  pSpeedX=0;
    //}

    //println(playerHit);
    //    p2.pColor=color(255,0,0);
    //  //}
    //} else if (p2.pX+p2.pWidth<=tX-tWidth/2||p2.pX>=tX+tWidth/2||p2.pY+p2.pHeight<=tY||p2.pY>=tY+tHeight){
    //  p2.playerHitL=false;
    //  p2.pColor=color(240, 100, 0);
    //}
