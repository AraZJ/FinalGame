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
