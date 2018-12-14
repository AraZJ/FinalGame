////Tree object

//tree object definition
class Tree {
  float tX;
  float tWidth;
  float tY;
  float tHeight;
  color treeColor;
  float trunkHeight;
  boolean onscreen; //I'm sorry I made the onscreen/offscreen so inconsistant

  //tree object constructor
  Tree(float x, float y, float expandValue) {
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
    screenScrollSpeed=screenScrollSpeed+scrollAccel;
    tY=tY-screenScrollSpeed;
  }
  //super unconventional collide method that makes the player bounce away from the trees when it hits them and makes the countdown negative whenever a tree is hit
  //I couldn't figure out how to make the playerIsHit variable stop being true after the player was no longer touching a tree, so I went in a completely different direction and made this instead
  void playerTreeCollide(Player p2) { //it's p2 becaue it got really tiring to type something longer over and over again
    if (p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<=tX+tWidth/2&&p2.pY+p2.pHeight>=tY&&p2.pY<=tY+tHeight) { //I think this collide part was the problem before but I ran out of time to try to fix it
      if (p2.xDirection==-1||p2.xDirection==0) { //if the player hits the tree coming from the left, the leftmost half of the top or straight on from the top...
        p2.pX=tX+tWidth/2+40; //bounce to the right
        p2.countdownAmount=-1; //makes the countdown number negative whenever a player hits a tree
      } else if (p2.xDirection==1) { //if the player hits the tree coming from the right or the rightmost half of the top...
        p2.pX=tX-tWidth/2-p2.pWidth-40; //bounce to the left
        p2.countdownAmount=-1; //makes the countdown number negative whenever a player hits a tree
      }
    }
  }
}
