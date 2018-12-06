////Tree object

//tree object definition
class Tree {
  float treePosX;
  float treeWidth;
  float treePosY;
  float treeHeight;
  float treeShift1;
  color treeColor;
  float treeSpeed;

  //tree object constructor
  Tree(float x, float y, float tWidth, float tHeight) {
    treePosY = y;
    treePosX = x;
    treeWidth = tWidth; //10 is a good value
    treeHeight = tHeight; //110 is also
    treeShift1 = treeHeight*0.5;
    treeColor=color(0, random(40, 215), 0);
    treeSpeed=1;
  }

  //properties
  //trying to get the tree to be made out of my super-awesome triangle method for triangles so I can resize it easier
  void display() {
    //all the trees are the same width at the bottom
    fill(treeColor);
    noStroke();
    upTriangle(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //whole tree leaves
    upTriangle(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight*0.75); //middle tree leaves
    upTriangle(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight*0.5); //top tree leaves
    //tree trunk
    rectMode(CENTER);
    stroke(102, 51, 0);
    strokeWeight(5);
    fill(102, 51, 0);
    rect(treePosX, treePosY+110, treeWidth/8, 10);
  }
  void flash() {
    fill(0, random(40, 215), 0);
  }
  void scrollUp() { //I said scrollDOwn lol but it's going up...*facepalm*
    treePosY=treePosY-treeSpeed;
    //maybe make something like treePSeedPLaceolder = running treeSPeed before pause and if x happens (the game is unpaused) running tree speed = treeSpeedPALceholder
    //or soemthing really weird..to pause, treePosY=treePosY-treeSpeed+treeSpeed;, which apparently doesn't work 
    treeSpeed=treeSpeed+0.001;
    if (treePosY<=0) {
      //println("limit reached!");
    }
  }
  void pause() {
    treeSpeed=0;
  }
  void reWrap() {
    //since the the trees are going up, once they equal zero they're going to go to 600 
    treePosY=600;
  }
  void treeCollide() { //I wonder if I need to make the paleyr in input like in my flappy bird game...we'll see
    //maybe if, when hitting the tree headon, I make it not colide until you reach almost the base of the tree would be more 3-d...
  }
  void displayOld() { //old display method
  rectMode(CENTER);



  //tree top of first tree
  strokeWeight(2);
  noStroke();
  fill(treeColor);
  //fill(0, random(40, 215), 0); //color of tree leaves
  //treePos- X and Y is the top, treePosX-20, treePosY+treeHeight*something is the left bottom and treePosX+20, treePosY+treeHeight*something is the irght bottom
  //the width of the base is 40, the height is treeHeight (duh!), the middle is treeHeight/2+treeY
  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight, treePosX+20, treePosY+treeHeight); //bottom of tree leaves
  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.75, treePosX+20, treePosY+treeHeight*0.75); //middle of tree leaves
  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.5, treePosX+20, treePosY+treeHeight*0.5);  //top of tree leaves
    //tree trunk
  stroke(102, 51, 0);
  strokeWeight(5);
  fill(102, 51, 0);
  rect(treePosX, treePosY+treeHeight, treeWidth/8, 20);
}
}
