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
