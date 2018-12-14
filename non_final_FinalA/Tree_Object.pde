////Tree object

//tree object definition
class Tree {
  float tX;
  float tWidth;
  float tY;
  float tHeight;
  float treeShift1;
  color treeColor;
  float trunkHeight;
  boolean onscreen;
  float treeLeft;
  float treeRight;
  //boolean onscreen/remove

  //tree object constructor
  Tree(float x, float y, float expandValue) { //500, 350, 40, 110 //float tWidth, float tHeight, 
    tY = y; //random(110,490);//
    tX = x; //random(20,880); 
    tWidth = 60*expandValue; //40 is a good value
    tHeight = 150*expandValue; //110 is a good value
    trunkHeight=tHeight/15;
    treeShift1 = tHeight*0.5;
    treeColor=color(0, random(40, 215), 0);
    onscreen=true;
    treeLeft=tX-tWidth/2;
    treeRight=tX+tWidth/2;
    //boolean spawns as false
  }

  //properties
  //trying to get the tree to be made out of my super-awesome triangle method for triangles so I can resize them easier
  void display() {
    //all the trees are the same width at the bottom
    fill(treeColor);
    noStroke();
    upTriangle(tX, tY, tWidth, tHeight); //whole tree leaves ////tX and tY are the topmost points, tX-width/2, tY+tHeight would be the bottom left and tX+width/2, tY+tHeight is the bottom right  
    upTriangle(tX, tY, tWidth, tHeight*0.75); //middle tree leaves
    upTriangle(tX, tY, tWidth, tHeight*0.5); //top tree leaves
    //tree trunk
    rectMode(CORNER);
    noStroke();
    fill(102, 51, 0);
    rect(tX-tWidth/12, tY+tHeight, tWidth/6, trunkHeight); //gonna need something different
  }
  void flash() { //what the hell is this??? Oh wait, is it for new colors??
    fill(0, random(40, 215), 0);
  }
  void scrollUp() { //I said scrollDOwn lol but it's going up...*facepalm*
    if (gameIsRunning) {
      //screenScrollSpeed=2;
      //screenScrollSpeed=screenScrollSpeed+scrollAccel;
      controlSpeed();
      tY=tY-screenScrollSpeed;

      //maybe make something like treePSeedPLaceolder = running treeSPeed before pause and if x happens (the game is unpaused) running tree speed = treeSpeedPALceholder
      //or soemthing really weird..to pause, tY=tY-treeSpeed+treeSpeed;, which apparently doesn't work
    }
  }
  void reset() { //since I don't really need this, maybe this can be for randomizing the tree's distances and making them not too close, for later leels at least, or no, making them equal distances! like rows...and then for later levels when we want more than 1 in a clsoer row we'll just make the distances smaller, find a way to have everythig happen twice, like running a for loop by two, or add more than 1 arraylsit
    //since the the trees are going up, once they equal zero they're going to go to 600 
    tY=600;
  }
  void playerTreeCollide(Player p2) { //I wonder if I need to make the paleyr in input like in my flappy bird game...we'll see
    if (p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<=tX+tWidth/2&&p2.pY+p2.pHeight>=tY&&p2.pY<=tY+tHeight) {
        p2.playerHitL=true;
      //if(p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<tX){
        //println("leftCol");
        //p2.pSpeedX=0;
        //p2.xDirection*=-1;
        p2.pColor=color(255,0,0);
      //}
    } else if (p2.pX+p2.pWidth<=tX-tWidth/2||p2.pX>=tX+tWidth/2||p2.pY+p2.pHeight<=tY||p2.pY>=tY+tHeight){
      p2.playerHitL=false;
      p2.pColor=color(240, 100, 0);
    }
  }
  boolean pTCollideB(Player p2) { //I wonder if I need to make the paleyr in input like in my flappy bird game...we'll see
    if (p2.pX+p2.pWidth>=tX-tWidth/2&&p2.pX<=tX+tWidth/2&&p2.pY+p2.pHeight>=tY&&p2.pY<=tY+tHeight) {
      return true;
    } 
    //else if(p2.pX<=screenLimit||p2.pX+p2.pWidth>=screenRightEdge-screenLimit){
    //return true;
    else {
      return false;
    }
  }
  //void diagonalSlide() {
  //}
}
