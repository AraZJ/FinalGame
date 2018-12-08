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
  float treeTrunkHeight;
  boolean collision;
  boolean onscreen;
  //boolean onscreen/remove

  //tree object constructor
  Tree(float x, float y, float expandValue) { //500, 350, 40, 110 //float tWidth, float tHeight, 
    treePosY = y; //random(110,490);//
    treePosX = x; //random(20,880); 
    treeWidth = 40*expandValue; //40 is a good value
    treeHeight = 100*expandValue; //110 is a good value
    treeTrunkHeight=treeHeight/15;
    treeShift1 = treeHeight*0.5;
    treeColor=color(0, random(40, 215), 0);
    treeSpeed=1;
    collision=false;
    //boolean spawns as false
  }

  //properties
  //trying to get the tree to be made out of my super-awesome triangle method for triangles so I can resize them easier
  void display() {
    //all the trees are the same width at the bottom
    fill(treeColor);
    noStroke();
    upTriangle(treePosX, treePosY, treeWidth, treeHeight); //whole tree leaves
    upTriangle(treePosX, treePosY, treeWidth, treeHeight*0.75); //middle tree leaves
    upTriangle(treePosX, treePosY, treeWidth, treeHeight*0.5); //top tree leaves
    //tree trunk
    rectMode(CENTER);
    noStroke();
    fill(102, 51, 0);
    rect(treePosX, treePosY+treeHeight+treeTrunkHeight/2, treeWidth/6, treeTrunkHeight); //gonna need something different
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
  void treeCollide(Player thePlayer) { //I wonder if I need to make the paleyr in input like in my flappy bird game...we'll see
    //maybe if, when hitting the tree head on, I make it not collide until you reach almost the base of the tree would be more 3-d...
    //if the left part of the player hits the right of a tree
    if (thePlayer.pX-thePlayer.pWidth/2==treePosX+treeWidth/2) {
      println("left side player collision!");
      collision=true;
    }
    //right side of player on left
    //might need to make a loop that makes sure the trees are between all the other trees before they can be compared witht eh others
    if (thePlayer.pX+thePlayer.pWidth/2==treePosX-treeWidth/2) {
      println("right side player collision");
      collision=true;
    }
  }
}
