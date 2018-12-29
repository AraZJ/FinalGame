////Tree object
//tree object definition
class Tree {
  float tX;
  float tWidth;
  float tY;
  float tHeight;
  color treeColor;
  float trunkHeight;
  boolean onscreen; //I made this one opposite the onefor coins to avoid confusing myself as much
  boolean resetTrees;
  //tree object constructor
  Tree(float x, float y, float expandValue) {
    resetTrees=false;
    tY = y;
    tX = x;
    tWidth = 60*expandValue; //40 is a good value
    tHeight = 150*expandValue; //110 is a good value
    trunkHeight=tHeight/15;
    treeColor=color(0, random(40, 215), 0);
    onscreen=true;
  }
  //properties
  void display() {
    //tree top
    fill(treeColor);
    noStroke();
    upTriangle(tX, tY, tWidth, tHeight); //whole tree top ////tX and tY are the topmost points, tX-width/2, tY+tHeight would be the bottom left and tX+width/2, tY+tHeight is the bottom right  
    upTriangle(tX, tY, tWidth, tHeight*0.75); //middle tree leaves
    upTriangle(tX, tY, tWidth, tHeight*0.5); //top tree leaves
    //tree trunk
    rectMode(CORNER);
    noStroke();
    fill(102, 51, 0);
    rect(tX-tWidth/12, tY+tHeight, tWidth/6, trunkHeight);
  }
  //scrolls up at the rate of the global variables screenScrollSpeed and scrollAccel
  void scrollUp() {
    //screenScrollSpeed=screenScrollSpeed+scrollAccel;
    tY=tY-screenScrollSpeed;
  }
  //collide method that makes the player bounce away from the trees, slows down the speed and makes the counting value negative when they collide (call it a feature; it makes the game more obnoxiouss to constantly be bouncing and sliding around)
  void playerTreeCollide(Player p2) { //it's p2 becaue it got really tiring to type something longer over and over again
    if (p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<=tX+tWidth/2&&p2.pY+p2.pHeight>=tY&&p2.pY<=tY+tHeight) { //the conditions for a collision to have been made--taken from https://happycoding.io/tutorials/processing/collision-detection because I'm out of luck with collision methods
      if (p2.xDirection==-1) { //if the player hits the tree coming from the left or the leftmost half of the top...
        p2.pX=tX+tWidth/2+40; //bounce to the right
        p2.counterAmount=-1; //makes the counting number negative whenever a player hits a tree
        p2.pSpeedX=1;
      } else if (p2.xDirection==1) { //if the player hits the tree coming from the right or the rightmost half of the top...
        p2.pX=tX-tWidth/2-p2.pWidth-40; //bounce to the left
        p2.counterAmount=-1; //makes the counting number negative whenever a player hits a tree
        p2.pSpeedX=1;
      }
    }
  }
}
